set SynModuleInfo {
  {SRCNAME mandelbrot_compute_Pipeline_l_S_count1_0_count1 MODELNAME mandelbrot_compute_Pipeline_l_S_count1_0_count1 RTLNAME mandelbrot_compute_mandelbrot_compute_Pipeline_l_S_count1_0_count1
    SUBMODULES {
      {MODELNAME mandelbrot_compute_mul_55s_55s_104_1_1 RTLNAME mandelbrot_compute_mul_55s_55s_104_1_1 BINDTYPE op TYPE mul IMPL fabric LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME mandelbrot_compute_mul_55s_55s_105_1_1 RTLNAME mandelbrot_compute_mul_55s_55s_105_1_1 BINDTYPE op TYPE mul IMPL fabric LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME mandelbrot_compute_mul_55s_55s_105_5_1 RTLNAME mandelbrot_compute_mul_55s_55s_105_5_1 BINDTYPE op TYPE mul IMPL dsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME mandelbrot_compute_flow_control_loop_pipe_sequential_init RTLNAME mandelbrot_compute_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME mandelbrot_compute_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME mandelbrot_compute MODELNAME mandelbrot_compute RTLNAME mandelbrot_compute IS_TOP 1
    SUBMODULES {
      {MODELNAME mandelbrot_compute_mux_3009_8_1_1 RTLNAME mandelbrot_compute_mux_3009_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME mandelbrot_compute_buf0_RAM_AUTO_1R1W RTLNAME mandelbrot_compute_buf0_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME mandelbrot_compute_gmem0_m_axi RTLNAME mandelbrot_compute_gmem0_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME mandelbrot_compute_control_s_axi RTLNAME mandelbrot_compute_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
