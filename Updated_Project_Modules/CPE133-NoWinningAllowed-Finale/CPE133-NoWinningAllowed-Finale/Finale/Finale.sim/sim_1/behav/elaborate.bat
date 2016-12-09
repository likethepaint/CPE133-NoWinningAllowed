@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto a6de33d6223f433e8e1ec502fcb7cc1b -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot sim_hell_behav xil_defaultlib.sim_hell -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
