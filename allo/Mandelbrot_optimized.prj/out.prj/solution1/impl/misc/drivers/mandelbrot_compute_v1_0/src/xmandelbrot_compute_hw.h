// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of v107
//        bit 31~0 - v107[31:0] (Read/Write)
// 0x14 : Data signal of v107
//        bit 31~0 - v107[63:32] (Read/Write)
// 0x18 : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XMANDELBROT_COMPUTE_CONTROL_ADDR_V107_DATA 0x10
#define XMANDELBROT_COMPUTE_CONTROL_BITS_V107_DATA 64

