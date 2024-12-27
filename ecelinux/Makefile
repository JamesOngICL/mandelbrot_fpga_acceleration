#==========================================================================
# Makefile
#==========================================================================
# @brief: A makefile the compiles and synthesizes the mandelbrot program
#
# @desc: 1. "make" runs csim by default
#        2. "make csim" compiles & executes the software implementation
#        3. "make clean" cleans up the directory


# Extract Vivado HLS include path
XILINX_VIVADO?=/opt/xilinx/Vivado/2019.2
XIL_HLS=source $(XILINX_VIVADO)/settings64.sh; vivado_hls
VHLS_INC=$(XILINX_VIVADO)/include
# Specify compilation flags
CFLAGS=-g -I${VHLS_INC}

TCL_SCRIPT=run.tcl

.PHONY: all csim bitstream clean 

all: csim

mandelbrot: mandelbrot.cpp mandelbrot_test.cpp
	g++ ${CFLAGS} $^ -o $@ -lrt
	@echo "Executable created: $@"

result/mandelbrot_csim.txt: mandelbrot
	@echo "Running mandelbrot sim..."
	mkdir -p result
	./$< | tee $@

csim: result/mandelbrot_csim.txt
	@echo "Result recorded to $<"

mandelbrot_plot: mandelbrot.cpp mandelbrot_test_plot.cpp
	g++ ${CFLAGS} $^ -o $@ -lrt
	@echo "Executable created: $@"

result/mandelbrot_plot.txt: mandelbrot_plot
	@echo "Running mandelbrot_plot sim..."
	mkdir -p result
	./$< | tee $@

save_plot: result/mandelbrot_plot.txt
	@python3 display/plot_result.py
	@echo "Saving plot to display/mandelbrot_out.png"

save_data: result/mandelbrot_plot.txt
	@python3 display/save_data.py
	@echo "Expected data updated"

xillydemo.bit:
	@echo "================================================================="
	@echo "Synthesizing mandelbrot and creating bitstream with $(TCL_SCRIPT)..."
	@echo "================================================================="
	$(XIL_HLS) -f $(TCL_SCRIPT)
	./run_bitstream.sh

bitstream: xillydemo.bit
	@echo "Bitstream saved to $<"

clean:
	rm -rf mandelbrot *.dat *.prj *.log
	rm -rf zedboard_project* xillydemo.bit
	rm -rf result/mandelbrot_csim.txt
	rm -rf result/mandelbrot_plot.txt
	rm -rf mandelbrot_plot
	rm -rf display/mandelbrot_out.png
	rm -rf display/result.csv
