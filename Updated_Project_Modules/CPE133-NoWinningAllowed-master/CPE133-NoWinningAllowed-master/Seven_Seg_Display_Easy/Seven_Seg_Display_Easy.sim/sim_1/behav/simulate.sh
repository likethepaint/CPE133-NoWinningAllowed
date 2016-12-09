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
ExecStep $xv_path/bin/xsim Test_Bench_DS_behav -key {Behavioral:sim_1:Functional:Test_Bench_DS} -tclbatch Test_Bench_DS.tcl -log simulate.log
