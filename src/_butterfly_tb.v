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
// - Version 2.1 20/04/17: Change test vectors.
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
    #10  clac_in_test = 136'b0000000010000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000000;
    //                           x[1]Real         x[1]Imag          x[2]Real         x[1]Imag         x[3]Real         x[3]Imag         x[4]Real         x[4]Imag
    #10  rotation_test = 3'b000;

    temp1 = clac_out_test;

    #20  clac_in_test = 136'b0000000110000000000000000000000000000000010000000000000001000000000000000000100000000000001000000000000000000100000000000000001000000000;
    //                           x[5]Real         x[5]Imag          x[6]Real         x[6]Imag         x[7]Real         x[7]Imag         x[8]Real         x[8]Imag
    #20  rotation_test = 3'b001;

    temp2 = clac_out_test;

    #30  clac_in_test = 136'b0000000010000000000000000000000000000000010000000000000001000000000000000000100000000000000000000000000000000000000000000000000000000000;
    //                           x[9]Real         x[9]Imag         x[10]Real        x[10]Imag        x[11]Real        x[11]Imag        x[12]Real        x[12]Imag
    #30  rotation_test = 3'b010;

    temp3 = clac_out_test;

    #40  clac_in_test = 136'b0000000010000000000000000000000000000000001000000000000000000000000000000000100000000000000000000000000000000010000000000000000000000000;
    //                          x[13]Real         x[13]Imag         x[14]Real       x[14]Imag        x[15]Real        x[15]Imag        x[16]Real        x[16]Imag
    #40  rotation_test = 3'b011;

    temp4 = clac_out_test;

    $display("\n\nStage 2\n");

    #50  clac_in_test = temp1;
    #50  rotation_test = 3'b100;
    $display("%b.%b %b j%b.%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);

    #60  clac_in_test = temp2;
    #60  rotation_test = 3'b101;
    $display("%b.%b %b j%b.%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);

    #70  clac_in_test = temp3;
    #70  rotation_test = 3'b110;
    $display("%b.%b %b j%b.%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);

    #80  clac_in_test = temp4;
    #80  rotation_test = 3'b111;
    $display("%b.%b %b j%b.%b\n", clac_out_test[135], clac_out_test[134:127], clac_out_test[126:119], clac_out_test[118], clac_out_test[117:110], clac_out_test[109:102]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[101], clac_out_test[100:93],  clac_out_test[92:85],   clac_out_test[84],  clac_out_test[83:76],   clac_out_test[75:68]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[67],  clac_out_test[66:59],   clac_out_test[58:51],   clac_out_test[50],  clac_out_test[49:42],   clac_out_test[41:34]);
    $display("%b.%b %b j%b.%b\n", clac_out_test[33],  clac_out_test[32:25],   clac_out_test[24:17],   clac_out_test[16],  clac_out_test[15:8],    clac_out_test[7:0]);
    #1000 $stop;   
  end

endmodule