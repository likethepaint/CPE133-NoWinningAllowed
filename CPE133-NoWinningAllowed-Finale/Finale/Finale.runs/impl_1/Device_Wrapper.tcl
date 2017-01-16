proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param xicom.use_bs_reader 1
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.cache/wt [current_project]
  set_property parent.project_path C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.xpr [current_project]
  set_property ip_repo_paths c:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.cache/ip [current_project]
  set_property ip_output_repo c:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.cache/ip [current_project]
  add_files -quiet C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/Finale/Finale.runs/synth_1/Device_Wrapper.dcp
  read_xdc C:/Users/ckenner/Desktop/CPE133-NoWinningAllowed-Finale/CPE133-NoWinningAllowed-Finale/VHDL_FILES/Game_Test_Const.xdc
  link_design -top Device_Wrapper -part xc7a35tcpg236-1
  write_hwdef -file Device_Wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force Device_Wrapper_opt.dcp
  report_drc -file Device_Wrapper_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force Device_Wrapper_placed.dcp
  report_io -file Device_Wrapper_io_placed.rpt
  report_utilization -file Device_Wrapper_utilization_placed.rpt -pb Device_Wrapper_utilization_placed.pb
  report_control_sets -verbose -file Device_Wrapper_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force Device_Wrapper_routed.dcp
  report_drc -file Device_Wrapper_drc_routed.rpt -pb Device_Wrapper_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file Device_Wrapper_timing_summary_routed.rpt -rpx Device_Wrapper_timing_summary_routed.rpx
  report_power -file Device_Wrapper_power_routed.rpt -pb Device_Wrapper_power_summary_routed.pb -rpx Device_Wrapper_power_routed.rpx
  report_route_status -file Device_Wrapper_route_status.rpt -pb Device_Wrapper_route_status.pb
  report_clock_utilization -file Device_Wrapper_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}

start_step write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  catch { write_mem_info -force Device_Wrapper.mmi }
  write_bitstream -force Device_Wrapper.bit 
  catch { write_sysdef -hwdef Device_Wrapper.hwdef -bitfile Device_Wrapper.bit -meminfo Device_Wrapper.mmi -file Device_Wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
}
