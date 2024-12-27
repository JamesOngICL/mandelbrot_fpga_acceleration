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
// Mandelbrot testbench
//------------------------------------------------------------------------

int main() {

  // HLS stream for communicating with the mandelbrot block
  hls::stream<bit32_t> mandelbrot_out;
  hls::stream<bit32_t> mandelbrot_in;

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

      // Get next output value
      bit4_t generated_val = read_val(31-(count << 2), 28-(count << 2));
      count++;

      output[r][c] = generated_val;

    }
  }
 
  // Stop the timer
  timer.stop();

  FILE *fp = fopen("display/result.csv", "w");
  for (int r = 0; r < H/2; r++) {
    for (int c = 0; c < W; c++) {
      fprintf(fp, "%d,", output[r][c].to_int());
    }
    fprintf(fp, "\n");
  }
  fclose(fp);

  return 0;
}
