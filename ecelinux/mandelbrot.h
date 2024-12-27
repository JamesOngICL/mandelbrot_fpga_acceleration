//===========================================================================
// mandelbrot.h
//===========================================================================
// @brief: This header file defines the interface for the core functions.

#ifndef MANDELBROT_H
#define MANDELBROT_H
//#include "constants.h"
#include "constants.h"
#include <hls_stream.h>

// Top function for synthesis
void dut(hls::stream<bit32_t> &strm_in, hls::stream<bit32_t> &strm_out);

// Top function for mandelbrot computation
void mandelbrot_compute(bit4_t output[H/2][W]);

#endif