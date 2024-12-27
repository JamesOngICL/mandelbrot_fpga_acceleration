
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

void pe(
  ap_int<10> v0,
  ap_int<10> v1,
  ap_fixed<30, 5> v2,
  ap_fixed<30, 5> v3,
  ap_fixed<30, 5> v4,
  ap_fixed<30, 5> v5,
  int8_t *v6
) {	// L3
  ap_fixed<40, 15> v7 = v1;	// L4
  ap_fixed<40, 15> v8 = v2;	// L5
  ap_fixed<40, 15> v9 = v7 * v8;	// L6
  ap_fixed<41, 16> v10 = v4;	// L7
  ap_fixed<41, 16> v11 = v9;	// L8
  ap_fixed<41, 16> v12 = v10 - v11;	// L9
  ap_fixed<30, 5> v13 = v12;	// L10
  ap_fixed<30, 5> C_im;	// L11
  C_im = v13;	// L12
  ap_fixed<40, 15> v15 = v0;	// L13
  ap_fixed<40, 15> v16 = v3;	// L14
  ap_fixed<40, 15> v17 = v15 * v16;	// L15
  ap_fixed<41, 16> v18 = v5;	// L16
  ap_fixed<41, 16> v19 = v17;	// L17
  ap_fixed<41, 16> v20 = v18 + v19;	// L18
  ap_fixed<30, 5> v21 = v20;	// L19
  ap_fixed<30, 5> C_re;	// L20
  C_re = v21;	// L21
  int32_t count2;	// L22
  count2 = 0;	// L24
  ap_fixed<30, 5> v24 = 0;	// L25
  ap_fixed<30, 5> Z_re;	// L26
  Z_re = v24;	// L27
  ap_fixed<30, 5> v26 = 0;	// L28
  ap_fixed<30, 5> Z_im;	// L29
  Z_im = v26;	// L30
  int8_t ans;	// L32
  ans = 0;	// L33
  ap_fixed<30, 5> v29 = 0;	// L34
  ap_fixed<30, 5> value;	// L35
  value = v29;	// L36
  ap_fixed<30, 5> v31 = 0;	// L37
  ap_fixed<30, 5> Z_im_prev;	// L38
  Z_im_prev = v31;	// L39
  l_S_count1_0_count1: for (int count1 = 0; count1 < 1000; count1++) {	// L40
  #pragma HLS pipeline II=2
    ap_fixed<30, 5> v34 = value;	// L41
    ap_fixed<57, 32> v35 = v34;	// L42
    ap_fixed<57, 32> v36 = 4;	// L44
    bool v37 = v35 < v36;	// L45
    if (v37) {	// L46
      int32_t v38 = count2;	// L47
      int32_t v39 = v38 + 1;	// L49
      count2 = v39;	// L50
      ap_fixed<30, 5> v40 = Z_im;	// L51
      Z_im_prev = v40;	// L52
      ap_fixed<30, 5> v41 = Z_re;	// L53
      ap_fixed<60, 10> v42 = v41;	// L54
      ap_fixed<30, 5> v43 = Z_im;	// L55
      ap_fixed<60, 10> v44 = v43;	// L56
      ap_fixed<60, 10> v45 = v42 * v44;	// L57
      ap_fixed<92, 42> v46 = v45;	// L58
      ap_fixed<92, 42> v47 = 2;	// L60
      ap_fixed<92, 42> v48 = v46 * v47;	// L61
      ap_fixed<93, 43> v49 = v48;	// L62
      ap_fixed<30, 5> v50 = C_im;	// L63
      ap_fixed<93, 43> v51 = v50;	// L64
      ap_fixed<93, 43> v52 = v49 + v51;	// L65
      ap_fixed<30, 5> v53 = v52;	// L66
      Z_im = v53;	// L67
      ap_fixed<30, 5> v54 = Z_re;	// L68
      ap_fixed<60, 10> v55 = v54;	// L69
      ap_fixed<30, 5> v56 = Z_re;	// L70
      ap_fixed<60, 10> v57 = v56;	// L71
      ap_fixed<60, 10> v58 = v55 * v57;	// L72
      ap_fixed<30, 5> v59 = Z_im_prev;	// L73
      ap_fixed<60, 10> v60 = v59;	// L74
      ap_fixed<30, 5> v61 = Z_im_prev;	// L75
      ap_fixed<60, 10> v62 = v61;	// L76
      ap_fixed<60, 10> v63 = v60 * v62;	// L77
      ap_fixed<61, 11> v64 = v58;	// L78
      ap_fixed<61, 11> v65 = v63;	// L79
      ap_fixed<61, 11> v66 = v64 - v65;	// L80
      ap_fixed<62, 12> v67 = v66;	// L81
      ap_fixed<30, 5> v68 = C_re;	// L82
      ap_fixed<62, 12> v69 = v68;	// L83
      ap_fixed<62, 12> v70 = v67 + v69;	// L84
      ap_fixed<30, 5> v71 = v70;	// L85
      Z_re = v71;	// L86
      ap_fixed<30, 5> v72 = Z_re;	// L87
      ap_fixed<60, 10> v73 = v72;	// L88
      ap_fixed<30, 5> v74 = Z_re;	// L89
      ap_fixed<60, 10> v75 = v74;	// L90
      ap_fixed<60, 10> v76 = v73 * v75;	// L91
      ap_fixed<30, 5> v77 = Z_im;	// L92
      ap_fixed<60, 10> v78 = v77;	// L93
      ap_fixed<30, 5> v79 = Z_im;	// L94
      ap_fixed<60, 10> v80 = v79;	// L95
      ap_fixed<60, 10> v81 = v78 * v80;	// L96
      ap_fixed<61, 11> v82 = v76;	// L97
      ap_fixed<61, 11> v83 = v81;	// L98
      ap_fixed<61, 11> v84 = v82 + v83;	// L99
      ap_fixed<30, 5> v85 = v84;	// L100
      value = v85;	// L101
    }
  }
  int32_t v86 = count2;	// L105
  bool v87 = v86 >= 1000;	// L106
  if (v87) {	// L107
    ans = 0;	// L108
  } else {
    int32_t v88 = count2;	// L112
    bool v89 = v88 >= 500;	// L113
    if (v89) {	// L114
      ans = 1;	// L116
    } else {
      int32_t v90 = count2;	// L120
      bool v91 = v90 >= 250;	// L121
      if (v91) {	// L122
        ans = 2;	// L124
      } else {
        int32_t v92 = count2;	// L128
        bool v93 = v92 >= 125;	// L129
        if (v93) {	// L130
          ans = 3;	// L132
        } else {
          int32_t v94 = count2;	// L136
          bool v95 = v94 >= 62;	// L137
          if (v95) {	// L138
            ans = 4;	// L140
          } else {
            int32_t v96 = count2;	// L144
            bool v97 = v96 >= 31;	// L145
            if (v97) {	// L146
              ans = 5;	// L148
            } else {
              int32_t v98 = count2;	// L152
              bool v99 = v98 >= 15;	// L153
              if (v99) {	// L154
                ans = 6;	// L156
              } else {
                int32_t v100 = count2;	// L160
                bool v101 = v100 >= 7;	// L161
                if (v101) {	// L162
                  ans = 7;	// L164
                } else {
                  ans = 8;	// L168
                }
              }
            }
          }
        }
      }
    }
  }
  *v6 = ans;	// L177
}

void store_res0(
  int8_t v102[100][300],
  int8_t v103[30000]
) {	//
  #pragma HLS array_partition variable=v102 complete dim=2

  l_S_store_res0_store_res0_l_0: for (int store_res0_l_0 = 0; store_res0_l_0 < 100; store_res0_l_0++) {	//
    l_store_res0_l_1: for (int store_res0_l_1 = 0; store_res0_l_1 < 300; store_res0_l_1++) {	//
    #pragma HLS pipeline II=1 rewind
      int8_t v106 = v102[store_res0_l_0][store_res0_l_1];	//
      v103[((store_res0_l_0 * 300) + store_res0_l_1)] = v106;	//
    }
  }
}

void mandelbrot_compute(
  int8_t *v107
) {	// L180
  #pragma HLS interface m_axi port=v107 offset=slave bundle=gmem0
  int8_t buf0[100][300];	//
  #pragma HLS array_partition variable=buf0 complete dim=2

  ap_fixed<30, 5> v109 = 0;	// L184
  ap_fixed<30, 5> re_incr;	// L185
  re_incr = v109;	// L186
  ap_fixed<30, 5> v111 = 0;	// L190
  ap_fixed<30, 5> im_incr;	// L191
  im_incr = v111;	// L192
  ap_fixed<30, 5> v113 = -2;	// L195
  ap_fixed<30, 5> C_re_const;	// L196
  C_re_const = v113;	// L197
  ap_fixed<30, 5> v115 = 1;	// L199
  ap_fixed<30, 5> C_im_const;	// L200
  C_im_const = v115;	// L201
  ap_int<10> r_temp;	// L203
  r_temp = 0;	// L204
  ap_int<10> c_temp;	// L205
  c_temp = 0;	// L206
  l_S_r_0_r: for (int r = 0; r < 100; r++) {	// L207
    ap_int<10> v120 = r;	// L208
    r_temp = v120;	// L209
    l_S_c_0_c: for (int c = 0; c < 300; c++) {	// L210
    #pragma HLS unroll factor=100
      ap_int<10> v122 = c;	// L211
      c_temp = v122;	// L212
      ap_int<10> v123 = c_temp;	// L213
      ap_int<10> v124 = r_temp;	// L214
      ap_fixed<30, 5> v125 = im_incr;	// L215
      ap_fixed<30, 5> v126 = re_incr;	// L216
      ap_fixed<30, 5> v127 = C_im_const;	// L217
      ap_fixed<30, 5> v128 = C_re_const;	// L218
      int8_t v129;
      pe(v123, v124, v125, v126, v127, v128, &v129);	// L219
      buf0[r][c] = v129;	// L220
    }
  }
  store_res0(buf0, v107);	//
}


} // extern "C"
