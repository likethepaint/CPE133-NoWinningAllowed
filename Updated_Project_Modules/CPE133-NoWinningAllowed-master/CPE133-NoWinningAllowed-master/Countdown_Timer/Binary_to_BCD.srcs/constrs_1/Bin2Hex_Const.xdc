
## Clock signal
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

#set_property PACKAGE_PIN V17 [get_ports {binary_in[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[0]}]

#set_property PACKAGE_PIN V16 [get_ports {binary_in[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[1]}]

#set_property PACKAGE_PIN W16 [get_ports {binary_in[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[2]}]

#set_property PACKAGE_PIN W17 [get_ports {binary_in[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[3]}]

#set_property PACKAGE_PIN W15 [get_ports {binary_in[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[4]}]

#set_property PACKAGE_PIN V15 [get_ports {binary_in[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[5]}]

#set_property PACKAGE_PIN W14 [get_ports {binary_in[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[6]}]

#set_property PACKAGE_PIN W13 [get_ports {binary_in[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[7]}]

#set_property PACKAGE_PIN V2 [get_ports {binary_in[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[8]}]

#set_property PACKAGE_PIN T3 [get_ports {binary_in[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[9]}]

#set_property PACKAGE_PIN T2 [get_ports {binary_in[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[10]}]

#set_property PACKAGE_PIN R3 [get_ports {binary_in[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {binary_in[11]}]

# Binary input for first seg
#set_property PACKAGE_PIN V17 [get_ports {bin_in_1[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_1[0]}]

#set_property PACKAGE_PIN V16 [get_ports {bin_in_1[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_1[1]}]

#set_property PACKAGE_PIN W16 [get_ports {bin_in_1[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_1[2]}]

#set_property PACKAGE_PIN W17 [get_ports {bin_in_1[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_1[3]}]

# Binary input for second seg
#set_property PACKAGE_PIN W15 [get_ports {bin_in_2[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_2[0]}]

#set_property PACKAGE_PIN V15 [get_ports {bin_in_2[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_2[1]}]

#set_property PACKAGE_PIN W14 [get_ports {bin_in_2[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_2[2]}]

#set_property PACKAGE_PIN W13 [get_ports {bin_in_2[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_2[3]}]

# Binary input for third seg
#set_property PACKAGE_PIN V2 [get_ports {bin_in_3[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_3[0]}]

#set_property PACKAGE_PIN T3 [get_ports {bin_in_3[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_3[1]}]

#set_property PACKAGE_PIN T2 [get_ports {bin_in_3[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_3[2]}]

#set_property PACKAGE_PIN R3 [get_ports {bin_in_3[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_3[3]}]

# Binary input for fourth seg
#set_property PACKAGE_PIN W2 [get_ports {bin_in_4[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_4[0]}]

#set_property PACKAGE_PIN U1 [get_ports {bin_in_4[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_4[1]}]

#set_property PACKAGE_PIN T1 [get_ports {bin_in_4[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_4[2]}]

#set_property PACKAGE_PIN R2 [get_ports {bin_in_4[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {bin_in_4[3]}]

#7 segment display
#Bank = 34, Pin name = ,					Sch name = CA
set_property PACKAGE_PIN W7 [get_ports {hex_out[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[7]}]
#Bank = 34, Pin name = ,					Sch name = CB
set_property PACKAGE_PIN W6 [get_ports {hex_out[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[6]}]
#Bank = 34, Pin name = ,					Sch name = CC
set_property PACKAGE_PIN U8 [get_ports {hex_out[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[5]}]
#Bank = 34, Pin name = ,					Sch name = CD
set_property PACKAGE_PIN V8 [get_ports {hex_out[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[4]}]
#Bank = 34, Pin name = ,					Sch name = CE
set_property PACKAGE_PIN U5 [get_ports {hex_out[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[3]}]
#Bank = 34, Pin name = ,					Sch name = CF
set_property PACKAGE_PIN V5 [get_ports {hex_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[2]}]
#Bank = 34, Pin name = ,					Sch name = CG
set_property PACKAGE_PIN U7 [get_ports {hex_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[1]}]

#Bank = 34, Pin name = ,					Sch name = DP
set_property PACKAGE_PIN V7 [get_ports {hex_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {hex_out[0]}]

#Bank = 34, Pin name = ,					Sch name = AN0
#Bank = 34, Pin name = ,					Sch name = AN0
set_property PACKAGE_PIN U2 [get_ports {SSEG_AN[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSEG_AN[0]}]
#Bank = 34, Pin name = ,					Sch name = AN1
set_property PACKAGE_PIN U4 [get_ports {SSEG_AN[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSEG_AN[1]}]
#Bank = 34, Pin name = ,					Sch name = AN2
set_property PACKAGE_PIN V4 [get_ports {SSEG_AN[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSEG_AN[2]}]
#Bank = 34, Pin name = ,					Sch name = AN3
set_property PACKAGE_PIN W4 [get_ports {SSEG_AN[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SSEG_AN[3]}]

