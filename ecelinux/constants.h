//===========================================================================
// constants.h
//===========================================================================
// @brief: This header file include the parameters for Mandelbrot computation

#ifndef CONSTANTS
#define CONSTANTS

#include "typedefs.h"

// Picture Constants
const int W = 300;
const int H = 200;
const int max_iterations = 1000;
const int tile_row = 5; // maps to 200
const int tile_col = 6; //maps to 300 
const signed32_t re_incr = 3./W; //0.01; // 3/640
const signed32_t im_incr = 2./H; //0.01; // 2/480


#endif
