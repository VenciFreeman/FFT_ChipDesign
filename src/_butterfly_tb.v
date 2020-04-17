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
// - Version 2.0 20/04/16: Fix some errors;
// - Version 2.1 20/04/17: Change test vectors;
// - Version 2.2 20/04/18: Edit display style.
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

  reg  [135:0] temp1, temp2, temp3, temp4;

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
    #110  clac_in_test = 136'b0000000010000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000;
    //                       |   x[1]Real    ||    x[1]Imag   ||    x[2]Real   ||    x[1]Imag   ||    x[3]Real   ||    x[3]Imag   ||    x[4]Real   ||   x[4]Imag    |
    #110  rotation_test = 3'b000;

    temp1 = clac_out_test;

    #210  clac_in_test = 136'b0000000110000000000000000000000000000000010000000000000001000000000000000000100000000000001000000000000000000100000000000000001000000000;
    //                       |   x[5]Real    ||    x[5]Imag   ||    x[6]Real   ||    x[6]Imag   ||    x[7]Real   ||    x[7]Imag   ||    x[8]Real   ||   x[8]Imag    |
    #210  rotation_test = 3'b001;

    temp2 = clac_out_test;

    #310  clac_in_test = 136'b0000000010000000000000000000000000000000010000000000000001000000000000000000100000000000000000000000000000000000000000000000000000000000;
    //                       |   x[9]Real    ||    x[9]Imag   ||    x[10]Real  ||    x[10]Imag  ||    x[11]Real  ||    x[11]Imag  ||    x[12]Real  ||   x[12]Imag   |
    #310  rotation_test = 3'b010;

    temp3 = clac_out_test;

    #410  clac_in_test = 136'b0000000010000000000000000000000000000000001000000000000000000000000000000000100000000000000000000000000000000010000000000000000000000000;
    //                       |   x[13]Real   ||    x[13]Imag  ||    x[14]Real  ||    x[14]Imag  ||    x[15]Real  ||    x[15]Imag  ||    x[16]Real  ||   x[16]Imag   |
    #410  rotation_test = 3'b011;

    temp4 = clac_out_test;

    $display("\n\nStage 2\n");

    #510  clac_in_test = temp1;
    #510  rotation_test = 3'b100;
    $display("[0] %b_%b_%b %b_%b_%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("[4] %b_%b_%b %b_%b_%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("[8] %b_%b_%b %b_%b_%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("[12]%b_%b_%b %b_%b_%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);

    #610  clac_in_test = temp2;
    #610  rotation_test = 3'b101;
    $display("[1] %b_%b_%b %b_%b_%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("[5] %b_%b_%b %b_%b_%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("[9] %b_%b_%b %b_%b_%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("[13]%b_%b_%b %b_%b_%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);

    #710  clac_in_test = temp3;
    #710  rotation_test = 3'b110;
    $display("[2] %b_%b_%b %b_%b_%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("[6] %b_%b_%b %b_%b_%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("[10]%b_%b_%b %b_%b_%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("[14]%b_%b_%b %b_%b_%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);

    #810  clac_in_test = temp4;
    #810  rotation_test = 3'b111;
    $display("[3] %b_%b_%b %b_%b_%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("[7] %b_%b_%b %b_%b_%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("[11]%b_%b_%b %b_%b_%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("[15]%b_%b_%b %b_%b_%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);
    #1000 $stop;   
  end

endmodule