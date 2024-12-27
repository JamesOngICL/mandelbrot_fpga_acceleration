//===========================================================================
// typedefs.h
//===========================================================================
// @brief: This header defines the shorthand of several ap_uint data types.

#ifndef TYPEDEFS
#define TYPEDEFS

#include <ap_int.h>
#include <ap_fixed.h>

typedef bool bit;
typedef ap_fixed<25,5> signed32_t;
typedef ap_uint<32> bit32_t;
typedef ap_uint<4> bit4_t;
typedef ap_uint<16> bit16_t;
typedef ap_uint<10> bit10_t;

#endif
