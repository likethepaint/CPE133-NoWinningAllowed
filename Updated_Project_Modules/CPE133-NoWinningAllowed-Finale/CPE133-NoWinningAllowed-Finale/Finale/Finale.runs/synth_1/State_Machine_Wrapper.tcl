# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.cache/wt [current_project]
set_property parent.project_path C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
read_vhdl -library xil_defaultlib {
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Word_Key.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Button.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Trap.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Timer.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Pattern_Gen.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Comparator.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Binary_to_BCD.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Display_Key.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/End_Driver.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/SSEG_Select.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Game_State_Machine.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Display_Word.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/button_splitter.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/button_input.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/button_fsm.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Game_Module.vhd
  C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/State_Machine_Wrapper.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Game_Test_Const.xdc
set_property used_in_implementation false [get_files C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Game_Test_Const.xdc]


synth_design -top State_Machine_Wrapper -part xc7a35tcpg236-1


write_checkpoint -force -noxdef State_Machine_Wrapper.dcp

catch { report_utilization -file State_Machine_Wrapper_utilization_synth.rpt -pb State_Machine_Wrapper_utilization_synth.pb }