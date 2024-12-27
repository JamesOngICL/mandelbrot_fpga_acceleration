#==========================================================================
# Makefile
#==========================================================================
# @brief: A makefile the compiles and runs the mandelbrot program
#
# @desc: 1. "make" or "make sw" runs software execution by default
#        2. "make fpga" invokes the HW accelerator
#        3. "make clean" cleans up the directory

INC_PATH=/usr/include/vivado_hls
CFLAGS = -I${INC_PATH}

.PHONY: all sw fpga

all: sw

mandelbrot-arm: mandelbrot.cpp mandelbrot_test.cpp
	@echo "Compiling & executing mandelbrot software program on ARM ..."
	g++ ${CFLAGS} $^ -o $@

result/mandelbrot_arm_sim.txt: mandelbrot-arm
	mkdir -p result
	./$< | tee $@

sw: result/mandelbrot_arm_sim.txt
	@echo "Result saved to $@"

mandelbrot-fpga: host.cpp
	@echo "Compiling host program"
	g++ ${CFLAGS} $^ -o $@
	@echo "Make sure bitstream is loaded!"

fpga: mandelbrot-fpga
	@echo "Running mandelbrot accelerator ..."
	./$<

# Clean up the directory before submission
clean:
	@echo "Clean up output files"
	rm -rf mandelbrot-arm vivado_hls.log *.prj result out.dat *~
	rm -rf mandelbrot-fpga
