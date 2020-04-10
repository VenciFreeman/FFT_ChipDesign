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
// - Version 1.4 20/04/09: Rewrite multiply commands. Still many things need to rewrite.
//
// Notes:
// - rotation_factor format: (Re,Im);
// - clac_in format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im).
//
//**********************************************************

module butterfly(

  input  wire[135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire[2:0]   rotation, // number of each butterfly computation (8 in total)
  output reg[135:0]  calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)

  );

  parameter sin_1pi_8 = 8'b;  // 0.3827. sin(pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter sin_2pi_8 = 8'b;  // 0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter sin_3pi_8 = 8'b;  // 0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)


  wire signed [16:0] row1_1_real, row1_1_imag;  // row means stage of FFT. 16-point 4-radix FFT has 2 stages.
  wire signed [16:0] row1_2_real, row1_2_imag, row1_2_real_b, row1_2_imag_b, comp_part_1;
  wire signed [16:0] row1_3_real, row1_3_imag, row1_3_real_b, row1_3_imag_b, comp_part_2;
  wire signed [16:0] row1_4_real, row1_4_imag, row1_4_real_b, row1_4_imag_b, comp_part_3;

  wire signed [16:0] row2_1_real, row2_1_imag;
  wire signed [16:0] row2_2_real, row2_2_imag;
  wire signed [16:0] row2_3_real, row2_3_imag;
  wire signed [16:0] row2_4_real, row2_4_imag;

  wire signed [16:0] row3_1_real, row3_1_imag;
  wire signed [16:0] row3_2_real, row3_2_imag;
  wire signed [16:0] row3_3_real, row3_3_imag;
  wire signed [16:0] row3_4_real, row3_4_imag;

  reg rotation_factor1[16:0];
  reg rotation_factor2[16:0];
  reg rotation_factor3[16:0];

// This always part controls signal rotation_factor1.
  always @ ( rotation ) begin
    case ( rotation ) begin
      3'b000: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b001: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b010: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b011: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b100: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b101: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b110: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
      3'b111: begin
        rotation_factor1[16:8] = ;
        rotation_factor1[7:0]  = ;
      end
    end
  end 

// This always part controls signal rotation_factor2.
  always @ ( rotation ) begin
    case ( rotation ) begin
      3'b000: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b001: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b010: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b011: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b100: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b101: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b110: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
      3'b111: begin
        rotation_factor2[16:8] = ;
        rotation_factor2[7:0]  = ;
      end
    end
  end 

// This always part controls signal rotation_factor3.
  always @ ( rotation ) begin
    case ( rotation ) begin
      3'b000: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b001: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b010: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b011: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b100: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b101: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b110: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0]  = ;
      end
      3'b007: begin
        rotation_factor3[16:8] = ;
        rotation_factor3[7:0] = ;
      end
    end
  end 

// Butterfly reg1
  assign row1_1_real = calc_in[33:17];  // A
  assign row1_1_imag = calc_in[16:0];

//  assign comp_part_1 = (calc_in[67:51] - calc_in[50:34]) * rotation_factor1[16:8];  // Need the specific figures to rewrite as shift operation.
//  assign row1_2_real = (rotation_factor1[16:8] - rotation_factor1[7:0]) * calc_in[50:34] + comp_part_1;  // BW^P
//  assign row1_2_imag = (rotation_factor1[16:8] + rotation_factor1[7:0]) * calc_in[67:51] - comp_part_1;
  multi16 multi1_2_1 (.a_in((calc_in[67:51] - calc_in[50:34])),  // need to rewrite as signed wire
                      .b_in({8'b0, rotation_factor1[16:8]}),
                      .result(comp_part_1)
                     );

  multi16 multi1_2_2 (.a_in((rotation_factor1[16:8] - rotation_factor1[7:0])),
                      .b_in(calc_in[50:34]),
                      .result(row1_2_real_b)
                     );

  multi16 multi1_2_3 (.a_in((rotation_factor1[16:8] + rotation_factor1[7:0])),
                      .b_in(calc_in[67:51]),
                      .result(row1_2_imag_b)
                     );

  assign row1_2_real = row1_2_real_b + comp_part_1;
  assign row1_2_imag = row1_2_imag_b - comp_part_1;

//  assign comp_part_2 = (calc_in[101:85] - calc_in[84:68]) * rotation_factor2[16:8];  // Need the specific figures to rewrite as shift operation.
//  assign row1_3_real = (rotation_factor2[16:8] - rotation_factor2[7:0]) * calc_in[84:68] + comp_part_2;  // CW^{2P}
//  assign row1_3_imag = (rotation_factor2[16:8] + rotation_factor2[7:0]) * calc_in[101:85] - comp_part_2;
  multi16 multi1_3_1 (.a_in((calc_in[101:85] - calc_in[84:68])),  // need to rewrite as signed wire
                      .b_in({8'b0, rotation_factor2[16:8]}),
                      .result(comp_part_2)
                     );

  multi16 multi1_3_2 (.a_in((rotation_factor2[16:8] - rotation_factor2[7:0])),
                      .b_in(calc_in[84:68]),
                      .result(row1_3_real_b)
                     );

  multi16 multi1_3_3 (.a_in((rotation_factor2[16:8] + rotation_factor2[7:0])),
                      .b_in(calc_in[101:85]),
                      .result(row1_3_imag_b)
                     );

  assign row1_3_real = row1_3_real_b + comp_part_2;
  assign row1_3_imag = row1_3_imag_b - comp_part_2;

//  assign comp_part_3 = (calc_in[135:119] - calc_in[118:102]) * rotation_factor3[16:8];  // Need the specific figures to rewrite as shift operation.
//  assign row1_4_real = (rotation_factor3[16:8] - rotation_factor3[7:0]) * calc_in[118:102] + comp_part_3;  // DW^{3P}
//  assign row1_4_imag = (rotation_factor3[16:8] + rotation_factor3[7:0]) * calc_in[135:119] - comp_part_3;
  multi16 multi1_3_1 (.a_in((calc_in[135:119] - calc_in[118:102])),  // need to rewrite as signed wire
                      .b_in({8'b0, rotation_factor3[16:8]}),
                      .result(comp_part_3)
                     );

  multi16 multi1_3_2 (.a_in((rotation_factor3[16:8] - rotation_factor3[7:0])),
                      .b_in(calc_in[118:102]),
                      .result(row1_4_real_b)
                     );

  multi16 multi1_3_3 (.a_in((rotation_factor3[16:8] + rotation_factor3[7:0])),
                      .b_in(calc_in[135:119]),
                      .result(row1_4_imag_b)
                     );

  assign row1_4_real = row1_4_real_b + comp_part_3;
  assign row1_4_imag = row1_4_imag_b - comp_part_3;

// Butterfly reg2
  assign row2_1_real = row1_1_real + row1_3_real;  // A + CW^{2P}
  assign row2_1_imag = row1_1_imag + row1_3_imag;

  assign row2_2_real = row1_1_real - row1_3_real;  // A - CW^{2P}
  assign row2_2_imag = row1_1_imag - row1_3_imag;

  assign row2_3_real = row1_2_real + row1_4_real;  // BW^P + DW^{3P}
  assign row2_3_imag = row1_2_imag + row1_4_imag;

  assign row2_4_real = row1_2_real - row1_4_real;  // BW^P - DW^{3P}
  assign row2_4_imag = row1_2_imag - row1_4_imag;

// Butterfly Reg3
  assign row3_1_real = row2_1_real + row2_3_real;  // (A + CW^{2P}) + (BW^P + DW^{3P})
  assign row3_1_imag = row2_1_imag + row2_3_imag;

  assign row3_2_real = row2_1_real - row2_3_real;  // (A + CW^{2P}) - (BW^P + DW^{3P})
  assign row3_2_imag = row2_1_imag - row2_3_imag;

  assign row3_3_real = row2_2_real + row2_4_real;  // (A - CW^{2P}) + j(BW^P + DW^{3P})
  assign row3_3_imag = row2_2_imag + row2_4_imag;

  assign row3_4_real = row2_2_real - row2_4_real;  // (A - CW^{2P}) - j(BW^P - DW^{3P})
  assign row3_4_imag = row2_2_imag - row2_4_imag;

  assign calc_out = { row3_4_real, row3_4_imag,
                      row3_3_real, row3_3_imag,
                      row3_2_real, row3_2_imag,
                      row3_1_real, row3_1_imag };

endmodule
