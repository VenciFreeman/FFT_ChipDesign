//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: top
//
// Type: Sequential
//
// Purpose: Top moudule.
// 
//
// Details:
//
// Release History:
// - Version 1.0 20/03/24: Create;
// - Version 1.1 20/04/06: Update butterfly top, and fix some errors;
// - Version 1.2 20/04/14: Update and check tops, and comment;
// - Version 1.3 20/04/14: Add statements.
//
// Notes:
// - Many modules still have not specific signal names.
//**********************************************************

`include "ctrl.v"
`include "s_p.v"
`include "mux.v"
`include "butterfly.v"
`include "demux.v"
`include "reg.v"
`include "p_s.v"

module top(

  input wire       clk,       // clock
  input wire       rst_n,     // reset
  input wire[33:0] data_in,   // input from pin
  output reg[33:0] data_out   // output to pin

  );

  wire        mux_flag, demux_flag, s_p_flag;  // seems need a signal called ps_s_flag. Refer warning 02.
  wire[2:0]   rotation;
  wire[135:0] data_1, data_2, data_3, data_4, data_5, data_6;

  ctrl ctrl0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .s_p_flag_in(s_p_flag),   // input from s_p
    .mux_flag(mux_flag),      // output to mux  #* Warning 01: Please check s_p_flag_mux in s_p *#
    .rotation(rotation),      // output to butterfly
    .demux_flag(demux_flag)   // output to demux
  );                          //                #* Warning 02: Please check p_s need a signal called p_s_flag *#

  s_p s_p0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .data_in_1(data_in),      // input from top
    .data_out_1(data_1),      // output to mux
    .s_p_flag_out(s_p_flag),  // output to ctrl
    .s_p_flag_mux(mux_flag)   // output to mux  #* Warning 01: Please check: s_p_flag_mux in s_p *#
  );

  mux mux0(
    .mux_flag(mux_flag),      // input from ctrl 
    .data_in_1(data_1),       // input from s_p
    .data_in_2(data_2),       // input from reg2
    .data_out(data_3)         // output to butterfly
  );

  butterfly butterfly0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .clac_in(data_3),         // input from mux
    .rotation(rotation),      // input from ctrl
    .clac_out(data_4)         // output to demux
  );

  reg2 reg20(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .data_in(data_5),
    .data_out_1(data_2),
  );

  demux demux0(
    .demux_flag(demux_flag),  // input from ctrl
    .data_in(data_4),         // input from butterfly
    .data_out_1(data_5),      // output to reg2
    .data_out_2(data_6)       // output to p_s
  );

  p_s p_s0(
    .clk(clk),                // input from top
    .rst_n(rst_n),            // input from top
    .p_s_flag_in(),           // input from ctrl  #* Warning 02: Please check no p_s_flag in ctrl *#
    .data_in_3(data_6),       // input from demux
    .data_out_3(data_out)     // output to top
  );

endmodule