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
// - Version 1.0 20/04/15: Create.
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
    .clac_in(data_in_test),
    .rotation(rotation_test),
    .clac_out(data_out_test)
  );

  initial begin
    clk_test = 0;
    rst_n_test = 0;
    clac_in_test = 135'b0;
    rotation_test = 3'b0;
  end

  always begin
      #(clk_frac / 2) clk_test = ~ clk_test;	// create a 100MHz clock
      rst_n_test = 1;
  end

  initial begin
    $display("\n\nLoad Data\n");
    #10  data_in = 135'b00000000000000000000000000000000000000000000000000000000000000000000;
    #10  rotation = 3'b000;

    temp1 = data_out;

    #20  data_in = 135'b00000000000000000000000100000000000000010000000000000000001000000000;
    #20  rotation = 3'b001;

    temp2 = data_out;

    #30  data_in = 135'b00000000000000000000000100000000000000000000000000000000000000000000;
    #30  rotation = 3'b010;

    temp3 = data_out;

    #40  data_in = 135'b00000000000000000000000000000000000000000000000000000000000000000000;
    #40  rotation = 3'b011;

    temp4 = data_out;

    $display("\n\nStage 2\n");

    #50  data_in = temp1;
    #50  rotation = 3'b100;
    $display("%b + j%b\n", data_out[135:119][118:102]);
    $display("%b + j%b\n", data_out[101:85][84:68]);
    $display("%b + j%b\n", data_out[67:51][50:34]);
    $display("%b + j%b\n", data_out[33:17][16:0]);

    #60  data_in = temp2;
    #60  rotation = 3'b101;
    $display("%b + j%b\n", data_out[135:119][118:102]);
    $display("%b + j%b\n", data_out[101:85][84:68]);
    $display("%b + j%b\n", data_out[67:51][50:34]);
    $display("%b + j%b\n", data_out[33:17][16:0]);

    #70  data_in = temp3;
    #70  rotation = 3'b110;
    $display("%b + j%b\n", data_out[135:119][118:102]);
    $display("%b + j%b\n", data_out[101:85][84:68]);
    $display("%b + j%b\n", data_out[67:51][50:34]);
    $display("%b + j%b\n", data_out[33:17][16:0]);

    #80  data_in = temp4;
    #80  rotation = 3'b111;
    $display("%b + j%b\n", data_out[135:119][118:102]);
    $display("%b + j%b\n", data_out[101:85][84:68]);
    $display("%b + j%b\n", data_out[67:51][50:34]);
    $display("%b + j%b\n", data_out[33:17][16:0]);

    #1000 $stop;   
  end

endmodule