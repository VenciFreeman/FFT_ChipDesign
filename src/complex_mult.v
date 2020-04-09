//**********************************************************
// Author: @VenciFreeman,  copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: complex_mult
//
// Type: Sequential
//
// Purpose:
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/209: Create.
//
// Notes:
//
//**********************************************************

module complex_mult(

  input clk,
  input [15:0] in1_r,
  input [15:0] in1_i,
  input [15:0] in2_r,
  input [15:0] in2_i,
  output [15:0] out_r, 
  output [15:0] out_i

  );

  wire [15:0] w1, w2, w3, w4, w1_in, w2_in, w3_in, w4_in;
  wire [14:0] w11, w22, w33, w44;
  wire part1, part2, part3, part4;


  mult mult1( .CLK(clk), 
              .A(in1_r), 
              .B(in2_r), 
              .P({w1[15], part1, w1[14:0], w11})
            );
              
  mult mult2( .CLK(clk), 
              .A(in1_i), 
              .B(in2_i), 
              .P({w2[15], part2, w2[14:0], w22})
            );
          
              
  mult mult3( .CLK(clk), 
              .A(in1_r), 
              .B(in2_i), 
              .P({w3[15], part3, w3[14:0], w33})
            );
              
  mult mult4( .CLK(clk), 
              .A(in1_i), 
              .B(in2_r), 
              .P({w4[15], part4, w4[14:0], w44})
            );                
              
  adder add1( .A(w3), 
              .B(w4), 
              .S({out_i})
            );

  suber sub1( .A(w1), 
              .B(w2), 
              .S({out_r})
            );         
       
endmodule