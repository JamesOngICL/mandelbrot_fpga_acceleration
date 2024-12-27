// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Tool Version Limit: 2022.04
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmandelbrot_compute.h"

extern XMandelbrot_compute_Config XMandelbrot_compute_ConfigTable[];

XMandelbrot_compute_Config *XMandelbrot_compute_LookupConfig(u16 DeviceId) {
	XMandelbrot_compute_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMANDELBROT_COMPUTE_NUM_INSTANCES; Index++) {
		if (XMandelbrot_compute_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMandelbrot_compute_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMandelbrot_compute_Initialize(XMandelbrot_compute *InstancePtr, u16 DeviceId) {
	XMandelbrot_compute_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMandelbrot_compute_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMandelbrot_compute_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

