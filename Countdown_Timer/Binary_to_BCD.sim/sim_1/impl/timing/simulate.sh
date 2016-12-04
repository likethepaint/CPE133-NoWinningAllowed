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
ExecStep $xv_path/bin/xsim Binary_to_BCD_SIM_time_impl -key {Post-Implementation:sim_1:Timing:Binary_to_BCD_SIM} -tclbatch Binary_to_BCD_SIM.tcl -log simulate.log
