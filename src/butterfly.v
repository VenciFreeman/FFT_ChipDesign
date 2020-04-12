//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly
//
// Type: Sequential
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
// - Version 2.1 20/04/12: Optimize layout, change to 2's complement and add notes.
//
// Notes:
// - rotation_factor format: (Re,Im);
// - clac_in format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im).
// - Input and output are both 2's Complements.
//
//**********************************************************
`include "multi16.v"

module butterfly(

  input  wire        clk,      // Clock
  input  wire        rst_n,    // Reset
  input  wire[135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire[2:0]   rotation, // Number of each butterfly computation (8 in total)
  output reg[135:0]  calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)

  );

  parameter para0000 = 8'b00000000;  //  0.0000. sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
  parameter para3827 = 8'b01100001;  //  0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter parn3827 = 8'b11100001;  // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter para7071 = 8'b01011010;  //  0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter parn7071 = 8'b11011010;  // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter para9239 = 8'b01110110;  //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter parn9239 = 8'b11110110;  // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter para1111 = 8'b01111111;  //  1.0000. sin(4pi/8) = sin(4pi/8) = coa(0pi/8) = - cos(8pi/8)
  parameter parn1111 = 8'b11111111;  // -1.0000. sin(4pi/8) = sin(4pi/8) = coa(0pi/8) = - cos(8pi/8)
  
  reg  [15:0] rotation_factor1;  // For input B
  reg  [15:0] rotation_factor2;  // For input C
  reg  [15:0] rotation_factor3;  // For input D

  wire [7:0]  in_8bit_1_1, in_8bit_1_2, in_8bit_1_3;  // For multiplier of B
  wire [7:0]  in_8bit_2_1, in_8bit_2_2, in_8bit_2_3;  // For multiplier of C
  wire [7:0]  in_8bit_3_1, in_8bit_3_2, in_8bit_3_3;  // For multiplier of D

  wire [15:0] in_16bit_1_1, in_16bit_1_2, in_16bit_1_3;  // For multiplier of B
  wire [15:0] in_16bit_2_1, in_16bit_2_2, in_16bit_2_3;  // For multiplier of C
  wire [15:0] in_16bit_3_1, in_16bit_3_2, in_16bit_3_3;  // For multiplier of D

  wire [15:0] row1_1_real, row1_1_imag;  // Row means stage of FFT. 16-point 4-radix FFT has 2 stages.
  wire [15:0] row1_2_real, row1_2_imag, row1_2_real_b, row1_2_imag_b, comp_part_1;  // The last three lines are used for intermediate data transfer
  wire [15:0] row1_3_real, row1_3_imag, row1_3_real_b, row1_3_imag_b, comp_part_2;
  wire [15:0] row1_4_real, row1_4_imag, row1_4_real_b, row1_4_imag_b, comp_part_3;

  wire [15:0] row2_1_real, row2_1_imag;  // A + CW ^ {2P}
  wire [15:0] row2_2_real, row2_2_imag;  // A - CW ^ {2P}
  wire [15:0] row2_3_real, row2_3_imag;  // BW ^ P + DW ^ {3P}
  wire [15:0] row2_4_real, row2_4_imag;  // BW ^ P - DW ^ {3P}

  wire [15:0] row3_1_real, row3_1_imag;  // (A + CW ^ {2P}) +  (BW ^ P + DW ^ {3P})
  wire [15:0] row3_2_real, row3_2_imag;  // (A + CW ^ {2P}) -  (BW ^ P + DW ^ {3P})
  wire [15:0] row3_3_real, row3_3_imag;  // (A - CW ^ {2P}) + j(BW ^ P - DW ^ {3P})
  wire [15:0] row3_4_real, row3_4_imag;  // (A - CW ^ {2P}) - j(BW ^ P - DW ^ {3P})

// This always part controls signal rotation_factor1.
  always @ ( posedge clk ) begin
    case ( rotation )
      3'b000: begin
        rotation_factor1[15:8] <= para1111;  // cos(0) = 1
        rotation_factor1[7:0]  <= para0000;  // sin(0) = 0
      end
      3'b001: begin
        rotation_factor1[15:8] <= para0000;  // cos(pi/2) = 0
        rotation_factor1[7:0]  <= para1111;  // sin(pi/2) = 1
      end
      3'b010: begin
        rotation_factor1[15:8] <= parn1111;  // cos(pi) = -1
        rotation_factor1[7:0]  <= para0000;  // sin(pi) = 0
      end
      3'b011: begin
        rotation_factor1[15:8] <= para0000;  // cos(3pi/2) = 0
        rotation_factor1[7:0]  <= parn1111;  // sin(3pi/2) = -1
      end
      3'b100: begin
        rotation_factor1[15:8] <= para1111;  // cos(0) = 1
        rotation_factor1[7:0]  <= para0000;  // sin(0) = 0
      end
      3'b101: begin
        rotation_factor1[15:8] <= para9239;  // cos(pi/8) = 0.9239
        rotation_factor1[7:0]  <= para3827;  // sin(pi/8) = 0.3827
      end
      3'b110: begin
        rotation_factor1[15:8] <= para7071;  // cos(pi/4) = 0.7071
        rotation_factor1[7:0]  <= para7071;  // sin(pi/4) = 0.7071
      end
      3'b111: begin
        rotation_factor1[15:8] <= para3827;  // cos(3pi/8) = 0.3827
        rotation_factor1[7:0]  <= para9239;  // sin(3pi/8) = 0.9239
      end
    endcase
  end

// This always part controls signal rotation_factor2.
  always @ ( posedge clk ) begin
    case ( rotation )
      3'b000: begin
        rotation_factor2[15:8] <= para1111;  // cos(0) = 1
        rotation_factor2[7:0]  <= para0000;  // sin(0) = 0
      end
      3'b001: begin
        rotation_factor2[15:8] <= parn1111;  // cos(pi) = -1
        rotation_factor2[7:0]  <= para0000;  // sin(pi) = 0
      end
      3'b010: begin
        rotation_factor2[15:8] <= para1111;  // cos(2pi) = 1
        rotation_factor2[7:0]  <= para0000;  // sin(2pi) = 0
      end
      3'b011: begin
        rotation_factor2[15:8] <= parn1111;  // cos(3pi) = -1
        rotation_factor2[7:0]  <= para0000;  // sin(3pi) = 0
      end
      3'b100: begin
        rotation_factor2[15:8] <= para1111;  // cos(0) = 1
        rotation_factor2[7:0]  <= para0000;  // sin(0) = 0
      end
      3'b101: begin
        rotation_factor2[15:8] <= para7071;  // cos(pi/4) = 0.7071
        rotation_factor2[7:0]  <= para7071;  // sin(pi/4) = 0.7071
      end
      3'b110: begin
        rotation_factor2[15:8] <= para0000;  // cos(pi/2) = 0
        rotation_factor2[7:0]  <= para1111;  // sin(pi/2) = 1
      end
      3'b111: begin
        rotation_factor2[15:8] <= parn7071;  // cos(3pi/4) = -0.7071
        rotation_factor2[7:0]  <= para7071;  // sin(3pi/4) = 0.7071
      end
    endcase
  end

// This always part controls signal rotation_factor3.
  always @ ( posedge clk ) begin
    case ( rotation )
      3'b000: begin
        rotation_factor3[16:8] <= para1111;  // cos(0) = 1
        rotation_factor3[7:0]  <= para0000;  // sin(0) = 0
      end
      3'b001: begin
        rotation_factor3[16:8] <= para0000;  // cos(3pi/2) = 0
        rotation_factor3[7:0]  <= parn1111;  // sin(3pi/2) = -1
      end
      3'b010: begin
        rotation_factor3[16:8] <= parn1111;  // cos(3pi) = -1
        rotation_factor3[7:0]  <= para0000;  // sin(3pi) = 0
      end
      3'b011: begin
        rotation_factor3[16:8] <= para0000;  // cos(9pi/2) = 0
        rotation_factor3[7:0]  <= para1111;  // sin(9pi/2) = 1
      end
      3'b100: begin
        rotation_factor3[16:8] <= para1111;  // cos(0) = 1
        rotation_factor3[7:0]  <= para0000;  // sin(0) = 0
      end
      3'b101: begin
        rotation_factor3[16:8] <= para3827;  // cos(3pi/4) = 0.3827
        rotation_factor3[7:0]  <= para9239;  // sin(3pi/4) = 0.9239
      end
      3'b110: begin
        rotation_factor3[16:8] <= parn7071;  // cos(3pi/4) = -0.7071
        rotation_factor3[7:0]  <= para7071;  // sin(3pi/4) = 0.7071
      end
      3'b111: begin
        rotation_factor3[16:8] <= parn9239;  // cos(9pi/8) = -0.9239
        rotation_factor3[7:0]  <= parn3827;  // sin(9pi/8) = -0.3827
      end
    endcase
  end

  always @ ( posedge clk or negedge rst_n ) begin
    if ( !rst_n )
      calc_out <= 135'b0;
    else 
      calc_out <= { row3_4_real, row3_4_imag,
                    row3_3_real, row3_3_imag,
                    row3_2_real, row3_2_imag,
                    row3_1_real, row3_1_imag };
  end

// Butterfly reg1
  assign row1_1_real = calc_in[33:17];  // A
  assign row1_1_imag = calc_in[16:0];

//****************************** The following is the Instantiations *****************************

  multi16 multi1_2_1 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_1_1),
                      .in_8bit(in_8bit_1_1),
                      .out(comp_part_1)
                     );

  multi16 multi1_2_2 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_1_2),
                      .in_8bit(in_8bit_1_2),
                      .out(row1_2_real_b)
                      );

  multi16 multi1_2_3 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_1_3),
                      .in_8bit(in_8bit_1_3),
                      .out(row1_2_imag_b)
                      );

  multi16 multi1_3_1 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_2_1),
                      .in_8bit(in_8bit_2_1),
                      .out(comp_part_2)
                     );

  multi16 multi1_3_2 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_2_2),
                      .in_8bit(in_8bit_2_2),
                      .out(row1_3_real_b)
                      );

  multi16 multi1_3_3 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_1_3),
                      .in_8bit(in_8bit_1_3),
                      .out(row1_3_imag_b)
                      );

  multi16 multi1_4_1 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_3_1),
                      .in_8bit(in_8bit_3_1),
                      .out(comp_part_3)
                     );

  multi16 multi1_4_2 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_3_2),
                      .in_8bit(in_8bit_3_2),
                      .out(row1_4_real_b)
                      );

  multi16 multi1_4_3 (.clk(clk),
                      .rst_n(rst_n),
                      .in_16bit(in_16bit_3_3),
                      .in_8bit(in_8bit_3_3),
                      .out(row1_4_imag_b)
                      );

//**************************** The following is the assign statements ****************************
//**************************************** Butterfly Reg 1 ***************************************

  assign in_8bit_1_1  = rotation_factor1[16:8];
  assign in_16bit_1_1 = calc_in[67:51] - calc_in[50:34];

  assign in_8bit_1_2  = rotation_factor1[16:8] - rotation_factor1[7:0];
  assign in_16bit_1_2 = rotation_factor1[50:34];

  assign in_8bit_1_3  = rotation_factor1[16:8] + rotation_factor1[7:0];
  assign in_16bit_1_3 = calc_in[67:51];

  assign row1_2_real  = row1_2_real_b + comp_part_1;
  assign row1_2_imag  = row1_2_imag_b - comp_part_1;

  assign in_8bit_2_1  = rotation_factor2[16:8];
  assign in_16bit_2_1 = calc_in[101:85] - calc_in[84:68];

  assign in_8bit_2_2  = rotation_factor2[16:8] - rotation_factor2[7:0];
  assign in_16bit_2_2 = rotation_factor2[84:68];

  assign in_8bit_2_3  = rotation_factor2[16:8] + rotation_factor2[7:0];
  assign in_16bit_2_3 = calc_in[101:85];

  assign row1_3_real  = row1_3_real_b + comp_part_2;
  assign row1_3_imag  = row1_3_imag_b - comp_part_2;

  assign in_8bit_3_1  = rotation_factor3[16:8];
  assign in_16bit_3_1 = calc_in[135:119] - calc_in[118:102];

  assign in_8bit_3_2  = rotation_factor3[16:8] - rotation_factor3[7:0];
  assign in_16bit_3_2 = rotation_factor3[118:102];

  assign in_8bit_3_3  = rotation_factor3[16:8] + rotation_factor3[7:0];
  assign in_16bit_3_3 = calc_in[135:119];

  assign row1_4_real  = row1_4_real_b + comp_part_3;
  assign row1_4_imag  = row1_4_imag_b - comp_part_3;

//**************************************** Butterfly Reg 2 ***************************************

  assign row2_1_real = row1_1_real + row1_3_real;  // A + CW ^ {2P}
  assign row2_1_imag = row1_1_imag + row1_3_imag;

  assign row2_2_real = row1_1_real - row1_3_real;  // A - CW ^ {2P}
  assign row2_2_imag = row1_1_imag - row1_3_imag;

  assign row2_3_real = row1_2_real + row1_4_real;  // BW ^ P + DW ^ {3P}
  assign row2_3_imag = row1_2_imag + row1_4_imag;

  assign row2_4_real = row1_2_real - row1_4_real;  // BW ^ P - DW ^ {3P}
  assign row2_4_imag = row1_2_imag - row1_4_imag;

//**************************************** Butterfly Reg 3 ***************************************

  assign row3_1_real = row2_1_real + row2_3_real;  // (A + CW ^ {2P}) + (BW ^ P + DW ^ {3P})
  assign row3_1_imag = row2_1_imag + row2_3_imag;

  assign row3_2_real = row2_1_real - row2_3_real;  // (A + CW ^ {2P}) - (BW ^ P + DW ^ {3P})
  assign row3_2_imag = row2_1_imag - row2_3_imag;

  assign row3_3_real = row2_2_real - row2_4_imag;  // (A - CW ^ {2P}) + j(BW ^ P + DW ^ {3P})
  assign row3_3_imag = row2_2_imag + row2_4_real;

  assign row3_4_real = row2_2_real + row2_4_imag;  // (A - CW ^ {2P}) - j(BW ^ P - DW ^ {3P})
  assign row3_4_imag = row2_2_imag - row2_4_real;

endmodule
