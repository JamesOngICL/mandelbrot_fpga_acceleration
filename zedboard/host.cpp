#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <math.h>
#include <assert.h>

#include <iostream>
#include <fstream>

#include "typedefs.h"
#include "timer.h"
#include "mandelbrot.h"

//------------------------------------------------------------------------
// Helper function for reading expected output
//------------------------------------------------------------------------

void read_expected_output(bit4_t expected_vals[H/2][W]) {
  std::ifstream infile("data/expected.dat");
  if (infile.is_open()) {
    for (int r = 0; r < H/2; r++) {
      for (int c = 0; c < W; c++) {
        infile >> expected_vals[r][c];
      }
    }
    infile.close();
  }
}

//--------------------------------------
// main function
//--------------------------------------
int main(int argc, char **argv) {
  // Open channels to the FPGA board.
  // These channels appear as files to the Linux OS
  int fdr = open("/dev/xillybus_read_32", O_RDONLY);
  int fdw = open("/dev/xillybus_write_32", O_WRONLY);

  // Check that the channels are correctly opened
  if ((fdr < 0) || (fdw < 0)) {
    fprintf(stderr, "Failed to open Xillybus device channels\n");
    exit(-1);
  }

  // Array to store expected results
  bit4_t expected_vals[H/2][W];

  // Timer
  Timer timer("mandelbrot on FPGA");

  // Intermediate Results
  int nbytes;
  int error = 0;
  float correct = 0.0;

  // Read expected values into array
  read_expected_output( expected_vals );

  //--------------------------------------------------------------------
  // Run it once without timer to test accuracy
  //--------------------------------------------------------------------
  std::cout << "Testing accuracy over 1 full rendering." << std::endl;

  // Send signal to accelerator
  bit32_t start_sig = 1;
  nbytes = write(fdw, (void *)&start_sig, sizeof(start_sig));
  assert(nbytes == sizeof(start_sig));

  // Receive data from the accelerator
  int count = 0;
  bit32_t output;
  nbytes = read(fdr, (void *)&output, sizeof(output));
  assert(nbytes == sizeof(output));

  for (int r = 0; r < H/2; r++) {
    for (int c = 0; c < W; c++) {

      // If count = 7, we've reached the end of this mandel_out
      if ( count == 7 ) {
        nbytes = read(fdr, (void *)&output, sizeof(output));
        assert(nbytes == sizeof(output));
        count = 0;
      }

      // Verify results
      bit4_t generated_val = output(31-(count << 2), 28-(count << 2));
      if ( generated_val == expected_vals[r][c] ) {
        correct += 1;
      }
      count++;

    }
  }

  // Calculate error rate
  std::cout << "Accuracy: " << correct / (W*H/2) << std::endl;

  //--------------------------------------------------------------------
  // Run it 5 times to test performance
  //--------------------------------------------------------------------
  std::cout << "Testing performance over 10 full renderings." << std::endl;
  timer.start();

  // Receive data from accelerator
  for (int n = 0; n < 10; n++) {

    // Send start signal to accelerator
    nbytes = write(fdw, (void *)&start_sig, sizeof(start_sig));
    assert(nbytes == sizeof(start_sig));

    // Read first data
    nbytes = read(fdr, (void *)&output, sizeof(output));
    assert(nbytes == sizeof(output));
    count = 0;

    for (int r = 0; r < H/2; r++) {
        for (int c = 0; c < W; c++) {

        // If count = 7, we've reached the end of this mandel_out
        if ( count == 7 ) {
            nbytes = read(fdr, (void *)&output, sizeof(output));
            assert(nbytes == sizeof(output));
            count = 0;
        }

        // Verify results
        bit4_t generated_val = output(31-(count << 2), 28-(count << 2));
        if ( generated_val == expected_vals[r][c] ) {
            correct += 1;
        }
        count++;

        }
    }
  }

  timer.stop();
  // total time wil be automatically printed upon exit.

  return 0;
}
