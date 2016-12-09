// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Mon Nov 21 11:42:26 2016
// Host        : zoidberg running 64-bit Ubuntu 16.04.1 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/brett/Programming/School/CPE_133/final/Binary_to_BCD/Binary_to_BCD.sim/sim_1/impl/timing/Counter_Wrapper_SIM_time_impl.v
// Design      : Counter_Wrapper
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module Bin2Hex
   (hex_out_OBUF,
    SSEG_AN_OBUF,
    sseg_enable,
    Q,
    CLK,
    \tens_tmp_reg[3] ,
    \hundreds_tmp_reg[3] ,
    \thousands_tmp_reg[3] );
  output [6:0]hex_out_OBUF;
  output [3:0]SSEG_AN_OBUF;
  input sseg_enable;
  input [3:0]Q;
  input CLK;
  input [3:0]\tens_tmp_reg[3] ;
  input [3:0]\hundreds_tmp_reg[3] ;
  input [3:0]\thousands_tmp_reg[3] ;

  wire CLK;
  wire \FSM_onehot_SSEG_AN_tmp[3]_i_1_n_0 ;
  wire \FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ;
  wire \FSM_onehot_SSEG_AN_tmp[4]_i_3_n_0 ;
  wire \FSM_onehot_SSEG_AN_tmp[4]_i_4_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ;
  wire [3:0]Q;
  wire [3:0]SSEG_AN_OBUF;
  wire SSEG_AN_tmp;
  wire bin_in;
  wire \bin_in[0]_i_1_n_0 ;
  wire \bin_in[0]_i_2_n_0 ;
  wire \bin_in[1]_i_1_n_0 ;
  wire \bin_in[1]_i_2_n_0 ;
  wire \bin_in[2]_i_1_n_0 ;
  wire \bin_in[2]_i_2_n_0 ;
  wire \bin_in[3]_i_2_n_0 ;
  wire \bin_in[3]_i_3_n_0 ;
  wire \bin_in_reg_n_0_[0] ;
  wire \bin_in_reg_n_0_[1] ;
  wire \bin_in_reg_n_0_[2] ;
  wire \bin_in_reg_n_0_[3] ;
  wire [4:0]count;
  wire \count[0]_i_1_n_0 ;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_1_n_0 ;
  wire \count[4]_i_1_n_0 ;
  wire [6:0]hex_out_OBUF;
  wire [3:0]\hundreds_tmp_reg[3] ;
  wire p_0_out_n_0;
  wire sseg_enable;
  wire [3:0]\tens_tmp_reg[3] ;
  wire [3:0]\thousands_tmp_reg[3] ;

  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_SSEG_AN_tmp[3]_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .O(\FSM_onehot_SSEG_AN_tmp[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hC800)) 
    \FSM_onehot_SSEG_AN_tmp[4]_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I1(\FSM_onehot_SSEG_AN_tmp[4]_i_4_n_0 ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I3(sseg_enable),
        .O(\FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFE000000)) 
    \FSM_onehot_SSEG_AN_tmp[4]_i_2 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ),
        .I3(\FSM_onehot_SSEG_AN_tmp[4]_i_4_n_0 ),
        .I4(sseg_enable),
        .O(SSEG_AN_tmp));
  LUT2 #(
    .INIT(4'h1)) 
    \FSM_onehot_SSEG_AN_tmp[4]_i_3 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .O(\FSM_onehot_SSEG_AN_tmp[4]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h00200000)) 
    \FSM_onehot_SSEG_AN_tmp[4]_i_4 
       (.I0(count[3]),
        .I1(count[1]),
        .I2(count[0]),
        .I3(count[2]),
        .I4(count[4]),
        .O(\FSM_onehot_SSEG_AN_tmp[4]_i_4_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    \FSM_onehot_SSEG_AN_tmp_reg[0] 
       (.C(CLK),
        .CE(SSEG_AN_tmp),
        .D(1'b0),
        .Q(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .R(\FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b0)) 
    \FSM_onehot_SSEG_AN_tmp_reg[1] 
       (.C(CLK),
        .CE(SSEG_AN_tmp),
        .D(1'b0),
        .Q(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .S(\FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_SSEG_AN_tmp_reg[2] 
       (.C(CLK),
        .CE(SSEG_AN_tmp),
        .D(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .Q(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .R(\FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_SSEG_AN_tmp_reg[3] 
       (.C(CLK),
        .CE(SSEG_AN_tmp),
        .D(\FSM_onehot_SSEG_AN_tmp[3]_i_1_n_0 ),
        .Q(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ),
        .R(\FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_SSEG_AN_tmp_reg[4] 
       (.C(CLK),
        .CE(SSEG_AN_tmp),
        .D(\FSM_onehot_SSEG_AN_tmp[4]_i_3_n_0 ),
        .Q(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .R(\FSM_onehot_SSEG_AN_tmp[4]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \SSEG_AN_OBUF[0]_inst_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .O(SSEG_AN_OBUF[0]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \SSEG_AN_OBUF[1]_inst_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .O(SSEG_AN_OBUF[1]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \SSEG_AN_OBUF[2]_inst_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .O(SSEG_AN_OBUF[2]));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \SSEG_AN_OBUF[3]_inst_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .O(SSEG_AN_OBUF[3]));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \bin_in[0]_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I1(Q[0]),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I3(\bin_in[0]_i_2_n_0 ),
        .O(\bin_in[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \bin_in[0]_i_2 
       (.I0(\tens_tmp_reg[3] [0]),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I2(\hundreds_tmp_reg[3] [0]),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I4(\thousands_tmp_reg[3] [0]),
        .O(\bin_in[0]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \bin_in[1]_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I1(Q[1]),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I3(\bin_in[1]_i_2_n_0 ),
        .O(\bin_in[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \bin_in[1]_i_2 
       (.I0(\tens_tmp_reg[3] [1]),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I2(\hundreds_tmp_reg[3] [1]),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I4(\thousands_tmp_reg[3] [1]),
        .O(\bin_in[1]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \bin_in[2]_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I1(Q[2]),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I3(\bin_in[2]_i_2_n_0 ),
        .O(\bin_in[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \bin_in[2]_i_2 
       (.I0(\tens_tmp_reg[3] [2]),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I2(\hundreds_tmp_reg[3] [2]),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I4(\thousands_tmp_reg[3] [2]),
        .O(\bin_in[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCCC80000)) 
    \bin_in[3]_i_1 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I1(\FSM_onehot_SSEG_AN_tmp[4]_i_4_n_0 ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I3(p_0_out_n_0),
        .I4(sseg_enable),
        .O(bin_in));
  LUT4 #(
    .INIT(16'hCDC8)) 
    \bin_in[3]_i_2 
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[0] ),
        .I1(Q[3]),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[4] ),
        .I3(\bin_in[3]_i_3_n_0 ),
        .O(\bin_in[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    \bin_in[3]_i_3 
       (.I0(\tens_tmp_reg[3] [3]),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I2(\hundreds_tmp_reg[3] [3]),
        .I3(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I4(\thousands_tmp_reg[3] [3]),
        .O(\bin_in[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \bin_in_reg[0] 
       (.C(CLK),
        .CE(bin_in),
        .D(\bin_in[0]_i_1_n_0 ),
        .Q(\bin_in_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bin_in_reg[1] 
       (.C(CLK),
        .CE(bin_in),
        .D(\bin_in[1]_i_1_n_0 ),
        .Q(\bin_in_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bin_in_reg[2] 
       (.C(CLK),
        .CE(bin_in),
        .D(\bin_in[2]_i_1_n_0 ),
        .Q(\bin_in_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \bin_in_reg[3] 
       (.C(CLK),
        .CE(bin_in),
        .D(\bin_in[3]_i_2_n_0 ),
        .Q(\bin_in_reg_n_0_[3] ),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count[0]),
        .O(\count[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00BFFF00)) 
    \count[1]_i_1 
       (.I0(count[2]),
        .I1(count[3]),
        .I2(count[4]),
        .I3(count[1]),
        .I4(count[0]),
        .O(\count[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \count[2]_i_1 
       (.I0(count[2]),
        .I1(count[1]),
        .I2(count[0]),
        .O(\count[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h3CCCC4CC)) 
    \count[3]_i_1 
       (.I0(count[4]),
        .I1(count[3]),
        .I2(count[1]),
        .I3(count[0]),
        .I4(count[2]),
        .O(\count[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h6A8AAAAA)) 
    \count[4]_i_1 
       (.I0(count[4]),
        .I1(count[2]),
        .I2(count[0]),
        .I3(count[1]),
        .I4(count[3]),
        .O(\count[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(sseg_enable),
        .D(\count[0]_i_1_n_0 ),
        .Q(count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(sseg_enable),
        .D(\count[1]_i_1_n_0 ),
        .Q(count[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(sseg_enable),
        .D(\count[2]_i_1_n_0 ),
        .Q(count[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(sseg_enable),
        .D(\count[3]_i_1_n_0 ),
        .Q(count[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[4] 
       (.C(CLK),
        .CE(sseg_enable),
        .D(\count[4]_i_1_n_0 ),
        .Q(count[4]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0941FFFF)) 
    \hex_out_OBUF[1]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[1] ),
        .I1(\bin_in_reg_n_0_[2] ),
        .I2(\bin_in_reg_n_0_[3] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[0]));
  LUT5 #(
    .INIT(32'h6302FFFF)) 
    \hex_out_OBUF[2]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[1] ),
        .I1(\bin_in_reg_n_0_[3] ),
        .I2(\bin_in_reg_n_0_[2] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[1]));
  LUT5 #(
    .INIT(32'h1F04FFFF)) 
    \hex_out_OBUF[3]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[1] ),
        .I1(\bin_in_reg_n_0_[2] ),
        .I2(\bin_in_reg_n_0_[3] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[2]));
  LUT5 #(
    .INIT(32'hC324FFFF)) 
    \hex_out_OBUF[4]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[3] ),
        .I1(\bin_in_reg_n_0_[2] ),
        .I2(\bin_in_reg_n_0_[1] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[3]));
  LUT5 #(
    .INIT(32'h8098FFFF)) 
    \hex_out_OBUF[5]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[2] ),
        .I1(\bin_in_reg_n_0_[3] ),
        .I2(\bin_in_reg_n_0_[1] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[4]));
  LUT5 #(
    .INIT(32'hC2A8FFFF)) 
    \hex_out_OBUF[6]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[2] ),
        .I1(\bin_in_reg_n_0_[3] ),
        .I2(\bin_in_reg_n_0_[1] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[5]));
  LUT5 #(
    .INIT(32'h6104FFFF)) 
    \hex_out_OBUF[7]_inst_i_1 
       (.I0(\bin_in_reg_n_0_[1] ),
        .I1(\bin_in_reg_n_0_[2] ),
        .I2(\bin_in_reg_n_0_[3] ),
        .I3(\bin_in_reg_n_0_[0] ),
        .I4(sseg_enable),
        .O(hex_out_OBUF[6]));
  LUT3 #(
    .INIT(8'hFE)) 
    p_0_out
       (.I0(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[2] ),
        .I1(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[1] ),
        .I2(\FSM_onehot_SSEG_AN_tmp_reg_n_0_[3] ),
        .O(p_0_out_n_0));
endmodule

module Binary_to_BCD
   (sseg_enable,
    Q,
    \tens_tmp_reg[2]_0 ,
    \hundreds_tmp_reg[2]_0 ,
    \thousands_tmp_reg[2]_0 ,
    CLK,
    D);
  output sseg_enable;
  output [3:0]Q;
  output [3:0]\tens_tmp_reg[2]_0 ;
  output [3:0]\hundreds_tmp_reg[2]_0 ;
  output [3:0]\thousands_tmp_reg[2]_0 ;
  input CLK;
  input [11:0]D;

  wire CLK;
  wire [11:0]D;
  wire [3:0]Q;
  wire [11:0]binary_stored;
  wire \binary_stored[11]_i_1_n_0 ;
  wire [0:0]count0;
  wire \count[1]_i_1__0_n_0 ;
  wire \count[2]_i_1__0_n_0 ;
  wire \count[3]_i_1__0_n_0 ;
  wire [3:0]count_reg__0;
  wire [3:0]\hundreds_tmp_reg[2]_0 ;
  wire \ones_tmp[0]_i_1_n_0 ;
  wire \ones_tmp[0]_i_2_n_0 ;
  wire \ones_tmp[0]_i_3_n_0 ;
  wire \ones_tmp[0]_i_4_n_0 ;
  wire \ones_tmp[1]_i_1_n_0 ;
  wire \ones_tmp[2]_i_1_n_0 ;
  wire \ones_tmp[3]_i_1_n_0 ;
  wire [3:0]p_1_out;
  wire [3:0]p_2_out;
  wire sseg_enable;
  wire sseg_enable_i_1_n_0;
  wire \tens_tmp[0]_i_1_n_0 ;
  wire \tens_tmp[1]_i_1_n_0 ;
  wire \tens_tmp[2]_i_1_n_0 ;
  wire \tens_tmp[3]_i_1_n_0 ;
  wire [3:0]\tens_tmp_reg[2]_0 ;
  wire thousands_tmp0_carry_i_1_n_0;
  wire thousands_tmp0_carry_i_2_n_0;
  wire thousands_tmp0_carry_i_3_n_0;
  wire thousands_tmp0_carry_i_4_n_0;
  wire thousands_tmp0_carry_n_0;
  wire [3:0]\thousands_tmp_reg[2]_0 ;
  wire [2:0]NLW_thousands_tmp0_carry_CO_UNCONNECTED;
  wire [3:0]NLW_thousands_tmp0_carry_O_UNCONNECTED;

  LUT1 #(
    .INIT(2'h1)) 
    \binary_stored[11]_i_1 
       (.I0(thousands_tmp0_carry_n_0),
        .O(\binary_stored[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[0] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[0]),
        .Q(binary_stored[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[10] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[10]),
        .Q(binary_stored[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[11] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[11]),
        .Q(binary_stored[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[1] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[1]),
        .Q(binary_stored[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[2] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[2]),
        .Q(binary_stored[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[3] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[3]),
        .Q(binary_stored[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[4] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[4]),
        .Q(binary_stored[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[5] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[5]),
        .Q(binary_stored[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[6] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[6]),
        .Q(binary_stored[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[7] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[7]),
        .Q(binary_stored[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[8] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[8]),
        .Q(binary_stored[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[9] 
       (.C(CLK),
        .CE(\binary_stored[11]_i_1_n_0 ),
        .D(D[9]),
        .Q(binary_stored[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1__0 
       (.I0(count_reg__0[0]),
        .O(count0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \count[1]_i_1__0 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .O(\count[1]_i_1__0_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \count[2]_i_1__0 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[2]),
        .O(\count[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \count[3]_i_1__0 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[1]),
        .I3(count_reg__0[3]),
        .O(\count[3]_i_1__0_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(count0),
        .Q(count_reg__0[0]),
        .S(\binary_stored[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[1]_i_1__0_n_0 ),
        .Q(count_reg__0[1]),
        .S(\binary_stored[11]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[2]_i_1__0_n_0 ),
        .Q(count_reg__0[2]),
        .R(\binary_stored[11]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\count[3]_i_1__0_n_0 ),
        .Q(count_reg__0[3]),
        .S(\binary_stored[11]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \hundreds_tmp[0]_i_1 
       (.I0(\tens_tmp_reg[2]_0 [0]),
        .I1(\tens_tmp_reg[2]_0 [1]),
        .I2(\tens_tmp_reg[2]_0 [2]),
        .I3(\tens_tmp_reg[2]_0 [3]),
        .O(p_2_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h11EA)) 
    \hundreds_tmp[1]_i_1 
       (.I0(\hundreds_tmp_reg[2]_0 [3]),
        .I1(\hundreds_tmp_reg[2]_0 [2]),
        .I2(\hundreds_tmp_reg[2]_0 [1]),
        .I3(\hundreds_tmp_reg[2]_0 [0]),
        .O(p_2_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h998C)) 
    \hundreds_tmp[2]_i_1 
       (.I0(\hundreds_tmp_reg[2]_0 [0]),
        .I1(\hundreds_tmp_reg[2]_0 [1]),
        .I2(\hundreds_tmp_reg[2]_0 [2]),
        .I3(\hundreds_tmp_reg[2]_0 [3]),
        .O(p_2_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h1E10)) 
    \hundreds_tmp[3]_i_1 
       (.I0(\hundreds_tmp_reg[2]_0 [0]),
        .I1(\hundreds_tmp_reg[2]_0 [1]),
        .I2(\hundreds_tmp_reg[2]_0 [2]),
        .I3(\hundreds_tmp_reg[2]_0 [3]),
        .O(p_2_out[3]));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[0] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_2_out[0]),
        .Q(\hundreds_tmp_reg[2]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[1] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_2_out[1]),
        .Q(\hundreds_tmp_reg[2]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[2] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_2_out[2]),
        .Q(\hundreds_tmp_reg[2]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[3] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_2_out[3]),
        .Q(\hundreds_tmp_reg[2]_0 [3]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h30BB3088)) 
    \ones_tmp[0]_i_1 
       (.I0(\ones_tmp[0]_i_2_n_0 ),
        .I1(count_reg__0[3]),
        .I2(\ones_tmp[0]_i_3_n_0 ),
        .I3(count_reg__0[2]),
        .I4(\ones_tmp[0]_i_4_n_0 ),
        .O(\ones_tmp[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ones_tmp[0]_i_2 
       (.I0(binary_stored[11]),
        .I1(binary_stored[10]),
        .I2(count_reg__0[1]),
        .I3(binary_stored[9]),
        .I4(count_reg__0[0]),
        .I5(binary_stored[8]),
        .O(\ones_tmp[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ones_tmp[0]_i_3 
       (.I0(binary_stored[7]),
        .I1(binary_stored[6]),
        .I2(count_reg__0[1]),
        .I3(binary_stored[5]),
        .I4(count_reg__0[0]),
        .I5(binary_stored[4]),
        .O(\ones_tmp[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \ones_tmp[0]_i_4 
       (.I0(binary_stored[3]),
        .I1(binary_stored[2]),
        .I2(count_reg__0[1]),
        .I3(binary_stored[1]),
        .I4(count_reg__0[0]),
        .I5(binary_stored[0]),
        .O(\ones_tmp[0]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h05EA)) 
    \ones_tmp[1]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[2]),
        .I3(Q[0]),
        .O(\ones_tmp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hCD22)) 
    \ones_tmp[2]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[2]),
        .I3(Q[1]),
        .O(\ones_tmp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h03A8)) 
    \ones_tmp[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[0] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\ones_tmp[0]_i_1_n_0 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[1] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\ones_tmp[1]_i_1_n_0 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[2] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\ones_tmp[2]_i_1_n_0 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[3] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\ones_tmp[3]_i_1_n_0 ),
        .Q(Q[3]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h00000003AAAAAAAA)) 
    sseg_enable_i_1
       (.I0(sseg_enable),
        .I1(count_reg__0[3]),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[0]),
        .I4(count_reg__0[1]),
        .I5(thousands_tmp0_carry_n_0),
        .O(sseg_enable_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    sseg_enable_reg
       (.C(CLK),
        .CE(1'b1),
        .D(sseg_enable_i_1_n_0),
        .Q(sseg_enable),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h56AA)) 
    \tens_tmp[0]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .O(\tens_tmp[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h11EA)) 
    \tens_tmp[1]_i_1 
       (.I0(\tens_tmp_reg[2]_0 [3]),
        .I1(\tens_tmp_reg[2]_0 [2]),
        .I2(\tens_tmp_reg[2]_0 [1]),
        .I3(\tens_tmp_reg[2]_0 [0]),
        .O(\tens_tmp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h998C)) 
    \tens_tmp[2]_i_1 
       (.I0(\tens_tmp_reg[2]_0 [0]),
        .I1(\tens_tmp_reg[2]_0 [1]),
        .I2(\tens_tmp_reg[2]_0 [2]),
        .I3(\tens_tmp_reg[2]_0 [3]),
        .O(\tens_tmp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h1E10)) 
    \tens_tmp[3]_i_1 
       (.I0(\tens_tmp_reg[2]_0 [0]),
        .I1(\tens_tmp_reg[2]_0 [1]),
        .I2(\tens_tmp_reg[2]_0 [2]),
        .I3(\tens_tmp_reg[2]_0 [3]),
        .O(\tens_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[0] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\tens_tmp[0]_i_1_n_0 ),
        .Q(\tens_tmp_reg[2]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[1] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\tens_tmp[1]_i_1_n_0 ),
        .Q(\tens_tmp_reg[2]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[2] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\tens_tmp[2]_i_1_n_0 ),
        .Q(\tens_tmp_reg[2]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[3] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(\tens_tmp[3]_i_1_n_0 ),
        .Q(\tens_tmp_reg[2]_0 [3]),
        .R(1'b0));
  CARRY4 thousands_tmp0_carry
       (.CI(1'b0),
        .CO({thousands_tmp0_carry_n_0,NLW_thousands_tmp0_carry_CO_UNCONNECTED[2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_thousands_tmp0_carry_O_UNCONNECTED[3:0]),
        .S({thousands_tmp0_carry_i_1_n_0,thousands_tmp0_carry_i_2_n_0,thousands_tmp0_carry_i_3_n_0,thousands_tmp0_carry_i_4_n_0}));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    thousands_tmp0_carry_i_1
       (.I0(D[9]),
        .I1(binary_stored[9]),
        .I2(binary_stored[11]),
        .I3(D[11]),
        .I4(binary_stored[10]),
        .I5(D[10]),
        .O(thousands_tmp0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    thousands_tmp0_carry_i_2
       (.I0(D[6]),
        .I1(binary_stored[6]),
        .I2(binary_stored[8]),
        .I3(D[8]),
        .I4(binary_stored[7]),
        .I5(D[7]),
        .O(thousands_tmp0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    thousands_tmp0_carry_i_3
       (.I0(D[3]),
        .I1(binary_stored[3]),
        .I2(binary_stored[5]),
        .I3(D[5]),
        .I4(binary_stored[4]),
        .I5(D[4]),
        .O(thousands_tmp0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    thousands_tmp0_carry_i_4
       (.I0(D[0]),
        .I1(binary_stored[0]),
        .I2(binary_stored[2]),
        .I3(D[2]),
        .I4(binary_stored[1]),
        .I5(D[1]),
        .O(thousands_tmp0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h1FE0)) 
    \thousands_tmp[0]_i_1 
       (.I0(\hundreds_tmp_reg[2]_0 [0]),
        .I1(\hundreds_tmp_reg[2]_0 [1]),
        .I2(\hundreds_tmp_reg[2]_0 [2]),
        .I3(\hundreds_tmp_reg[2]_0 [3]),
        .O(p_1_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h11EA)) 
    \thousands_tmp[1]_i_1 
       (.I0(\thousands_tmp_reg[2]_0 [3]),
        .I1(\thousands_tmp_reg[2]_0 [2]),
        .I2(\thousands_tmp_reg[2]_0 [1]),
        .I3(\thousands_tmp_reg[2]_0 [0]),
        .O(p_1_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h998C)) 
    \thousands_tmp[2]_i_1 
       (.I0(\thousands_tmp_reg[2]_0 [0]),
        .I1(\thousands_tmp_reg[2]_0 [1]),
        .I2(\thousands_tmp_reg[2]_0 [2]),
        .I3(\thousands_tmp_reg[2]_0 [3]),
        .O(p_1_out[2]));
  LUT4 #(
    .INIT(16'h1E10)) 
    \thousands_tmp[3]_i_1 
       (.I0(\thousands_tmp_reg[2]_0 [0]),
        .I1(\thousands_tmp_reg[2]_0 [1]),
        .I2(\thousands_tmp_reg[2]_0 [2]),
        .I3(\thousands_tmp_reg[2]_0 [3]),
        .O(p_1_out[3]));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[0] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_1_out[0]),
        .Q(\thousands_tmp_reg[2]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[1] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_1_out[1]),
        .Q(\thousands_tmp_reg[2]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[2] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_1_out[2]),
        .Q(\thousands_tmp_reg[2]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[3] 
       (.C(CLK),
        .CE(thousands_tmp0_carry_n_0),
        .D(p_1_out[3]),
        .Q(\thousands_tmp_reg[2]_0 [3]),
        .R(1'b0));
endmodule

(* ECO_CHECKSUM = "7ef828cb" *) 
(* NotValidForBitStream *)
module Counter_Wrapper
   (clk,
    binary_in,
    SSEG_AN,
    hex_out);
  input clk;
  input [11:0]binary_in;
  output [3:0]SSEG_AN;
  output [7:0]hex_out;

  wire [3:0]SSEG_AN;
  wire [3:0]SSEG_AN_OBUF;
  wire [11:0]binary_in;
  wire [11:0]binary_in_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]hex_out;
  wire [7:1]hex_out_OBUF;
  wire [3:0]hundreds;
  wire [3:0]ones;
  wire sseg_enable;
  wire [3:0]tens;
  wire [3:0]thousands;

initial begin
 $sdf_annotate("Counter_Wrapper_SIM_time_impl.sdf",,,,"tool_control");
end
  Binary_to_BCD BCD_Converter
       (.CLK(clk_IBUF_BUFG),
        .D(binary_in_IBUF),
        .Q(ones),
        .\hundreds_tmp_reg[2]_0 (hundreds),
        .sseg_enable(sseg_enable),
        .\tens_tmp_reg[2]_0 (tens),
        .\thousands_tmp_reg[2]_0 (thousands));
  OBUF \SSEG_AN_OBUF[0]_inst 
       (.I(SSEG_AN_OBUF[0]),
        .O(SSEG_AN[0]));
  OBUF \SSEG_AN_OBUF[1]_inst 
       (.I(SSEG_AN_OBUF[1]),
        .O(SSEG_AN[1]));
  OBUF \SSEG_AN_OBUF[2]_inst 
       (.I(SSEG_AN_OBUF[2]),
        .O(SSEG_AN[2]));
  OBUF \SSEG_AN_OBUF[3]_inst 
       (.I(SSEG_AN_OBUF[3]),
        .O(SSEG_AN[3]));
  Bin2Hex SSEG_Output
       (.CLK(clk_IBUF_BUFG),
        .Q(ones),
        .SSEG_AN_OBUF(SSEG_AN_OBUF),
        .hex_out_OBUF(hex_out_OBUF),
        .\hundreds_tmp_reg[3] (hundreds),
        .sseg_enable(sseg_enable),
        .\tens_tmp_reg[3] (tens),
        .\thousands_tmp_reg[3] (thousands));
  IBUF \binary_in_IBUF[0]_inst 
       (.I(binary_in[0]),
        .O(binary_in_IBUF[0]));
  IBUF \binary_in_IBUF[10]_inst 
       (.I(binary_in[10]),
        .O(binary_in_IBUF[10]));
  IBUF \binary_in_IBUF[11]_inst 
       (.I(binary_in[11]),
        .O(binary_in_IBUF[11]));
  IBUF \binary_in_IBUF[1]_inst 
       (.I(binary_in[1]),
        .O(binary_in_IBUF[1]));
  IBUF \binary_in_IBUF[2]_inst 
       (.I(binary_in[2]),
        .O(binary_in_IBUF[2]));
  IBUF \binary_in_IBUF[3]_inst 
       (.I(binary_in[3]),
        .O(binary_in_IBUF[3]));
  IBUF \binary_in_IBUF[4]_inst 
       (.I(binary_in[4]),
        .O(binary_in_IBUF[4]));
  IBUF \binary_in_IBUF[5]_inst 
       (.I(binary_in[5]),
        .O(binary_in_IBUF[5]));
  IBUF \binary_in_IBUF[6]_inst 
       (.I(binary_in[6]),
        .O(binary_in_IBUF[6]));
  IBUF \binary_in_IBUF[7]_inst 
       (.I(binary_in[7]),
        .O(binary_in_IBUF[7]));
  IBUF \binary_in_IBUF[8]_inst 
       (.I(binary_in[8]),
        .O(binary_in_IBUF[8]));
  IBUF \binary_in_IBUF[9]_inst 
       (.I(binary_in[9]),
        .O(binary_in_IBUF[9]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \hex_out_OBUF[0]_inst 
       (.I(1'b1),
        .O(hex_out[0]));
  OBUF \hex_out_OBUF[1]_inst 
       (.I(hex_out_OBUF[1]),
        .O(hex_out[1]));
  OBUF \hex_out_OBUF[2]_inst 
       (.I(hex_out_OBUF[2]),
        .O(hex_out[2]));
  OBUF \hex_out_OBUF[3]_inst 
       (.I(hex_out_OBUF[3]),
        .O(hex_out[3]));
  OBUF \hex_out_OBUF[4]_inst 
       (.I(hex_out_OBUF[4]),
        .O(hex_out[4]));
  OBUF \hex_out_OBUF[5]_inst 
       (.I(hex_out_OBUF[5]),
        .O(hex_out[5]));
  OBUF \hex_out_OBUF[6]_inst 
       (.I(hex_out_OBUF[6]),
        .O(hex_out[6]));
  OBUF \hex_out_OBUF[7]_inst 
       (.I(hex_out_OBUF[7]),
        .O(hex_out[7]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
