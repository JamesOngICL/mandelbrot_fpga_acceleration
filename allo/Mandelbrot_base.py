import allo
from allo.ir.types import float32
from allo.ir.types import int32
import sys
import numpy as np
import allo.backend.hls as hls

#initializing the global variables
H = 200
W = 300
max_iterations = 1000

def mandelbrot_compute(H_2,H,W,maxiterations):
    def mandelbrot_compute[H_2: int32, H : int32, W: int32, max_iterations : int32](output: "int32[H_2, W]"):
        re_incr : float32 = 3/300 #0.0046875; // 3/640
        im_incr : float32 = 2/225 #0.00416666666; // 2/480

        # Initialize real and imaginary parts of C
        C_re : float32 = -2
        C_im : float32 = 1

        count: int32 = 0
        Z_re : float32 = 0
        Z_im : float32 = 0
            

        for r in allo.grid(H_2):
            for c in allo.grid(W):
                count = 0
                Z_re = 0
                Z_im = 0

                for count1 in allo.grid(max_iterations):
                    if (Z_re*Z_re + Z_im*Z_im) < 4:
                        # Compute new Z value
                        Z_im_prev: int32 = Z_im
                        Z_im = (Z_re*Z_im)*2 + C_im
                        Z_re = (Z_re*Z_re) - (Z_im_prev*Z_im_prev) + C_re
                        count = count1
                
            # Set output value for this position
                if (count >= max_iterations): 
                    output[r,c] = 0

                elif (count >= (max_iterations >> 1)): 
                    output[r,c] = 1
            
                elif (count >= (max_iterations >> 2) ):
                    output[r,c] = 2

                elif (count >= (max_iterations >> 3) ):
                    output[r,c] = 3
                
                elif (count >= (max_iterations >> 4) ):
                    output[r,c] = 4
                
                elif (count >= (max_iterations >> 5) ):
                    output[r,c] = 5

                elif (count >= (max_iterations >> 6) ):
                    output[r,c] = 6

                elif (count >= (max_iterations >> 7) ):
                    output[r,c] = 7

                else:
                    output[r,c] = 8

                C_re += re_incr  
            C_im -= im_incr
            C_re = -2

    # Create the Schedule
    s = allo.customize(mandelbrot_compute, instantiate=[H_2,H,W,maxiterations]) 
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
        output = np.zeros((H//2, W), dtype=np.int32)
        mod(output)
        expected_vals = np.zeros((H // 2, W), dtype=np.int32)  # Create a 2D array to store values
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



