import allo
from allo.ir.types import int8
from allo.ir.types import uint4
from allo.ir.types import int10
from allo.ir.types import uint16
# from allo.ir.types import ufixed37
from allo.ir.types import float32
from allo.ir.types import int32
from allo.ir.types import fixed37
import pytest
import os
import sys
import numpy as np
import allo.backend.hls as hls


#initializing the global variables
H = 200
W = 300
max_iterations = 1000


def mandelbrot_compute(H_2,H,W,max_iterations):
    # main compute pe
    def pe(c:int10, r:int10 ,im_incr:fixed37,re_incr:fixed37,C_im_const:fixed37,C_re_const:fixed37) -> int8:
        C_im:fixed37 = C_im_const - r*im_incr
        C_re: fixed37=  C_re_const + c*re_incr

        count2 :int32 = 0
        Z_re: fixed37 = 0
        Z_im: fixed37 = 0
        ans : int8 = 0
        value : fixed37 = 0 
        Z_im_prev : fixed37 = 0

        #compute the real and impaginary part
        for count1 in allo.grid(max_iterations):
            if (value) < 4:
                count2 += 1
                Z_im_prev = Z_im
                Z_im = (Z_re*Z_im)*2 + C_im
                Z_re = (Z_re*Z_re) - (Z_im_prev*Z_im_prev) + C_re
                value = Z_re*Z_re + Z_im*Z_im  
        
        # map to different color schemes
        if (count2 >= max_iterations): 
            ans = 0

        elif (count2 >= (max_iterations >> 1)): 
            ans = 1
    
        elif (count2 >= (max_iterations >> 2) ):
            ans = 2

        elif (count2 >= (max_iterations >> 3) ):
            ans = 3
        
        elif (count2 >= (max_iterations >> 4) ):
            ans = 4
        
        elif (count2 >= (max_iterations >> 5) ):
            ans = 5

        elif (count2 >= (max_iterations >> 6) ):
            ans = 6

        elif (count2 >= (max_iterations >> 7) ):
            ans = 7

        else:
            ans = 8
        return ans

    def mandelbrot_compute[H_2: int10 ,W: int10](output: "int8[H_2, W]"):
        re_incr : fixed37 = 3/W 
        im_incr : fixed37 = 2/H 

        # # Initialize real and imaginary parts of C
        C_re_const : fixed37 = -2
        C_im_const : fixed37 = 1
        r_temp : int10 = 0
        c_temp : int10 = 0
        for r in allo.grid(H_2):
            r_temp = r
            for c in allo.grid(W):
                c_temp = c 
                output[r,c] = pe(c_temp,r_temp,im_incr,re_incr,C_im_const,C_re_const)

 
 #creating a schedule
    s = allo.customize(mandelbrot_compute, instantiate=[H_2,W]) 
    s.unroll("c",100) 
    s.partition(s.output,factor=100,dim=2)
    s1 = allo.customize(pe)
    s1.pipeline("count1",2)
    s.compose(s1)
    # s1.dataflow("pe")
    return s



def main():
    # Check if at least one argument is provided (excluding the script name)
    if len(sys.argv) < 2:
        print("wrong input, must be one of llvm, csyn, csim")
        sys.exit(1)  # Exit the script with an error code

    s = mandelbrot_compute(H//2,H,W,max_iterations)
    mode_req = sys.argv[1]
    if(mode_req == "llvm"):
        mod = s.build()
    elif(mode_req == "csim" and hls.is_available("vitis_hls")):
        mod = s.build(target="vitis_hls", mode="csim", project="mandelbrot_optimized.prj")
    elif(mode_req == "csyn" and hls.is_available("vitis_hls")):
        mod = s.build(target="vitis_hls", mode="csyn", project="mandelbrot_optimized.prj")
    else:
        print("wrong input, must be one of LLVM, csyn, csim")
        sys.exit(1)  # Exit the script with an error code
    
    # testing
    # *** Note: test case wont run for csyn
    if(mod != "csyn"):
        output = np.zeros((H//2, W), dtype=np.int8)
        mod(output)
        expected_vals = np.zeros((H // 2, W), dtype=np.int8)  # Create a 2D array to store values
        with open("expected_450_300_1000.dat", "r") as infile:
            for r in range(H // 2):
                row_data = infile.readline().strip().split()  # Read and split each line
                if row_data:  # Check if row_data is not empty
                    expected_vals[r] = list(map(int, row_data))  # Convert to integers and assign to row
                else:
                    print(f"Warning: Line {r} in file is empty.")
        np.testing.assert_allclose(output, expected_vals, rtol=1e-3, atol=1e-3)
        print("Results are correct!")

if __name__ == "__main__":
    main()




