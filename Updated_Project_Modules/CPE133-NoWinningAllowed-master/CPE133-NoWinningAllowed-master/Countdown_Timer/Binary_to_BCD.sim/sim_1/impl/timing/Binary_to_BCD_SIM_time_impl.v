// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
// Date        : Mon Nov 21 12:12:33 2016
// Host        : zoidberg running 64-bit Ubuntu 16.04.1 LTS
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/brett/Programming/School/CPE_133/final/Binary_to_BCD/Binary_to_BCD.sim/sim_1/impl/timing/Binary_to_BCD_SIM_time_impl.v
// Design      : Binary_to_BCD
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "e8932206" *) 
(* NotValidForBitStream *)
module Binary_to_BCD
   (clk,
    binary_in,
    ones,
    tens,
    hundreds,
    thousands,
    sseg_enable);
  input clk;
  input [11:0]binary_in;
  output [3:0]ones;
  output [3:0]tens;
  output [3:0]hundreds;
  output [3:0]thousands;
  output sseg_enable;

  wire [11:0]binary_in;
  wire [11:0]binary_in_IBUF;
  wire [11:0]binary_stored;
  wire \binary_stored[11]_i_3_n_0 ;
  wire \binary_stored[11]_i_4_n_0 ;
  wire \binary_stored[11]_i_5_n_0 ;
  wire \binary_stored[11]_i_6_n_0 ;
  wire clear;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [0:0]count0;
  wire \count[1]_i_1_n_0 ;
  wire \count[2]_i_1_n_0 ;
  wire \count[3]_i_2_n_0 ;
  wire [3:0]count_reg__0;
  wire [3:0]hundreds;
  wire [3:0]hundreds_OBUF;
  wire [3:0]ones;
  wire [3:0]ones_OBUF;
  wire ones_tmp;
  wire \ones_tmp[0]_i_1_n_0 ;
  wire \ones_tmp[0]_i_2_n_0 ;
  wire \ones_tmp[0]_i_3_n_0 ;
  wire \ones_tmp[0]_i_4_n_0 ;
  wire \ones_tmp[1]_i_1_n_0 ;
  wire \ones_tmp[2]_i_1_n_0 ;
  wire \ones_tmp[3]_i_1_n_0 ;
  wire \ones_tmp[3]_i_3_n_0 ;
  wire [3:0]p_1_out;
  wire [3:0]p_2_out;
  wire sseg_enable;
  wire sseg_enable0_out;
  wire sseg_enable1_out;
  wire sseg_enable_OBUF;
  wire [3:0]tens;
  wire [3:0]tens_OBUF;
  wire \tens_tmp[0]_i_1_n_0 ;
  wire \tens_tmp[1]_i_1_n_0 ;
  wire \tens_tmp[2]_i_1_n_0 ;
  wire \tens_tmp[3]_i_1_n_0 ;
  wire [3:0]thousands;
  wire [3:0]thousands_OBUF;
  wire thousands_tmp0;
  wire thousands_tmp1;
  wire [2:0]\NLW_binary_stored_reg[11]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_binary_stored_reg[11]_i_2_O_UNCONNECTED ;

initial begin
 $sdf_annotate("Binary_to_BCD_SIM_time_impl.sdf",,,,"tool_control");
end
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
  LUT1 #(
    .INIT(2'h1)) 
    \binary_stored[11]_i_1 
       (.I0(thousands_tmp1),
        .O(clear));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \binary_stored[11]_i_3 
       (.I0(binary_in_IBUF[9]),
        .I1(binary_stored[9]),
        .I2(binary_stored[11]),
        .I3(binary_in_IBUF[11]),
        .I4(binary_stored[10]),
        .I5(binary_in_IBUF[10]),
        .O(\binary_stored[11]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \binary_stored[11]_i_4 
       (.I0(binary_in_IBUF[6]),
        .I1(binary_stored[6]),
        .I2(binary_stored[8]),
        .I3(binary_in_IBUF[8]),
        .I4(binary_stored[7]),
        .I5(binary_in_IBUF[7]),
        .O(\binary_stored[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \binary_stored[11]_i_5 
       (.I0(binary_in_IBUF[3]),
        .I1(binary_stored[3]),
        .I2(binary_stored[5]),
        .I3(binary_in_IBUF[5]),
        .I4(binary_stored[4]),
        .I5(binary_in_IBUF[4]),
        .O(\binary_stored[11]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    \binary_stored[11]_i_6 
       (.I0(binary_in_IBUF[0]),
        .I1(binary_stored[0]),
        .I2(binary_stored[2]),
        .I3(binary_in_IBUF[2]),
        .I4(binary_stored[1]),
        .I5(binary_in_IBUF[1]),
        .O(\binary_stored[11]_i_6_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[0]),
        .Q(binary_stored[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[10]),
        .Q(binary_stored[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[11]),
        .Q(binary_stored[11]),
        .R(1'b0));
  CARRY4 \binary_stored_reg[11]_i_2 
       (.CI(1'b0),
        .CO({thousands_tmp1,\NLW_binary_stored_reg[11]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_binary_stored_reg[11]_i_2_O_UNCONNECTED [3:0]),
        .S({\binary_stored[11]_i_3_n_0 ,\binary_stored[11]_i_4_n_0 ,\binary_stored[11]_i_5_n_0 ,\binary_stored[11]_i_6_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[1]),
        .Q(binary_stored[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[2]),
        .Q(binary_stored[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[3]),
        .Q(binary_stored[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[4]),
        .Q(binary_stored[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[5]),
        .Q(binary_stored[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[6]),
        .Q(binary_stored[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[7]),
        .Q(binary_stored[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[8]),
        .Q(binary_stored[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \binary_stored_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(clear),
        .D(binary_in_IBUF[9]),
        .Q(binary_stored[9]),
        .R(1'b0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \count[0]_i_1 
       (.I0(count_reg__0[0]),
        .O(count0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h9)) 
    \count[1]_i_1 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .O(\count[1]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hE1)) 
    \count[2]_i_1 
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[2]),
        .O(\count[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \count[3]_i_1 
       (.I0(count_reg__0[3]),
        .I1(count_reg__0[2]),
        .O(thousands_tmp0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'hFE01)) 
    \count[3]_i_2 
       (.I0(count_reg__0[0]),
        .I1(count_reg__0[1]),
        .I2(count_reg__0[2]),
        .I3(count_reg__0[3]),
        .O(\count[3]_i_2_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(thousands_tmp0),
        .D(count0),
        .Q(count_reg__0[0]),
        .S(\ones_tmp[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(thousands_tmp0),
        .D(\count[1]_i_1_n_0 ),
        .Q(count_reg__0[1]),
        .S(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \count_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(thousands_tmp0),
        .D(\count[2]_i_1_n_0 ),
        .Q(count_reg__0[2]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDSE #(
    .INIT(1'b1)) 
    \count_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(thousands_tmp0),
        .D(\count[3]_i_2_n_0 ),
        .Q(count_reg__0[3]),
        .S(\ones_tmp[3]_i_1_n_0 ));
  OBUF \hundreds_OBUF[0]_inst 
       (.I(hundreds_OBUF[0]),
        .O(hundreds[0]));
  OBUF \hundreds_OBUF[1]_inst 
       (.I(hundreds_OBUF[1]),
        .O(hundreds[1]));
  OBUF \hundreds_OBUF[2]_inst 
       (.I(hundreds_OBUF[2]),
        .O(hundreds[2]));
  OBUF \hundreds_OBUF[3]_inst 
       (.I(hundreds_OBUF[3]),
        .O(hundreds[3]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h56AA)) 
    \hundreds_tmp[0]_i_1 
       (.I0(tens_OBUF[3]),
        .I1(tens_OBUF[0]),
        .I2(tens_OBUF[1]),
        .I3(tens_OBUF[2]),
        .O(p_2_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h554A)) 
    \hundreds_tmp[1]_i_1 
       (.I0(hundreds_OBUF[0]),
        .I1(hundreds_OBUF[1]),
        .I2(hundreds_OBUF[2]),
        .I3(hundreds_OBUF[3]),
        .O(p_2_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h998A)) 
    \hundreds_tmp[2]_i_1 
       (.I0(hundreds_OBUF[1]),
        .I1(hundreds_OBUF[0]),
        .I2(hundreds_OBUF[2]),
        .I3(hundreds_OBUF[3]),
        .O(p_2_out[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h5602)) 
    \hundreds_tmp[3]_i_1 
       (.I0(hundreds_OBUF[2]),
        .I1(hundreds_OBUF[0]),
        .I2(hundreds_OBUF[1]),
        .I3(hundreds_OBUF[3]),
        .O(p_2_out[3]));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_2_out[0]),
        .Q(hundreds_OBUF[0]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_2_out[1]),
        .Q(hundreds_OBUF[1]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_2_out[2]),
        .Q(hundreds_OBUF[2]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \hundreds_tmp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_2_out[3]),
        .Q(hundreds_OBUF[3]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  OBUF \ones_OBUF[0]_inst 
       (.I(ones_OBUF[0]),
        .O(ones[0]));
  OBUF \ones_OBUF[1]_inst 
       (.I(ones_OBUF[1]),
        .O(ones[1]));
  OBUF \ones_OBUF[2]_inst 
       (.I(ones_OBUF[2]),
        .O(ones[2]));
  OBUF \ones_OBUF[3]_inst 
       (.I(ones_OBUF[3]),
        .O(ones[3]));
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
    .INIT(16'h554A)) 
    \ones_tmp[1]_i_1 
       (.I0(ones_OBUF[0]),
        .I1(ones_OBUF[1]),
        .I2(ones_OBUF[2]),
        .I3(ones_OBUF[3]),
        .O(\ones_tmp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h998A)) 
    \ones_tmp[2]_i_1 
       (.I0(ones_OBUF[1]),
        .I1(ones_OBUF[0]),
        .I2(ones_OBUF[2]),
        .I3(ones_OBUF[3]),
        .O(\ones_tmp[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ones_tmp[3]_i_1 
       (.I0(thousands_tmp1),
        .O(\ones_tmp[3]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h7F)) 
    \ones_tmp[3]_i_2 
       (.I0(count_reg__0[2]),
        .I1(count_reg__0[3]),
        .I2(thousands_tmp1),
        .O(ones_tmp));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h5602)) 
    \ones_tmp[3]_i_3 
       (.I0(ones_OBUF[2]),
        .I1(ones_OBUF[0]),
        .I2(ones_OBUF[1]),
        .I3(ones_OBUF[3]),
        .O(\ones_tmp[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\ones_tmp[0]_i_1_n_0 ),
        .Q(ones_OBUF[0]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\ones_tmp[1]_i_1_n_0 ),
        .Q(ones_OBUF[1]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\ones_tmp[2]_i_1_n_0 ),
        .Q(ones_OBUF[2]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ones_tmp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\ones_tmp[3]_i_3_n_0 ),
        .Q(ones_OBUF[3]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  OBUF sseg_enable_OBUF_inst
       (.I(sseg_enable_OBUF),
        .O(sseg_enable));
  LUT5 #(
    .INIT(32'h00010000)) 
    sseg_enable_i_1
       (.I0(count_reg__0[1]),
        .I1(count_reg__0[0]),
        .I2(count_reg__0[3]),
        .I3(count_reg__0[2]),
        .I4(thousands_tmp1),
        .O(sseg_enable0_out));
  LUT3 #(
    .INIT(8'h2A)) 
    sseg_enable_i_2
       (.I0(thousands_tmp1),
        .I1(count_reg__0[2]),
        .I2(count_reg__0[3]),
        .O(sseg_enable1_out));
  FDSE #(
    .INIT(1'b1)) 
    sseg_enable_reg
       (.C(clk_IBUF_BUFG),
        .CE(sseg_enable1_out),
        .D(1'b0),
        .Q(sseg_enable_OBUF),
        .S(sseg_enable0_out));
  OBUF \tens_OBUF[0]_inst 
       (.I(tens_OBUF[0]),
        .O(tens[0]));
  OBUF \tens_OBUF[1]_inst 
       (.I(tens_OBUF[1]),
        .O(tens[1]));
  OBUF \tens_OBUF[2]_inst 
       (.I(tens_OBUF[2]),
        .O(tens[2]));
  OBUF \tens_OBUF[3]_inst 
       (.I(tens_OBUF[3]),
        .O(tens[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h56AA)) 
    \tens_tmp[0]_i_1 
       (.I0(ones_OBUF[3]),
        .I1(ones_OBUF[0]),
        .I2(ones_OBUF[1]),
        .I3(ones_OBUF[2]),
        .O(\tens_tmp[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h554A)) 
    \tens_tmp[1]_i_1 
       (.I0(tens_OBUF[0]),
        .I1(tens_OBUF[1]),
        .I2(tens_OBUF[2]),
        .I3(tens_OBUF[3]),
        .O(\tens_tmp[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h998A)) 
    \tens_tmp[2]_i_1 
       (.I0(tens_OBUF[1]),
        .I1(tens_OBUF[0]),
        .I2(tens_OBUF[2]),
        .I3(tens_OBUF[3]),
        .O(\tens_tmp[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h5602)) 
    \tens_tmp[3]_i_1 
       (.I0(tens_OBUF[2]),
        .I1(tens_OBUF[0]),
        .I2(tens_OBUF[1]),
        .I3(tens_OBUF[3]),
        .O(\tens_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\tens_tmp[0]_i_1_n_0 ),
        .Q(tens_OBUF[0]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\tens_tmp[1]_i_1_n_0 ),
        .Q(tens_OBUF[1]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\tens_tmp[2]_i_1_n_0 ),
        .Q(tens_OBUF[2]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \tens_tmp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(\tens_tmp[3]_i_1_n_0 ),
        .Q(tens_OBUF[3]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  OBUF \thousands_OBUF[0]_inst 
       (.I(thousands_OBUF[0]),
        .O(thousands[0]));
  OBUF \thousands_OBUF[1]_inst 
       (.I(thousands_OBUF[1]),
        .O(thousands[1]));
  OBUF \thousands_OBUF[2]_inst 
       (.I(thousands_OBUF[2]),
        .O(thousands[2]));
  OBUF \thousands_OBUF[3]_inst 
       (.I(thousands_OBUF[3]),
        .O(thousands[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h56AA)) 
    \thousands_tmp[0]_i_1 
       (.I0(hundreds_OBUF[3]),
        .I1(hundreds_OBUF[0]),
        .I2(hundreds_OBUF[1]),
        .I3(hundreds_OBUF[2]),
        .O(p_1_out[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h554A)) 
    \thousands_tmp[1]_i_1 
       (.I0(thousands_OBUF[0]),
        .I1(thousands_OBUF[1]),
        .I2(thousands_OBUF[2]),
        .I3(thousands_OBUF[3]),
        .O(p_1_out[1]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h998A)) 
    \thousands_tmp[2]_i_1 
       (.I0(thousands_OBUF[1]),
        .I1(thousands_OBUF[0]),
        .I2(thousands_OBUF[2]),
        .I3(thousands_OBUF[3]),
        .O(p_1_out[2]));
  LUT4 #(
    .INIT(16'h5602)) 
    \thousands_tmp[3]_i_1 
       (.I0(thousands_OBUF[2]),
        .I1(thousands_OBUF[0]),
        .I2(thousands_OBUF[1]),
        .I3(thousands_OBUF[3]),
        .O(p_1_out[3]));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_1_out[0]),
        .Q(thousands_OBUF[0]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_1_out[1]),
        .Q(thousands_OBUF[1]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_1_out[2]),
        .Q(thousands_OBUF[2]),
        .R(\ones_tmp[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \thousands_tmp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(ones_tmp),
        .D(p_1_out[3]),
        .Q(thousands_OBUF[3]),
        .R(\ones_tmp[3]_i_1_n_0 ));
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
