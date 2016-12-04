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
echo "xvhdl -m64 --relax -prj Binary_to_BCD_SIM_vhdl.prj"
ExecStep $xv_path/bin/xvhdl -m64 --relax -prj Binary_to_BCD_SIM_vhdl.prj 2>&1 | tee -a compile.log
