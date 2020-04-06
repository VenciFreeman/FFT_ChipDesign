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
// - Version 1.2 20/04/06. Modify the multiply method.
//
// Notes:
//
//**********************************************************

module butterfly(

  input  wire[135:0] clac_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire[23:0]  rotation_factors,  // rotation factors of each butterfly computation
  output reg[135:0]  calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)

  );

  wire signed [16:0] row1_1_real, row1_1_imag;  // row means stage of FFT. 16-point 4-radix FFT has 2 stages.
  wire signed [16:0] row1_2_real, row1_2_imag;
  wire signed [16:0] row1_3_real, row1_3_imag;
  wire signed [16:0] row1_4_real, row1_4_imag;
  wire signed [16:0] row2_1_real, row2_1_imag;
  wire signed [16:0] row2_2_real, row2_2_imag;
  wire signed [16:0] row2_3_real, row2_3_imag;
  wire signed [16:0] row2_4_real, row2_4_imag;

  assign row1_1_real = clac_in[33:17];
  assign row1_1_imag = clac_in[16:0];
  assign row1_2_real = clac_in[67:51] >> rotation_factors[7:0];  // Need the specific figures to rewrite as shift operation.
  assign row1_2_imag = clac_in[50:34] >> rotation_factors[7:0];
  assign row1_3_real = clac_in[101:85] >> rotation_factors[15:8];
  assign row1_3_imag = clac_in[84:68] >> rotation_factors[15:8];
  assign row1_4_real = clac_in[135:119] >> rotation_factors[23:16];
  assign row1_4_imag = clac_in[118:102] >> rotation_factors[23:16];

  assign row2_1_real = row1_1_real + row1_3_real;
  assign row2_1_imag = row1_1_imag + row1_3_imag;
  assign row2_2_real = row1_1_real - row1_3_real;
  assign row2_2_imag = row1_1_imag - row1_3_imag;
  assign row2_3_real = row1_2_real + row1_4_real;
  assign row2_3_imag = row1_2_imag + row1_4_imag;
  assign row2_4_real = row1_2_real - row1_4_real;
  assign row2_4_imag = row1_2_imag - row1_4_imag;

  assign clac_out = { (row2_2_real - row2_4_real) , (row2_2_imag - row2_4_imag)
                    , (row2_2_real + row2_4_real) , (row2_2_imag + row2_4_imag)
                    , (row2_1_real - row2_3_real) , (row2_1_imag - row2_3_imag)
                    , (row2_1_real + row2_3_real) , (row2_1_imag + row2_3_imag)};

endmodule