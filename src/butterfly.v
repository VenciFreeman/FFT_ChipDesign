//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly
//
// Type: Combinatorial
//
// Purpose: Butterfly computation for 16-bit 4-radix FFT.
//
// Details: 
// - Get calc_in signal from s_p, as input data for butterfly operation;
// - Get rotation signal from ctrl, as a parameter to select the rotation factor;
// - Every butterfly operation (8 in total) has 3 rotation factors. Selection via state machine;
// - Split complex addition into real multiplication and addition and subtraction.
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/03/20: Modify;
// - Version 1.2 20/04/06: Modify the multiply method;
// - Version 1.3 20/04/07: Add state machine；
// - Version 1.4 20/04/09: Rewrite multiply commands. Still many things need to rewrite;
// - Version 1.5 20/04/12: Use decimal multiplier;
// - Version 1.6 20/04/12: Use non-blocking assignment, transform to sequential;
// - Version 1.7 20/04/12: Edit decimal multiplier, rewrite wire/reg;
// - Version 2.0 20/04/12: Fix some errors, compile successful;
// - Version 2.1 20/04/12: Optimize layout, change to 2's complement and add notes;
// - Version 2.2 20/04/14: Update rotation factors;
// - Version 2.3 20/04/16: Fix some simulation errors;
// - Version 2.4 20/04/16: Fix some errors about bits;
// - Version 2.5 20/04/16: Simulate successful. Still need to check results;
// - Version 2.6 20/04/17: Check again, fix some errors. Simulate successful;
// - Version 2.7 20/04/17: Add signed;
// - Version 2.8 20/04/18: Check again, add comments;
// - Version 2.9 20/04/18: Fix rotation factors;
// - Version 3.0 20/04/18: Transform to combinatorial logic;
// - Version 3.1 20/04/18: Merge branch from @mikeq123456.
//
// Notes:
// - rotation_factor format: (Re,Im). The highest bit is sign bit, 7 data bits;
// - calc_in format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im);
// - Input and output are both 2's Complements.
//
//**********************************************************
`include "multi16.v"

module butterfly(

  input  wire[135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire[2:0]   rotation, // Number of each butterfly computation (8 in total)
  output wire[135:0] calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)

  );

  parameter para0000 = 8'b00000000;  //  0.0000. sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
  parameter para3827 = 8'b01100001;  //  0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8) 0.0110000111111000101000001001000000101101111000000001
  parameter parn3827 = 8'b10011111;  // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter para7071 = 8'b01011010;  //  0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8) 0.1011010100000100100000010110111100000000011010001110
  parameter parn7071 = 8'b10100110;  // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter para9239 = 8'b01110110;  //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8) 0.1110110010000100101101011101110011000110001111110001
  parameter parn9239 = 8'b10001010;  // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter para1111 = 8'b01111111;  //  1.0000. sin(4pi/8) = sin(4pi/8) = coa(0pi/8) = - cos(8pi/8)
  
  reg  signed [7:0]  rotation_factor1_real;  // For input B
  reg  signed [7:0]  rotation_factor1_imag;  // For input B
  reg  signed [7:0]  rotation_factor2_real;  // For input C
  reg  signed [7:0]  rotation_factor2_imag;  // For input C
  reg  signed [7:0]  rotation_factor3_real;  // For input D
  reg  signed [7:0]  rotation_factor3_imag;  // For input D

  wire signed [7:0]  in_8bit_1_1, in_8bit_1_2, in_8bit_1_3;  // For multiplier of B
  wire signed [7:0]  in_8bit_2_1, in_8bit_2_2, in_8bit_2_3;  // For multiplier of C
  wire signed [7:0]  in_8bit_3_1, in_8bit_3_2, in_8bit_3_3;  // For multiplier of D

  wire signed [16:0] in_17bit_1_1, in_17bit_1_2, in_17bit_1_3;  // For multiplier of B
  wire signed [16:0] in_17bit_2_1, in_17bit_2_2, in_17bit_2_3;  // For multiplier of C
  wire signed [16:0] in_17bit_3_1, in_17bit_3_2, in_17bit_3_3;  // For multiplier of D

  wire signed [16:0] row1_1_real, row1_1_imag;  // Row means stage of FFT. 16-point 4-radix FFT has 2 stages.
  wire signed [16:0] row1_2_real, row1_2_imag, row1_2_real_b, row1_2_imag_b, comp_part_1;  // The last three lines are used for intermediate data transfer
  wire signed [16:0] row1_3_real, row1_3_imag, row1_3_real_b, row1_3_imag_b, comp_part_2;
  wire signed [16:0] row1_4_real, row1_4_imag, row1_4_real_b, row1_4_imag_b, comp_part_3;

  wire signed [16:0] row2_1_real, row2_1_imag;  // A + CW ^ {2P}
  wire signed [16:0] row2_2_real, row2_2_imag;  // A - CW ^ {2P}
  wire signed [16:0] row2_3_real, row2_3_imag;  // BW ^ P + DW ^ {3P}
  wire signed [16:0] row2_4_real, row2_4_imag;  // BW ^ P - DW ^ {3P}

  wire signed [16:0] row3_1_real, row3_1_imag;  // (A + CW ^ {2P}) +  (BW ^ P + DW ^ {3P})
  wire signed [16:0] row3_2_real, row3_2_imag;  // (A + CW ^ {2P}) -  (BW ^ P + DW ^ {3P})
  wire signed [16:0] row3_3_real, row3_3_imag;  // (A - CW ^ {2P}) + j(BW ^ P - DW ^ {3P})
  wire signed [16:0] row3_4_real, row3_4_imag;  // (A - CW ^ {2P}) - j(BW ^ P - DW ^ {3P})

// This always part controls signal rotation_factor1_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor1_real = para1111;
      3'b001: rotation_factor1_real = para1111;
      3'b010: rotation_factor1_real = para1111;
      3'b011: rotation_factor1_real = para1111;
      3'b100: rotation_factor1_real = para1111;  // cos(0)     = 1        W_16^0
      3'b101: rotation_factor1_real = para9239;  // cos(pi/8)  = 0.9239   W_16^1
      3'b110: rotation_factor1_real = para7071;  // cos(pi/4)  = 0.7071   W_16^2
      3'b111: rotation_factor1_real = para3827;  // cos(3pi/8) = 0.3827   W_16^3
    endcase
  end

// This always part controls signal rotation_factor1_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor1_imag = para0000;
      3'b001: rotation_factor1_imag = para0000;
      3'b010: rotation_factor1_imag = para0000;
      3'b011: rotation_factor1_imag = para0000;
      3'b100: rotation_factor1_imag = para0000;  // sin(0)     = 0        W_16^0
      3'b101: rotation_factor1_imag = para3827;  // sin(pi/8)  = 0.3827   W_16^1
      3'b110: rotation_factor1_imag = para7071;  // sin(pi/4)  = 0.7071   W_16^2
      3'b111: rotation_factor1_imag = para9239;  // sin(3pi/8) = 0.9239   W_16^3
    endcase
  end

// This always part controls signal rotation_factor2_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor2_real = para1111;
      3'b001: rotation_factor2_real = para1111;
      3'b010: rotation_factor2_real = para1111;
      3'b011: rotation_factor2_real = para1111;
      3'b100: rotation_factor2_real = para1111;  // cos(0)     = 1        W_16^0
      3'b101: rotation_factor2_real = para7071;  // cos(pi/4)  = 0.7071   W_16^2
      3'b110: rotation_factor2_real = para0000;  // cos(pi/2)  = 0        W_16^4
      3'b111: rotation_factor2_real = parn7071;  // cos(3pi/4) = -0.7071  W_16^6
    endcase
  end

// This always part controls signal rotation_factor2_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor2_imag = para0000;
      3'b001: rotation_factor2_imag = para0000;
      3'b010: rotation_factor2_imag = para0000;
      3'b011: rotation_factor2_imag = para0000;
      3'b100: rotation_factor2_imag = para0000;  // sin(0)     = 0        W_16^0
      3'b101: rotation_factor2_imag = para7071;  // sin(pi/8)  = 0.7071   W_16^2
      3'b110: rotation_factor2_imag = para1111;  // sin(pi/4)  = 0.1      W_16^4
      3'b111: rotation_factor2_imag = para7071;  // sin(3pi/8) = 0.7071   W_16^6
    endcase
  end

// This always part controls signal rotation_factor3_real.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor3_real = para1111;
      3'b001: rotation_factor3_real = para1111;
      3'b010: rotation_factor3_real = para1111;
      3'b011: rotation_factor3_real = para1111;
      3'b100: rotation_factor3_real = para1111;  // cos(0)     = 1        W_16^0
      3'b101: rotation_factor3_real = para3827;  // cos(3pi/8) = 0.7071   W_16^3
      3'b110: rotation_factor3_real = parn7071;  // cos(6pi/8) = 0        W_16^6
      3'b111: rotation_factor3_real = parn9239;  // cos(93pi/8)= -0.7071  W_16^9
    endcase
  end

// This always part controls signal rotation_factor3_imag.
  always @ ( rotation ) begin
    case ( rotation )
      3'b000: rotation_factor3_imag = para0000;
      3'b001: rotation_factor3_imag = para0000;
      3'b010: rotation_factor3_imag = para0000;
      3'b011: rotation_factor3_imag = para0000;
      3'b100: rotation_factor3_imag = para0000;  // sin(0)     = 0        W_16^0
      3'b101: rotation_factor3_imag = para9239;  // sin(3pi/8) = 0.7071   W_16^3
      3'b110: rotation_factor3_imag = para7071;  // sin(6pi/8) = 0.1      W_16^6
      3'b111: rotation_factor3_imag = parn3827;  // sin(9pi/8) = 0.7071   W_16^9
    endcase
  end

//****************************** The following is the Instantiations *****************************
//************************************** See Line 294 to 311 *************************************

  multi16 multi1_2_1 (.in_17bit(in_17bit_1_1),
                      .in_8bit(in_8bit_1_1),
                      .out(comp_part_1)    // (X - Y) * P
                     );

  multi16 multi1_2_2 (.in_17bit(in_17bit_1_2),
                      .in_8bit(in_8bit_1_2),
                      .out(row1_2_real_b)  // (P - Q) * Y
                      );

  multi16 multi1_2_3 (.in_17bit(in_17bit_1_3),
                      .in_8bit(in_8bit_1_3),
                      .out(row1_2_imag_b)  // (P + Q) * X
                      );

//************************************************************************************************
//************************************** See Line 313 to 329 *************************************

  multi16 multi1_3_1 (.in_17bit(in_17bit_2_1),
                      .in_8bit(in_8bit_2_1),
                      .out(comp_part_2)    // (X - Y) * P
                     );

  multi16 multi1_3_2 (.in_17bit(in_17bit_2_2),
                      .in_8bit(in_8bit_2_2),
                      .out(row1_3_real_b)  // (P - Q) * Y
                      );

  multi16 multi1_3_3 (.in_17bit(in_17bit_1_3),
                      .in_8bit(in_8bit_1_3),
                      .out(row1_3_imag_b)  // (P + Q) * X
                      );

//************************************************************************************************
//************************************** See Line 331 to 347 *************************************

  multi16 multi1_4_1 (.in_17bit(in_17bit_3_1),
                      .in_8bit(in_8bit_3_1),
                      .out(comp_part_3)    // (X - Y) * P
                     );

  multi16 multi1_4_2 (.in_17bit(in_17bit_3_2),
                      .in_8bit(in_8bit_3_2),
                      .out(row1_4_real_b)  // (P - Q) * Y
                      );

  multi16 multi1_4_3 (.in_17bit(in_17bit_3_3),
                      .in_8bit(in_8bit_3_3),
                      .out(row1_4_imag_b)  // (P + Q) * X
                      );

//**************************** The following is the assign statements ****************************
//**************************************** Butterfly Reg 1 ***************************************

  assign row1_1_real = calc_in[33:17];  // A (real)
  assign row1_1_imag = calc_in[16:0];   // A (imag)

//************************************************************************************************

//  comp_part_1 = (calc_in[67:51] - calc_in[50:34]) * rotation_factor1_real[16:8];
//  row1_2_real = (rotation_factor1_real[16:8] - rotation_factor1_real[7:0]) * calc_in[50:34] + comp_part_1;  // BW^P	(real)
//  row1_2_imag = (rotation_factor1_real[16:8] + rotation_factor1_real[7:0]) * calc_in[67:51] - comp_part_1;  // BW^P (imag)


  assign in_8bit_1_1  = rotation_factor1_real;  // rotation factor for B (real)
  assign in_17bit_1_1 = calc_in[67:51] - calc_in[50:34];  // B (real - imag)

  assign in_8bit_1_2  = rotation_factor1_real - rotation_factor1_imag;  // rotation factor (real - imag)
  assign in_17bit_1_2 = calc_in[50:34];  // B (imag)

  assign in_8bit_1_3  = rotation_factor1_real + rotation_factor1_imag;  // rotation factor (real - imag)
  assign in_17bit_1_3 = calc_in[67:51];  // B (real)

  assign row1_2_real  = row1_2_real_b + comp_part_1;  // BW^P	(real)
  assign row1_2_imag  = row1_2_imag_b - comp_part_1;  // BW^P	(imag)

//************************************************************************************************

// comp_part_2 = (calc_in[101:85] - calc_in[84:68]) * rotation_factor2_real[16:8];
// row1_3_real = (rotation_factor2_real[16:8] - rotation_factor2_real[7:0]) * calc_in[84:68]  + comp_part_2;  // CW^{2P} (real)
// row1_3_imag = (rotation_factor2_real[16:8] + rotation_factor2_real[7:0]) * calc_in[101:85] - comp_part_2;  // CW^{2P} (imag)

  assign in_8bit_2_1  = rotation_factor2_real;  // rotation factor for C (real)
  assign in_17bit_2_1 = calc_in[101:85] - calc_in[84:68]; // C (real - imag)

  assign in_8bit_2_2  = rotation_factor2_real - rotation_factor2_imag;  // rotation factor (real - imag)
  assign in_17bit_2_2 = calc_in[84:68];   // C (imag)

  assign in_8bit_2_3  = rotation_factor2_real + rotation_factor2_imag;  // rotation factor (real + imag)
  assign in_17bit_2_3 = calc_in[101:85];  // C (real)

  assign row1_3_real  = row1_3_real_b + comp_part_2;  // CW^{2P} (real)
  assign row1_3_imag  = row1_3_imag_b - comp_part_2;  // CW^{2P} (imag)

//************************************************************************************************

// comp_part_3 = (calc_in[135:119] - calc_in[118:102]) * rotation_factor3_real[16:8];
// row1_4_real = (rotation_factor3_real[16:8] - rotation_factor3_real[7:0]) * calc_in[118:102] + comp_part_3;  // DW^{3P} (real)
// row1_4_imag = (rotation_factor3_real[16:8] + rotation_factor3_real[7:0]) * calc_in[135:119] - comp_part_3;  // DW^{3P} (imag)

  assign in_8bit_3_1  = rotation_factor3_real;  // rotation factor for D (real)
  assign in_17bit_3_1 = calc_in[135:119] - calc_in[118:102];  // D (real - imag)

  assign in_8bit_3_2  = rotation_factor3_real - rotation_factor3_imag;  // rotation factor (real - imag)
  assign in_17bit_3_2 = calc_in[118:102];  // D (imag)

  assign in_8bit_3_3  = rotation_factor3_real + rotation_factor3_imag;  // rotation factor (real + imag)
  assign in_17bit_3_3 = calc_in[135:119];  // D (real)

  assign row1_4_real  = row1_4_real_b + comp_part_3;  // DW^{3P} (real)
  assign row1_4_imag  = row1_4_imag_b - comp_part_3;  // DW^{3P} (imag)

// (X + Yj) * (P + Qj) = a + bj
// a = (P - Q) * Y + (X - Y) * P
// b = (P + Q) * X - (X - Y) * P

//**************************************** Butterfly Reg 2 ***************************************

  assign row2_1_real = row1_1_real + row1_3_real;  // A + CW ^ {2P} (real)
  assign row2_1_imag = row1_1_imag + row1_3_imag;  // A + CW ^ {2P} (imag)

  assign row2_2_real = row1_1_real - row1_3_real;  // A - CW ^ {2P} (real)
  assign row2_2_imag = row1_1_imag - row1_3_imag;  // A - CW ^ {2P} (imag)

  assign row2_3_real = row1_2_real + row1_4_real;  // BW ^ P + DW ^ {3P} (real)
  assign row2_3_imag = row1_2_imag + row1_4_imag;  // BW ^ P + DW ^ {3P} (imag)

  assign row2_4_real = row1_2_real - row1_4_real;  // BW ^ P - DW ^ {3P} (real)
  assign row2_4_imag = row1_2_imag - row1_4_imag;  // BW ^ P - DW ^ {3P} (imag)

//**************************************** Butterfly Reg 3 ***************************************

  assign row3_1_real = row2_1_real + row2_3_real;  // (A + CW ^ {2P}) + (BW ^ P + DW ^ {3P}) (real)
  assign row3_1_imag = row2_1_imag + row2_3_imag;  // (A + CW ^ {2P}) + (BW ^ P + DW ^ {3P}) (imag)

  assign row3_2_real = row2_1_real - row2_3_real;  // (A + CW ^ {2P}) - (BW ^ P + DW ^ {3P}) (real)
  assign row3_2_imag = row2_1_imag - row2_3_imag;  // (A + CW ^ {2P}) - (BW ^ P + DW ^ {3P}) (imag)

  assign row3_3_real = row2_2_real - row2_4_imag;  // (A - CW ^ {2P}) (real) - (BW ^ P + DW ^ {3P}) (imag)
  assign row3_3_imag = row2_2_imag + row2_4_real;  // (A - CW ^ {2P}) (imag) + (BW ^ P + DW ^ {3P}) (real)

  assign row3_4_real = row2_2_real + row2_4_imag;  // (A - CW ^ {2P}) (real) + (BW ^ P - DW ^ {3P}) (imag)
  assign row3_4_imag = row2_2_imag - row2_4_real;  // (A - CW ^ {2P}) (imag) - (BW ^ P - DW ^ {3P}) (real)

//************************************************************************************************
  assign calc_out = { row3_4_real, row3_4_imag,
                      row3_3_real, row3_3_imag,
                      row3_2_real, row3_2_imag,
                      row3_1_real, row3_1_imag };

endmodule
