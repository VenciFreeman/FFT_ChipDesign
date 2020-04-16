//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly_tb
//
// Type: Sequential
//
// Purpose: Test butterfly module.
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/15: Create;
// - Version 2.0 20/04/16: Fix some errors.
//
// Notes:
// - data format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im).
// - Input and output are both 2's Complements.
//
//**********************************************************
`include "butterfly.v"

module butterfly_tb( );

  reg          clk_test;
  reg          rst_n_test;
  reg  [135:0] clac_in_test;
  reg  [2:0]   rotation_test;
  wire [135:0] clac_out_test;

  reg [135:0]  temp1, temp2, temp3, temp4;

  parameter clk_freq = 10;

  butterfly butterfly0(
    .clk(clk_test),
    .rst_n(rst_n_test),
    .calc_in(clac_in_test),
    .rotation(rotation_test),
    .calc_out(clac_out_test)
  );

  initial begin
    clk_test = 0;
    rst_n_test = 0;
    clac_in_test = 135'b0;
    rotation_test = 3'b0;
  end

  always begin
      #(clk_freq / 2) clk_test = ~ clk_test;	// create a 100MHz clock
      rst_n_test = 1;
  end

  initial begin
    $display("\n\nLoad Data\n");
    #10  clac_in_test = 135'b00000000000000000000000000000000000000000000000000000000000000000000;
    #10  rotation_test = 3'b000;

    temp1 = clac_out_test;

    #20  clac_in_test = 135'b00000000000000000000000100000000000000010000000000000000001000000000;
    #20  rotation_test = 3'b001;

    temp2 = clac_out_test;

    #30  clac_in_test = 135'b00000000000000000000000100000000000000000000000000000000000000000000;
    #30  rotation_test = 3'b010;

    temp3 = clac_out_test;

    #40  clac_in_test = 135'b00000000000000000000000000000000000000000000000000000000000000000000;
    #40  rotation_test = 3'b011;

    temp4 = clac_out_test;

    $display("\n\nStage 2\n");

    #50  clac_in_test = temp1;
    #50  rotation_test = 3'b100;
    $display("%b + j%b\n", clac_out_test[135:119], clac_out_test[118:102]);
    $display("%b + j%b\n", clac_out_test[101:85], clac_out_test[84:68]);
    $display("%b + j%b\n", clac_out_test[67:51], clac_out_test[50:34]);
    $display("%b + j%b\n", clac_out_test[33:17], clac_out_test[16:0]);

    #60  clac_in_test = temp2;
    #60  rotation_test = 3'b101;
    $display("%b + j%b\n", clac_out_test[135:119], clac_out_test[118:102]);
    $display("%b + j%b\n", clac_out_test[101:85], clac_out_test[84:68]);
    $display("%b + j%b\n", clac_out_test[67:51], clac_out_test[50:34]);
    $display("%b + j%b\n", clac_out_test[33:17], clac_out_test[16:0]);

    #70  clac_in_test = temp3;
    #70  rotation_test = 3'b110;
    $display("%b + j%b\n", clac_out_test[135:119], clac_out_test[118:102]);
    $display("%b + j%b\n", clac_out_test[101:85], clac_out_test[84:68]);
    $display("%b + j%b\n", clac_out_test[67:51], clac_out_test[50:34]);
    $display("%b + j%b\n", clac_out_test[33:17], clac_out_test[16:0]);

    #80  clac_in_test = temp4;
    #80  rotation_test = 3'b111;
    $display("%b + j%b\n", clac_out_test[135:119], clac_out_test[118:102]);
    $display("%b + j%b\n", clac_out_test[101:85], clac_out_test[84:68]);
    $display("%b + j%b\n", clac_out_test[67:51], clac_out_test[50:34]);
    $display("%b + j%b\n", clac_out_test[33:17], clac_out_test[16:0]);

    #1000 $stop;   
  end

endmodule