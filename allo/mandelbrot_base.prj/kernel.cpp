
//===------------------------------------------------------------*- C++ -*-===//
//
// Automatically generated file for High-level Synthesis (HLS).
//
//===----------------------------------------------------------------------===//
#include <algorithm>
#include <ap_axi_sdata.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <hls_stream.h>
#include <math.h>
#include <stdint.h>
using namespace std;

extern "C" {

void store_res0(
  int32_t v0[225][300],
  int32_t v1[67500]
) {	//
  l_S_store_res0_store_res0_l_0: for (int store_res0_l_0 = 0; store_res0_l_0 < 225; store_res0_l_0++) {	//
    l_store_res0_l_1: for (int store_res0_l_1 = 0; store_res0_l_1 < 300; store_res0_l_1++) {	//
    #pragma HLS pipeline II=1 rewind
      int32_t v4 = v0[store_res0_l_0][store_res0_l_1];	//
      v1[((store_res0_l_0 * 300) + store_res0_l_1)] = v4;	//
    }
  }
}

void mandelbrot_compute(
  int32_t *v5
) {	// L2
  #pragma HLS interface m_axi port=v5 offset=slave bundle=gmem0
  int32_t buf0[225][300];	//
  float re_incr;	// L7
  re_incr = (float)0.000000;	// L8
  float im_incr;	// L13
  im_incr = (float)0.000000;	// L14
  float C_re;	// L19
  C_re = (float)-2.000000;	// L20
  float C_im;	// L23
  C_im = (float)1.000000;	// L24
  int32_t count;	// L25
  count = 0;	// L27
  float Z_re;	// L30
  Z_re = (float)0.000000;	// L31
  float Z_im;	// L34
  Z_im = (float)0.000000;	// L35
  l_S_r_0_r: for (int r = 0; r < 225; r++) {	// L36
    l_S_c_0_c: for (int c = 0; c < 300; c++) {	// L37
      count = 0;	// L39
      Z_re = (float)0.000000;	// L42
      Z_im = (float)0.000000;	// L45
      l_S_count1_0_count1: for (int count1 = 0; count1 < 1000; count1++) {	// L46
        float v17 = Z_re;	// L47
        float v18 = v17 * v17;	// L49
        float v19 = Z_im;	// L50
        float v20 = v19 * v19;	// L52
        float v21 = v18 + v20;	// L53
        bool v22 = v21 < (float)4.000000;	// L56
        if (v22) {	// L57
          float v23 = Z_im;	// L58
          int32_t v24 = v23;	// L59
          int32_t Z_im_prev;	// L60
          Z_im_prev = v24;	// L61
          float v26 = Z_re;	// L62
          float v27 = Z_im;	// L63
          float v28 = v26 * v27;	// L64
          float v29 = v28 * (float)2.000000;	// L67
          float v30 = C_im;	// L68
          float v31 = v29 + v30;	// L69
          Z_im = v31;	// L70
          float v32 = Z_re;	// L71
          float v33 = v32 * v32;	// L73
          int32_t v34 = Z_im_prev;	// L74
          int64_t v35 = v34;	// L75
          int64_t v36 = v35 * v35;	// L78
          float v37 = v36;	// L79
          float v38 = v33 - v37;	// L80
          float v39 = C_re;	// L81
          float v40 = v38 + v39;	// L82
          Z_re = v40;	// L83
          int32_t v41 = count1;	// L84
          count = v41;	// L85
        }
      }
      int32_t v42 = count;	// L89
      bool v43 = v42 >= 1000;	// L90
      if (v43) {	// L91
        buf0[r][c] = 0;	// L93
      } else {
        int32_t v44 = count;	// L98
        bool v45 = v44 >= 500;	// L99
        if (v45) {	// L100
          buf0[r][c] = 1;	// L102
        } else {
          int32_t v46 = count;	// L107
          bool v47 = v46 >= 250;	// L108
          if (v47) {	// L109
            buf0[r][c] = 2;	// L111
          } else {
            int32_t v48 = count;	// L116
            bool v49 = v48 >= 125;	// L117
            if (v49) {	// L118
              buf0[r][c] = 3;	// L120
            } else {
              int32_t v50 = count;	// L125
              bool v51 = v50 >= 62;	// L126
              if (v51) {	// L127
                buf0[r][c] = 4;	// L129
              } else {
                int32_t v52 = count;	// L134
                bool v53 = v52 >= 31;	// L135
                if (v53) {	// L136
                  buf0[r][c] = 5;	// L138
                } else {
                  int32_t v54 = count;	// L143
                  bool v55 = v54 >= 15;	// L144
                  if (v55) {	// L145
                    buf0[r][c] = 6;	// L147
                  } else {
                    int32_t v56 = count;	// L152
                    bool v57 = v56 >= 7;	// L153
                    if (v57) {	// L154
                      buf0[r][c] = 7;	// L156
                    } else {
                      buf0[r][c] = 8;	// L159
                    }
                  }
                }
              }
            }
          }
        }
      }
      float v58 = C_re;	// L168
      float v59 = re_incr;	// L169
      float v60 = v58 + v59;	// L170
      C_re = v60;	// L171
    }
    float v61 = C_im;	// L173
    float v62 = im_incr;	// L174
    float v63 = v61 - v62;	// L175
    C_im = v63;	// L176
    C_re = (float)-2.000000;	// L181
  }
  store_res0(buf0, v5);	//
}


} // extern "C"
