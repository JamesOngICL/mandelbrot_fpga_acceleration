## Introduction

The Mandelbrot set is a complex mathematical construct defined by the iterative equation:
<div align="center">
  z<sub>n+1</sub> = z<sub>n</sub><sup>2</sup> + c
</div>
where the initial z value is 0 and c is a complex constant. This set provides a visualization of spirals representing the values of c where the iteration output remains stable. In this set, the x-axis represents the real part of c while the y-axis represents the imaginary part of c. Stable values of c are colored in black while unstable values are assigned different colors based on how unstable they are (how many iterations it took to tend towards infinity). However, calculating high-resolution images of the Mandelbrot set is computationally intensive due to the necessity of performing a large number of iterations for each pixel making this a suitable task for FPGA based parallelism. For the below image, the real part of c is in the range [-2, 1] and the imaginary part of c is in the range [-1, 1].

![hls_py_imp](https://github.com/user-attachments/assets/20d663e7-8fb4-45b6-95c0-0eed03e70cab)

This project exploits the task level parallelism of FPGA architectures to accelerate the computation of mandelbrot set values. This starts with a sequential implementation of code and compute spirals for the positive y-plane. By implementing intra-tile parallelism in our approach we are able to achieve a significant speedup of approximately 1590x as compared to our baseline architecture far exceeding the reported 170x expected speedup as produced by vivado_hls. 

<img width="456" alt="image" src="https://github.com/user-attachments/assets/fca3da24-fe86-4171-baa7-2d99ec55b92d" />


### Automate Plotting and Saving Results
#### Initial Setup (Only Do Once)
cd ece6775_final/ecelinux/display
```
python3 -m venv virtual_env

cd .. (should be in ecelinux folder now)

source display/virtual_env/bin/activate

python3 -m pip install --upgrade pip

pip install matplotlib

pip install csv

deactivate
```

#### To Save Generated Plot with Make
```
cd ece6775_final/ecelinux

source display/virtual_env/bin/activate

make save_plot

deactivate

#### To Update Expected Data with Make
cd ece6775_final/ecelinux

source display/virtual_env/bin/activate

make update_data

deactivate
```
### Running ALLO
To setup allo, follow the instructions at https://cornell-zhang.github.io/allo/setup/index.html

#### Setup up the tools
```
LLVM
source /work/shared/common/allo/setup-llvm19.sh

Vitis HLS
source /work/shared/common/allo/vitis_2022.1_opt.sh

```
#### Running the scripts

```
cd ece6775_final/allo

Base
python3 Mandelbrot_base.py flag

Optimized
python3 Mandelbrot_optimized.py flag

flag can be one of llvm, csim, csyn
```
