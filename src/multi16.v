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
// - Version 2.0 20/04/09: Modify.
//
// Notes:
//
//**********************************************************

module multi16(

  input [15:0] a_in,
  input [15:0] b_in,
  output[15:0] result,

  );

  reg[15:0] areg;
  reg[15:0] breg;
  reg[15:0] result_r;
  reg done_r;
  reg[4:0] i;  // count

  assign done = done_r;
  assign result = result_r;

  always @ (a_in or b_in) begin
    if (i < 5'd17)
      i <= i + 1'b1; 
    else
      i <= 5'd0;
  end

  always @ (a_in or b_in) begin
    if (i == 5'd0)
      areg <= a_in;
  end

  always @ (a_in or b_in) begin
    if (i == 5'd0)
      breg <= b_in;
  end

  always @ (a_in or b_in) begin
    if (i > 5'd0 && i < 5'd17)
      if ( areg[i - 1] )
        result_r = result_r + (breg << (i - 1));
  end

endmodule