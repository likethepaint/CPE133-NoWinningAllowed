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
ExecStep $xv_path/bin/xelab -wto 2f17d5f280b3405ebc1bf2f5da894be1 -m64 --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Binary_to_BCD_SIM_behav xil_defaultlib.Binary_to_BCD_SIM -log elaborate.log
