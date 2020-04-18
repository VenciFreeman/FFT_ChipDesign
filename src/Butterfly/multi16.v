//**********************************************************
// Author: @Qi yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
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
// - Version 3.8 20/04/17: Check again, fix some errors and add comments;
// - Version 3.9 20/04/17: Fix 2's complement error.
//
// Notes: 
//
//**********************************************************

module multi16(
  input wire [16:0] in_17bit,  // 17-bit input  data
  input wire [7:0]  in_8bit,   // 8-bit  input  data
  output wire [16:0] out        // 17-bit output data
  );

  wire flag;               // determine the sign of the product
  wire [16:0] in_17bit_b;  // store 17-bit true form data
  wire [7:0]  in_8bit_b;   // store 8-bit  true form data
  wire [24:0] mul_b;
  wire [16:0] mul_b_short;

  // always @ (in_17bit or in_8bit) begin
  assign  in_17bit_b = (in_17bit[16] == 1) ? ~in_17bit[16:0] + 1'b1 : in_17bit;
  assign  in_8bit_b = (in_8bit[7] == 1) ? ~in_8bit[7:0] + 1'b1 : in_8bit;
  assign  flag = in_17bit[16]+in_8bit[7];
  assign  mul_b = in_17bit_b[16:0] * in_8bit_b[7:0];
  assign  mul_b_short = {mul_b[23:15],mul_b[14:7]};
  assign  out = (flag==1) ? ~mul_b_short[16:0] + 1'b1 : mul_b_short;
  // end
endmodule
