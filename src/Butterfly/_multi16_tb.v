//**********************************************************
// Author: @Qi yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: _multi16_tb
//
// Type: Sequential
//
// Purpose: Test butterfly module.
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/17: Create.
//
// Notes:
// - data format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im).
// - Input and output are both 2's Complements.
//
//**********************************************************
`include "multi16.v"

module multi16_tb();

  reg          clk_test;
  reg          rst_n_test;
  reg  [16:0]  in_17bit_test;
  reg  [7:0]   in_8bit_test;
  wire [16:0]  out_test;

  parameter clk_freq = 10;

  multi16 multi160(
    .in_17bit(in_17bit_test),
    .in_8bit(in_8bit_test),
    .out(out_test)
  );

  initial begin
    clk_test = 0;
    rst_n_test = 0;
    in_17bit_test = 17'b0;
    in_8bit_test = 8'b0;
  end

  always begin
    #(clk_freq / 2) clk_test = ~ clk_test;	// create a 100MHz clock
    rst_n_test = 1;
  end

  initial begin
    #10 begin
      in_17bit_test = 17'b11111111100000000;
      in_8bit_test  = 8'b11000000;
    #5 $display("%d.%b\n", $signed(out_test[16:8]), out_test[7:0]);
    end
  end

endmodule