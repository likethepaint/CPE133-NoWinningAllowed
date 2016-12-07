#!/bin/bash -f
xv_path="/home/brett/Builds/vivado/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xelab -wto 90ba0a9fd5d040d0b2a23b27cf29327c -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Test_Bench_DS_behav xil_defaultlib.Test_Bench_DS -log elaborate.log
