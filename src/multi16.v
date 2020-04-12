//**********************************************************
// Author: @VenciFreeman,  copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: multi16
//
// Type: Sequential
//
// Purpose:
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/09: Create;
// - Version 2.0 20/04/09: Modify;
// - Version 3.0 20/04/12: Transform to a decimal multiplier;
// - Version 3.1 20/04/12: Rewrite always parts.
//
// Notes:
//
//**********************************************************

module multi16(

  input clk,
  input rst_n,
  input [15:0] in_16bit,
  input [7:0] in_8bit,
  output reg[15:0] out
  
  );

  reg flag;
  reg [15:0] in_16bit_b;
  reg [7:0]  in_8bit_b;
  reg [21:0] sum;
  reg [23:0] sum_b;

  always @(posedge clk) begin
    if( !rst_n )
      in_16bit_b <= 16'b0;
    else
      in_16bit_b <= (xin_16[15] == 1) ? {xin_16[15] , ~xin_16[14:0] + 1'b1} : xin_16;  // 2's Complement ==> True Form
  end

  always @(posedge clk) begin
    if( !rst_n )
      in_8bit_b <= 8'b0;
    else
      in_8bit_b  <= (xin_8[7]   == 1) ? {xin_8 [7]  , ~xin_8 [6:0]  + 1'b1} : xin_8;  // 2's Complement ==> True Form
  end

  always @(posedge clk) begin
    if( !rst_n )
      flag <= 1'b0;
    else
      flag <= in_16bit_b[15] ^ in_8bit_b[7];  // Determine the sign of the product
  end

  always @(posedge clk) begin
    if( !rst_n )
      sum <= 22'b0;
    else
      sum <= in_16bit_b[14:0] * in_8bit_b[6:0];  // Calculate decimal
  end

  always @(posedge clk) begin
    if( !rst_n )
      sum_b <= 24'b0;
    else
      sum_b <= {flag, sum, 1'b0};  // The signed product represented by true form
  end

  always @(posedge clk) begin
    if( !rst_n )
      out <= 24'b0;
    else
      out <= sum_b[23] ? {sum_b[23], ~sum_b[22:9] + 1'b1} : sum_b[23:8];  // True Form ==> 2's Complement
  end

endmodule