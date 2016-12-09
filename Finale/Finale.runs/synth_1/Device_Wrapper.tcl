# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/Finale/Finale.cache/wt [current_project]
set_property parent.project_path /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/Finale/Finale.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Word_Key.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Display_Word.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Timer.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Pattern_Gen.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Comparator.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Trap.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Binary_to_BCD.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Display_Key.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/SSEG_Select.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/End_Driver.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Init_Driver.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/State_Controller.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Difficulty_Driver.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Button.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Game_Module.vhd
  /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Device_Wrapper.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Game_Test_Const.xdc
set_property used_in_implementation false [get_files /home/brett/Programming/School/CPE_133/CPE133-NoWinningAllowed/VHDL_FILES/Game_Test_Const.xdc]


synth_design -top Device_Wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef Device_Wrapper.dcp

catch { report_utilization -file Device_Wrapper_utilization_synth.rpt -pb Device_Wrapper_utilization_synth.pb }
