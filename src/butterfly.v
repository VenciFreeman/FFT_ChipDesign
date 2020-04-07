//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly
//
// Type: Combinational
//
// Purpose: Butterfly computation for 16-bit 4-radix FFT.
//
// Details: 
//
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/03/20: Modify;
// - Version 1.2 20/04/06: Modify the multiply method;
// - Version 1.3 20/04/07: Add state machine.
//
// Notes:
//
//**********************************************************

module butterfly(

  input  wire[135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire[23:0]  rotation,  // rotation factors of each butterfly computation
  output reg[135:0]  calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)

  );

  parameter sin_1_8pi = 8'b;  // 0.9238
  parameter sin_2_8pi = 8'b;
  parameter sin_3_8pi = 8'b;
  parameter sin_4_8pi = 8'b;
  parameter cos_5_8pi = 8'b;
  parameter cos_6_8pi = 8'b;
  parameter cos_7_8pi = 8'b;


  parameter 


  wire signed [16:0] row1_1_real, row1_1_imag;  // row means stage of FFT. 16-point 4-radix FFT has 2 stages.
  wire signed [16:0] row1_2_real, row1_2_imag;
  wire signed [16:0] row1_3_real, row1_3_imag;
  wire signed [16:0] row1_4_real, row1_4_imag;
  wire signed [16:0] row2_1_real, row2_1_imag;
  wire signed [16:0] row2_2_real, row2_2_imag;
  wire signed [16:0] row2_3_real, row2_3_imag;
  wire signed [16:0] row2_4_real, row2_4_imag;

  reg rotation_factor1[]

  always @ ( rotation ) begin
    case ( rotation ) begin
      3'b000: begin
        rotation1 = 
      end
      3'b001: begin
      end
      3'b002: begin
      end
      3'b003: begin
      end
      3'b004: begin
      end
      3'b005: begin
      end
      3'b006: begin
      end
      3'b007: begin
      end
    end
  end 

  assign row1_1_real = calc_in[33:17];
  assign row1_1_imag = calc_in[16:0];
  assign row1_2_real = calc_in[67:51] >> rotation_factors[7:0];  // Need the specific figures to rewrite as shift operation.
  assign row1_2_imag = calc_in[50:34] >> rotation_factors[7:0];
  assign row1_3_real = calc_in[101:85] >> rotation_factors[15:8];
  assign row1_3_imag = calc_in[84:68] >> rotation_factors[15:8];
  assign row1_4_real = calc_in[135:119] >> rotation_factors[23:16];
  assign row1_4_imag = calc_in[118:102] >> rotation_factors[23:16];

  assign row2_1_real = row1_1_real + row1_3_real;
  assign row2_1_imag = row1_1_imag + row1_3_imag;
  assign row2_2_real = row1_1_real - row1_3_real;
  assign row2_2_imag = row1_1_imag - row1_3_imag;
  assign row2_3_real = row1_2_real + row1_4_real;
  assign row2_3_imag = row1_2_imag + row1_4_imag;
  assign row2_4_real = row1_2_real - row1_4_real;
  assign row2_4_imag = row1_2_imag - row1_4_imag;

  assign calc_out = { (row2_2_real - row2_4_real) , (row2_2_imag - row2_4_imag)
                    , (row2_2_real + row2_4_real) , (row2_2_imag + row2_4_imag)
                    , (row2_1_real - row2_3_real) , (row2_1_imag - row2_3_imag)
                    , (row2_1_real + row2_3_real) , (row2_1_imag + row2_3_imag)};

endmodule
