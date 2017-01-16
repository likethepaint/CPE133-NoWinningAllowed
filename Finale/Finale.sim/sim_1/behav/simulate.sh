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
ExecStep $xv_path/bin/xsim End_Driver_Sim_behav -key {Behavioral:sim_1:Functional:End_Driver_Sim} -tclbatch End_Driver_Sim.tcl -log simulate.log
