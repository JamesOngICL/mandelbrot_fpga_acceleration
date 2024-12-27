//=========================================================================
// mandelbrot_test.cpp
//=========================================================================
// @brief: testbench for Mandelbrot set generation

#include <iostream>
#include <fstream>
#include "mandelbrot.h"
#include "timer.h"
#include <stdio.h>

using namespace std;

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

//------------------------------------------------------------------------
// Mandelbrot testbench
//------------------------------------------------------------------------

int main() {

  // HLS stream for communicating with the mandelbrot block
  hls::stream<bit32_t> mandelbrot_out;
  hls::stream<bit32_t> mandelbrot_in;

  bit4_t expected_vals[H/2][W];

  // Read expected values
  read_expected_output( expected_vals );
  float correct = 0.0;

  // Timer
  Timer timer("Mandelbrot Computation");
  timer.start();

  // Transmit start to dut function
  mandelbrot_in.write(1);

  // Call mandelbrot function
  dut(mandelbrot_in, mandelbrot_out);

  // Read outputs
  bit4_t output[H/2][W];
  int count = 0;
  bit32_t read_val = mandelbrot_out.read();

  for (int r = 0; r < H/2; r++) {
    for (int c = 0; c < W; c++) {

      // If count = 7, we've reached the end of this mandel_out
      if ( count == 7 ) {
        read_val = mandelbrot_out.read();
        count = 0;
      }

      // Check output values with expected values
      bit4_t generated_val = read_val(31-(count << 2), 28-(count << 2));
      if ( generated_val == expected_vals[r][c] ) {
        correct += 1;
      }
     
      count++;

    }
  }
 
  // Stop the timer
  timer.stop();

  // Calculate accuracy
  std::cout << "Accuracy: " << correct / (W*H/2) << std::endl;

  return 0;
}
