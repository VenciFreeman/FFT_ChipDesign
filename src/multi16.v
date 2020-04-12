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
// - Version 3.0 20/04/12: Transform to a decimal multiplier.
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
    if(!rst_n) begin
      out <= 24'd0;
      flag <= 1'b0;
      in_16bit_b <= 16'd0;
      in_8bit_b <= 8'd0;
      sum <= 22'd0;
      sum_b <= 24'd0;
    end
    else begin
    // 2's Complement ==> True Form
    in_16bit_b <= (xin_16[15] == 1) ? {xin_16[15] , ~xin_16[14:0] + 1'b1} : xin_16;
    in_8bit_b  <= (xin_8[7]   == 1) ? {xin_8 [7]  , ~xin_8 [6:0]  + 1'b1} : xin_8;

    // Determine the sign of the product
    flag <= in_16bit_b[15] ^ in_8bit_b[7];

    // Calculate decimal
    sum <= in_16bit_b[14:0] * in_8bit_b[6:0];
    
    // The signed product represented by true form
    sum_b <= {flag, sum, 1'b0};
    
    // True Form ==> 2's Complement
    out <= sum_b[23] ? {sum_b[23], ~sum_b[22:9] + 1'b1} : sum_b[23:8];
  end

endmodule