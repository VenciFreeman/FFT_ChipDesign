//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: top
//
// Type: <Sequential or Combinational, etc.>
//
// Purpose: <Specific Function Description>
// 
//
// Details:
// - Design Logic;
// - Variable setting.
//
// Release History:
// - Version 1.0 20/03/24: Create.
//
// Notes:
// - <Problems>;
// - <Optimization Method>;
// - <Other Useful Info>.
//**********************************************************

`include "ctrl.v"
`include "s_p.v"
`include "mux.v"
`include "butterfly.v"
`include "demux.v"
`include "reg1.v"
`include "p_s.v"

module top(clk, rst_n, data_in, data out)

  input clk;  // clock
  input rst_n;  // reset signal
  input data_in[33:0];  // <Specific Description> 

  output data_out[33:0];  // <Specific Description>  

  wire clk;
  wire rst_n;
  wire [33:0] data_in;

  reg [33:0] data_out;  // All the output signals should use reg

  ctrl ctrl0(
    .clk(clk),
    .rst_n(rst_n),
    .s_p_flag_out(s_p_flag_out),
	.s_p_lag_mux(s_p_flag_mux),
    .reg1_flag_mux(reg1_flag_mux),
    .mux_flag(mux_flag),
    .rotation(rotation),
	.demux_flag(demux_flag)
);

  s_p s_p0(
	.clk(clk),
	.rst_n(rst_n),
	.data_in_0(data_in),
	.data_out_0(data_out_0)
  );

  mux mux0(
	data_out_0(data_out_0),
	data_out_1(data_out_1),
	clac_in(clac_in)
  );

  butterfly butterfly0(

  );

  reg2 reg20(

  );

  demux demux0(

  );

  p_s p_s0(

  );

endmodule