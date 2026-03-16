//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: multi16
//
// Type: Combinatorial
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
// - Version 3.9 20/04/17: Fix 2's complement error;
// - Version 4.0 20/04/18: Transform to combinatorial logic;
// - Version 4.1 20/04/19: Fix error, Merge branch from @mikeq123456；
// - Version 4.2 20/04/19: Fix some errors;
// - Version 4.3 20/04/19: Debug finished. No error, function correct;
// - Version 5.0 20/05/03: Rewrite. Change to shift.
//
// Notes: 
//
//**********************************************************

module multi16(

  input  wire [16:0] in_17bit,  // 17-bit input  data
  input  wire [7:0]  in_8bit,   // 8-bit  input  data
  output wire [16:0] out        // 17-bit output data
  
  );

  wire        sign_flag;
  wire [16:0] in_17bit_abs;
  wire [7:0]  in_8bit_abs;
  wire [24:0] product_abs;
  wire [16:0] scaled_abs;

  assign sign_flag   = in_17bit[16] ^ in_8bit[7];
  assign in_17bit_abs = in_17bit[16] ? (~in_17bit + 1'b1) : in_17bit;
  assign in_8bit_abs  = in_8bit[7]   ? (~in_8bit  + 1'b1) : in_8bit;
  assign product_abs  = in_17bit_abs * in_8bit_abs;
  assign scaled_abs   = {product_abs[23:15], product_abs[14:7]};
  assign out          = sign_flag ? (~scaled_abs + 1'b1) : scaled_abs;
  
endmodule
