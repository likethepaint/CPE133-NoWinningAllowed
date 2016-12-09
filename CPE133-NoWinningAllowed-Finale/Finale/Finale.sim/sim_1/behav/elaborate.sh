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
ExecStep $xv_path/bin/xelab -wto a6de33d6223f433e8e1ec502fcb7cc1b -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot End_Driver_Sim_behav xil_defaultlib.End_Driver_Sim -log elaborate.log
