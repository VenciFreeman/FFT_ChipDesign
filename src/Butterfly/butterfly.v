//**********************************************************
// Author: @Qi yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
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
// - Version 2.1 20/04/12: Optimize layout, change to 2's complement and add notes;
// - Version 2.2 20/04/14: Update rotation factors;
// - Version 2.3 20/04/16: Fix some simulation errors;
// - Version 2.4 20/04/16: Fix some errors about bits;
// - Version 2.5 20/04/16: Simulate successful. Still need to check results;
// - Version 2.6 20/04/17: Check again, fix some errors. Simulate successful;
// - Version 2.7 20/04/17: Add signed;
// - Version 2.8 20/04/18: Check again, add comments.
//
// Notes:
// - rotation_factor format: (Re,Im). The highest bit is sign bit, 7 data bits;
// - calc_in format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im);
// - Input and output are both 2's Complements.
//
//**********************************************************

module butterfly(
  input  wire[135:0] calc_in,  // The 4 numbers which need to be calculated. Format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im)
  input  wire[2:0]   rotation, // Number of each butterfly computation (8 in total)
  output wire [135:0] calc_out  // The 4 output numbers. Format: out4(Re,Im), out3(Re,Im), out2(Re,Im), out1(Re,Im)
  );

  parameter para0000 = 8'b00000000;  //  0.0000. sin(0pi/8) = sin(8pi/8) = cos(4pi/8) = - cos(4pi/8)
  parameter para3827 = 8'b00110001;  //  0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8) 0.0110000111111000101000001001000000101101111000000001
  parameter parn3827 = 8'b11001111;  // -0.3827. sin(1pi/8) = sin(7pi/8) = cos(3pi/8) = - cos(5pi/8)
  parameter para7071 = 8'b01011010;  //  0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8) 0.1011010100000100100000010110111100000000011010001110
  parameter parn7071 = 8'b10100110;  // -0.7071. sin(2pi/8) = sin(6pi/8) = cos(2pi/8) = - cos(6pi/8)
  parameter para9239 = 8'b01110110;  //  0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8) 0.1110110010000100101101011101110011000110001111110001
  parameter parn9239 = 8'b10001010;  // -0.9239. sin(3pi/8) = sin(5pi/8) = cos(1pi/8) = - cos(7pi/8)
  parameter para1111 = 8'b01111111;  //  1.0000. sin(4pi/8) = sin(4pi/8) = coa(0pi/8) = - cos(8pi/8)
  
  reg  [15:0] rotation_factor1;  // For input B
  reg  [15:0] rotation_factor2;  // For input C
  reg  [15:0] rotation_factor3;  // For input D

  // wire signed [16:0] row3_1_real, row3_1_imag;  // (A + CW ^ {2P}) +  (BW ^ P + DW ^ {3P})
  // wire signed [16:0] row3_2_real, row3_2_imag;  // (A + CW ^ {2P}) -  (BW ^ P + DW ^ {3P})
  // wire signed [16:0] row3_3_real, row3_3_imag;  // (A - CW ^ {2P}) + j(BW ^ P - DW ^ {3P}) 
  // wire signed [16:0] row3_4_real, row3_4_imag;  // (A - CW ^ {2P}) - j(BW ^ P - DW ^ {3P})
  wire [33:0] tmp0,tmp1,tmp2,tmp3; //35
  wire [16:0] tmp0_r,tmp0_i,tmp1_r,tmp1_i,tmp2_r,tmp2_i,tmp3_r,tmp3_i; //17
  wire [16:0] in_17bit_0_real,in_17bit_0_imag,in_17bit_1_real,in_17bit_1_imag,in_17bit_2_real,in_17bit_2_imag,in_17bit_3_real,in_17bit_3_imag;
  wire [7:0] in_8bit_1_real,in_8bit_1_imag,in_8bit_2_real,in_8bit_2_imag,in_8bit_3_real,in_8bit_3_imag;
  wire [16:0] out0_r,out0_i,out1_r,out1_i,out2_r,out2_i,out3_r,out3_i; //suppose 19-  20bits directly cut off to 17bits
  wire [33:0] out0,out1,out2,out3;
  wire [16:0] tmp1_r1,tmp1_r2,tmp1_i1,tmp1_i2,tmp2_r1,tmp2_r2,tmp2_i1,tmp2_i2,tmp3_r1,tmp3_r2,tmp3_i1,tmp3_i2;


// This always part controls signal rotation_factor1.
  always @ ( calc_in or rotation ) begin
    case ( rotation )
      3'b000: begin
        rotation_factor1[15:8] = para1111;
        rotation_factor1[7:0]  = para0000;
      end
      3'b001: begin
        rotation_factor1[15:8] = para1111;
        rotation_factor1[7:0]  = para0000;
      end
      3'b010: begin
        rotation_factor1[15:8] = para1111;
        rotation_factor1[7:0]  = para0000;
      end
      3'b011: begin
        rotation_factor1[15:8] = para1111;
        rotation_factor1[7:0]  = para0000;
      end
      3'b100: begin
        rotation_factor1[15:8] = para1111;  // cos(0) = 1            W_16^0
        rotation_factor1[7:0]  = para0000;  // sin(0) = 0
      end
      3'b101: begin
        rotation_factor1[15:8] = para9239;  // cos(pi/8) = 0.9239    W_16^1
        rotation_factor1[7:0]  = para3827;  // sin(pi/8) = 0.3827
      end
      3'b110: begin
        rotation_factor1[15:8] = para7071;  // cos(pi/4) = 0.7071    W_16^2
        rotation_factor1[7:0]  = para7071;  // sin(pi/4) = 0.7071
      end
      3'b111: begin
        rotation_factor1[15:8] = para3827;  // cos(3pi/8) = 0.3827   W_16^3
        rotation_factor1[7:0]  = para9239;  // sin(3pi/8) = 0.9239
      end
    endcase
  end

// This always part controls signal rotation_factor2.
  always @ ( calc_in or rotation ) begin
    case ( rotation )
      3'b000: begin
        rotation_factor2[15:8] = para1111;
        rotation_factor2[7:0]  = para0000;
      end
      3'b001: begin
        rotation_factor2[15:8] = para1111;
        rotation_factor2[7:0]  = para0000;
      end
      3'b010: begin
        rotation_factor2[15:8] = para1111;
        rotation_factor2[7:0]  = para0000;
      end
      3'b011: begin
        rotation_factor2[15:8] = para1111;
        rotation_factor2[7:0]  = para0000;
      end
      3'b100: begin
        rotation_factor2[15:8] = para1111;  // cos(0) = 1            W_16^0
        rotation_factor2[7:0]  = para0000;  // sin(0) = 0
      end
      3'b101: begin
        rotation_factor2[15:8] = para7071;  // cos(pi/4) = 0.7071    W_16^2
        rotation_factor2[7:0]  = para7071;  // sin(pi/4) = 0.7071
      end
      3'b110: begin
        rotation_factor2[15:8] = para0000;  // cos(pi/2) = 0         W_16^4
        rotation_factor2[7:0]  = para1111;  // sin(pi/2) = 1
      end
      3'b111: begin
        rotation_factor2[15:8] = parn7071;  // cos(3pi/4) = -0.7071  W_16^6
        rotation_factor2[7:0]  = para7071;  // sin(3pi/4) = 0.7071
      end
    endcase
  end

// This always part controls signal rotation_factor3.
  always @ ( calc_in or rotation ) begin
    case ( rotation )
      3'b000: begin
        rotation_factor3[15:8] = para1111;
        rotation_factor3[7:0]  = para0000;
      end
      3'b001: begin
        rotation_factor3[15:8] = para1111;
        rotation_factor3[7:0]  = para0000;
      end
      3'b010: begin
        rotation_factor3[15:8] = para1111;
        rotation_factor3[7:0]  = para0000;
      end
      3'b011: begin
        rotation_factor3[15:8] = para1111;
        rotation_factor3[7:0]  = para0000;
      end
      3'b100: begin
        rotation_factor3[15:8] = para1111;  // cos(0) = 1            W_15^0
        rotation_factor3[7:0]  = para0000;  // sin(0) = 0
      end
      3'b101: begin
        rotation_factor3[15:8] = para3827;  // cos(3pi/4) = 0.3827   W_15^3
        rotation_factor3[7:0]  = para9239;  // sin(3pi/4) = 0.9239
      end
      3'b110: begin
        rotation_factor3[15:8] = parn7071;  // cos(3pi/4) = -0.7071  W_15^6
        rotation_factor3[7:0]  = para7071;  // sin(3pi/4) = 0.7071
      end
      3'b111: begin
        rotation_factor3[15:8] = parn9239;  // cos(9pi/8) = -0.9239  W_15^9
        rotation_factor3[7:0]  = parn3827;  // sin(9pi/8) = -0.3827
      end
    endcase
  end

  assign in_17bit_0_real = calc_in[33:17];  // A (real)
  assign in_17bit_0_imag = calc_in[16:0];   // A (imag)

  assign in_8bit_1_real  = rotation_factor1[15:8];  // rotation factor for B (real)
  assign in_8bit_1_imag  = rotation_factor1[7:0];
  assign in_17bit_1_real = calc_in[67:51];  // B 
  assign in_17bit_1_imag = calc_in[50:34];

  assign in_8bit_2_real  = rotation_factor2[15:8];  // rotation factor for C (real)
  assign in_8bit_2_imag  = rotation_factor2[7:0];
  assign in_17bit_2_real = calc_in[101:85]; // C 
  assign in_17bit_2_imag = calc_in[84:68];

  assign in_8bit_3_real  = rotation_factor3[15:8];  // rotation factor for D (real)
  assign in_8bit_3_imag  = rotation_factor3[7:0];
  assign in_17bit_3_real = calc_in[135:119];  // D 
  assign in_17bit_3_imag = calc_in[118:102];

  assign tmp0_r={in_17bit_0_real[16],in_17bit_0_real};
  assign tmp0_i={in_17bit_0_imag[16],in_17bit_0_imag};
  assign tmp0={tmp0_r,tmp0_i}; //A 36 bits
  multi16 multiBRR (
                      .in_17bit(in_17bit_1_real),
                      .in_8bit(in_8bit_1_real),
                      .out(tmp1_r1)    // (X - Y) * P
                     );
  multi16 multiBII (
                      .in_17bit(in_17bit_1_imag),
                      .in_8bit(in_8bit_1_imag),
                      .out(tmp1_r2)    // (X - Y) * P
                     );
  multi16 multiBRI (
                      .in_17bit(in_17bit_1_real),
                      .in_8bit(in_8bit_1_imag),
                      .out(tmp1_i1)    // (X - Y) * P
                     );
  multi16 multiBIR (
                      .in_17bit(in_17bit_1_imag),
                      .in_8bit(in_8bit_1_real),
                      .out(tmp1_i2)    // (X - Y) * P
                     );
  assign tmp1_r=tmp1_r1-tmp1_r2;
  assign tmp1_i=tmp1_i1+tmp1_i2; //B*Wp image 18 bits
  assign tmp1={tmp1_r,tmp1_i}; //B*Wp 36 bits
  
  multi16 multiCRR (
                      .in_17bit(in_17bit_2_real),
                      .in_8bit(in_8bit_2_real),
                      .out(tmp2_r1)    // (X - Y) * P
                     );
  multi16 multiCII (
                      .in_17bit(in_17bit_2_imag),
                      .in_8bit(in_8bit_2_imag),
                      .out(tmp2_r2)    // (X - Y) * P
                     );
  multi16 multiCRI (
                      .in_17bit(in_17bit_2_real),
                      .in_8bit(in_8bit_2_imag),
                      .out(tmp2_i1)    // (X - Y) * P
                     );
  multi16 multiCIR (
                      .in_17bit(in_17bit_2_imag),
                      .in_8bit(in_8bit_2_real),
                      .out(tmp2_i2)    // (X - Y) * P
                     );
  assign tmp2_r=tmp2_r1-tmp2_r2;
  assign tmp2_i=tmp2_i1+tmp2_i2; //C*W2p image 18 bits
  assign tmp2={tmp2_r,tmp2_i}; //C*W2p 36 bits

  multi16 multiDRR (
                      .in_17bit(in_17bit_3_real),
                      .in_8bit(in_8bit_3_real),
                      .out(tmp3_r1)    // (X - Y) * P
                     );
  multi16 multiDII (
                      .in_17bit(in_17bit_3_imag),
                      .in_8bit(in_8bit_3_imag),
                      .out(tmp3_r2)    // (X - Y) * P
                     );
  multi16 multiDRI (
                      .in_17bit(in_17bit_3_real),
                      .in_8bit(in_8bit_3_imag),
                      .out(tmp3_i1)    // (X - Y) * P
                     );
  multi16 multiDIR (
                      .in_17bit(in_17bit_3_imag),
                      .in_8bit(in_8bit_3_real),
                      .out(tmp3_i2)    // (X - Y) * P
                     );
  assign tmp3_r=tmp3_r1-tmp3_r2;
  assign tmp3_i=tmp3_i1+tmp3_i2; //D*W3p image 18 bits
  assign tmp3={tmp3_r,tmp3_i}; //D*W3p 36 bits

  // (A + CW ^ {2P}) +  (BW ^ P + DW ^ {3P})
  // (A + CW ^ {2P}) -  (BW ^ P + DW ^ {3P})
  // (A - CW ^ {2P}) + j(BW ^ P - DW ^ {3P}) 
  // (A - CW ^ {2P}) - j(BW ^ P - DW ^ {3P})
  // (A + CW ^ {2P}) ; (BW ^ P + DW ^ {3P}) ; (A - CW ^ {2P}); (BW ^ P - DW ^ {3P})

  assign out0_r=tmp0_r+tmp1_r+tmp2_r+tmp3_r;
  assign out0_i=tmp0_i+tmp1_i+tmp2_i+tmp3_i;
  assign out2_r=tmp0_r-tmp1_r+tmp2_r-tmp3_r;
  assign out2_i=tmp0_i-tmp1_i+tmp2_i-tmp3_i;

  assign out3_r=tmp0_r-tmp1_i-tmp2_r+tmp3_i;
  assign out3_i=tmp0_i+tmp1_r-tmp2_i-tmp3_r;
  assign out1_r=tmp0_r+tmp1_i-tmp2_r-tmp3_i;
  assign out1_i=tmp0_i-tmp1_r-tmp2_i+tmp3_r;

  // assign out0_r_quant=out0_r
  assign out0={out0_r,out0_i};
  assign out1={out1_r,out1_i};
  assign out2={out2_r,out2_i};
  assign out3={out3_r,out3_i};
  assign calc_out={out3,out2,out1,out0};


//****************************** The following is the Instantiations *****************************


//**************************** The following is the assign statements ****************************
//**************************************** Butterfly ***************************************

endmodule
