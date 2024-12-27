//==========================================================================
// mandelbrot.cpp
//==========================================================================
// @brief: An implementation for computing the mandelbrot set

#include "mandelbrot.h"

//----------------------------------------------------------
// Top function
//----------------------------------------------------------

void dut(hls::stream<bit32_t> &strm_in, hls::stream<bit32_t> &strm_out) {
  /*

    Reads a series of hls_stream inputs and writes these values to outputs

  */

  // Read input stream - don't care what it is, just for synchronization
  strm_in.read();

  // Output array for mandelbrot
  bit4_t mandel_out[H/2][W];

  // Call mandelbrot
  mandelbrot_compute(mandel_out);

  // Write output value
  int count = 0;
  bit32_t send_val;
  LOOP_DUT:
  for (int r = 0; r < H/2; r++) {
    for (int c = 0; c < W; c++) {

      // Each output is 4b, have 32b strm_out
      // Can pack 8 outputs into one strm_out

      // If count = 8, send this output line and reset count
      if (count == 7) {
        strm_out.write( send_val );
        count = 0;
      }
      
      // Update send_val
      send_val(31-(count << 2), 28-(count << 2)) = mandel_out[r][c];
      count++;
    }
  }

  // Send remaining output values (if they exist)
  strm_out.write(send_val);

}

void remap_output(bit10_t count_arr[H/2][W],bit4_t output[H/2][W]){
  /*
  This code takes the previously computed old output array (count_arr)
  and converts this to output count values. 

  Inputs:
  bit10_t count_arr --> Represents iteration which the sequence converges.

  Output:
  bit4_t output --> corresponding to mandelbrot colours. 
  
  */
  bit4_t temp_val;
  #pragma HLS ARRAY_PARTITION variable=output cyclic factor=8 dim=2
  LOOP_OP_MAP:
  for (int r=0; r < H/2; r++){
    for (int c=0; c<W;c++){
      #pragma HLS pipeline

      bit10_t count = count_arr[r][c];

      if (count >= max_iterations) {
          // pos_set[r][c] = 1;
          temp_val = 0;
      }
      else if (count >= (max_iterations >> 1) ) {
        temp_val = 1;
      }
      else if (count >= (max_iterations >> 2) ) {
        temp_val = 2;
      }
      else if (count >= (max_iterations >> 3) ) {
        temp_val = 3;
      }
      else if (count >= (max_iterations >> 4) ) {
        temp_val = 4;
      }
      else if (count >= (max_iterations >> 5) ) {
        temp_val = 5;
      }
      else if (count >= (max_iterations >> 6) ) {
        temp_val = 6;
      }
      else if (count >= (max_iterations >> 7) ) {
        temp_val = 7;
      }
      else {
        temp_val = 8;
      }
      output[r][c] = temp_val;
    
    }

  }
}


void compute_tiles(int r,int c,signed32_t Z_re[H/2][W],signed32_t Z_im[H/2][W],bit10_t count_arr[H/2][W],bit10_t count){

    /*
    This runs the core logical compute for calculating whether or not a particle converges 

    Inputs:  
      bit10_t count_arr[H/2][W] --> Array which stores which iteration the output converges on. 
      bit10_t count --> corresponds to the current loop which we do the compute for. 
      int r --> corresponds to the base row which we use for computing mandelbrot values. Will access a window of r+r_tile for the row span. 
      int c --> corresponds to the current active column which is under test. 

    Output: 
      count_arr[H/2][W] -->  this gets overwritten with the maximal value of count
      Z_im --> this value gets updated based on the relevant mandelbrot calculation value
      Z_re --> writes the value of Z_re post computation.


    */
    #pragma HLS INLINE

    signed32_t C_im_pixel;
    signed32_t C_re_pixel;

    // loops over each pixel in tile sequentially
    LOOP_TILE_OUT:
    for (int r_tile = 0; r_tile < tile_row; r_tile++) {
        for (int c_tile = 0; c_tile < tile_col; c_tile++) {
            // Calculate row and column indices used for the pixel
            int r_step = r + r_tile;
            int c_step = c + c_tile;
            C_re_pixel = -2 + c_step * re_incr;
            C_im_pixel = 1 - r_step * im_incr;

            // Checks if the pixel value converges.
            if ((Z_re[r_step][c_step] * Z_re[r_step][c_step] +
                Z_im[r_step][c_step] * Z_im[r_step][c_step]) >= 4) {
                  // maps the value of count_arr to it's previous value if the iteration is found to be not 0. 
                count_arr[r_step][c_step] = (count_arr[r_step][c_step] == max_iterations) ? count : count_arr[r_step][c_step];
            }
            else{
            // Compute the new Z values
            signed32_t Z_im_prev = Z_im[r_step][c_step];
            Z_im[r_step][c_step] = (Z_re[r_step][c_step] * Z_im[r_step][c_step])*2 + C_im_pixel;

            Z_re[r_step][c_step] = (Z_re[r_step][c_step] * Z_re[r_step][c_step]) -(Z_im_prev * Z_im_prev) + C_re_pixel;


            }
        }
    }

}


//----------------------------------------------------------
// Mandelbrot
//----------------------------------------------------------
// @param[out] : output value (0=black,)
void mandelbrot_compute(bit4_t output[H/2][W]) {
  /*
  Computes the output
  
  */

  // Keep track of real and imaginary parts of Z and C
  signed32_t Z_re[H/2][W], Z_im[H/2][W], C_re, C_im;
  signed32_t C_im_pixel;
  signed32_t C_re_pixel;


  // Also keep track of which outputs have already been set
  bit10_t count_arr[H/2][W];


  // Runs all array partitions, we partition by tile_row and tile_col sizes accordingly
  #pragma HLS ARRAY_PARTITION variable=count_arr cyclic factor=tile_row dim=1
  #pragma HLS ARRAY_PARTITION variable=count_arr cyclic factor=tile_col dim=2

  #pragma HLS ARRAY_PARTITION variable=Z_im cyclic factor=tile_row dim=1
  #pragma HLS ARRAY_PARTITION variable=Z_im cyclic factor=tile_col dim=2

  #pragma HLS ARRAY_PARTITION variable=Z_re cyclic factor=tile_row dim=1
  #pragma HLS ARRAY_PARTITION variable=Z_re cyclic factor=tile_col dim=2

  // Initialize the Z and position set variables
  LOOP_INIT_MEM:
  for (int r = 0; r < H/2; r++) {
    for (int c = 0; c < W; c++) {
      Z_re[r][c] = 0;
      Z_im[r][c] = 0;
      count_arr[r][c] = max_iterations;
    }
  }

  // Calculate the number of iterations
  LOOP_MANDELBROT:
  for (bit10_t count = 0; count <= max_iterations; count++) {
      // Initialize real and imaginary parts of C
      C_im = 1;
      // Iterate over each tile, incrementing by stride tile_row
      for (int r = 0; r < H / 2; r += tile_row) {
          for (int c = 0; c < W; c += tile_col) {
              #pragma HLS pipeline 
              // compute pixel values on each tile 
              compute_tiles(r,c,Z_re,Z_im,count_arr,count);
          }
        // Decrement C_im after completing a tile row
        C_im -= im_incr * tile_row;

      }
  }
  // helps in mapping the values of count_arr to desired outputs.
  remap_output(count_arr,output);
}
