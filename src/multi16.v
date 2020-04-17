//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: multi16
//
// Type: Sequential
//
// Purpose: The function of this module is to perform decimal arithmetic.
//
// Details: Input and output are both 2's Complements.
//
// Release History:
// - Version 1.0 20/04/09: Create;
// - Version 2.0 20/04/09: Modify;
// - Version 3.0 20/04/12: Transform to a decimal multiplier;
// - Version 3.1 20/04/12: Rewrite always parts;
// - Version 3.2 20/04/12: Add rst_n to the sensitive list;
// - Version 3.3 20/04/12: Fix some errors, compile successful;
// - Version 3.4 20/04/12: Add comments;
// - Version 3.5 20/04/14: Transform to 17-bit input;
// - Version 3.6 20/04/16: Fix some simulation errors;
// - Version 3.7 20/04/16: Simulate successful. Still need to check results;
// - Version 3.8 20/04/17: Check again, fix some errors and add comments.
//
// Notes: 
//
//**********************************************************

module multi16(

  input wire        clk,       // clock
  input wire        rst_n,     // reset
  input wire [16:0] in_17bit,  // 17-bit input  data
  input wire [7:0]  in_8bit,   // 8-bit  input  data
  output reg [16:0] out        // 17-bit output data
  
  );

  reg flag;               // determine the sign of the product
  reg [16:0] in_17bit_b;  // store 17-bit true form data
  reg [7:0]  in_8bit_b;   // store 8-bit  true form data
  reg [21:0] sum;
  reg [23:0] sum_b;

// This always part controls signal in_17bit_b. Feature: 2's Complement ==> True Form
  always @ (posedge clk or negedge rst_n) begin
    if( !rst_n )
      in_17bit_b <= 17'b0;
    else
      in_17bit_b <= (in_17bit[16] == 1) ? {in_17bit[16] , ~in_17bit[14:0] + 1'b1} : in_17bit;
    // If in_17bit is a negative number, transform to 2's complement, otherwise remain the same.
  end

// This always part controls signal in_8bit_b. Feature: 2's Complement ==> True Form
  always @ (posedge clk or negedge rst_n) begin
    if( !rst_n )
      in_8bit_b <= 8'b0;
    else
      in_8bit_b <= (in_8bit[7] == 1) ? {in_8bit[7], ~in_8bit[6:0] + 1'b1} : in_8bit;
    // If in_8bit is a negative number, transform to 2's complement, otherwise remain the same.
  end

// This always part controls signal flag. Feature: Determine the sign of the product
  always @ ( posedge clk or negedge rst_n ) begin
    if( !rst_n )
      flag <= 1'b0;
    else
      flag <= in_17bit_b[16] ^ in_8bit_b[7];
    // Determine the sign of the product.      
  end

// This always part controls signal sum. Feature: Calculate decimal
  always @ ( posedge clk or negedge rst_n ) begin
    if( !rst_n )
      sum <= 22'b0;
    else
      sum <= in_17bit_b[15:0] * in_8bit_b[6:0];
      // Calculate the absolute value of the product.
  end

// This always part controls signal sum_b. Feature: The signed product represented by true form
  always @ ( posedge clk or negedge rst_n ) begin
    if( !rst_n )
      sum_b <= 24'b0;
    else
      sum_b <= {flag, sum, 1'b0};
    // Add the sign.
  end

// This always part controls signal out. Feature: True Form ==> 2's Complement
  always @ ( posedge clk or negedge rst_n ) begin
    if( !rst_n )
      out <= 17'b0;
    else
      out <= sum_b[23] ? {sum_b[23], ~sum_b[22:7] + 1'b1} : sum_b[23:7];  // Output only keep 17 bits
  end

endmodule