// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xmandelbrot_compute.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMandelbrot_compute_CfgInitialize(XMandelbrot_compute *InstancePtr, XMandelbrot_compute_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMandelbrot_compute_Set_v107(XMandelbrot_compute *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMandelbrot_compute_WriteReg(InstancePtr->Control_BaseAddress, XMANDELBROT_COMPUTE_CONTROL_ADDR_V107_DATA, (u32)(Data));
    XMandelbrot_compute_WriteReg(InstancePtr->Control_BaseAddress, XMANDELBROT_COMPUTE_CONTROL_ADDR_V107_DATA + 4, (u32)(Data >> 32));
}

u64 XMandelbrot_compute_Get_v107(XMandelbrot_compute *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMandelbrot_compute_ReadReg(InstancePtr->Control_BaseAddress, XMANDELBROT_COMPUTE_CONTROL_ADDR_V107_DATA);
    Data += (u64)XMandelbrot_compute_ReadReg(InstancePtr->Control_BaseAddress, XMANDELBROT_COMPUTE_CONTROL_ADDR_V107_DATA + 4) << 32;
    return Data;
}

