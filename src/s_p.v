//**********************************************************
// Author: Luo Tian, copyright 2020
// e-mail: luotian12345@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: s_p
//
// Type: Combinational
//
// Purpose: <Specific Function Description>
// 
// Details:
//
// Release History:
// - Version 1.0 20/03/27: Create;
// - Version 1.1 20/02/20: Modify.
//
// Notes:
//
//**********************************************************

module s_p(clk,rst_n,data_in_1,data_out_1,s_p_flag_out,s_p_flag_mux);
  
  input clk;
  input rst_n;
  input data_in_1;
  
  output data_out_1;
  output s_p_flag_out;
  output s_p_flag_mux;
  
  wire clk;
  wire rst_n;
  wire [33:0] data_in_1;
  reg [135:0] data_out_1;
  reg s_p_flag_out;
  reg s_p_flag_mux;
  
  reg [33:0] R0;
  reg [33:0] R1;
  reg [33:0] R2;
  reg [33:0] R3;
  reg [33:0] R4;
  reg [33:0] R5;
  reg [33:0] R6;
  reg [33:0] R7;
  reg [33:0] R8;
  reg [33:0] R9;
  reg [33:0] R10;
  reg [33:0] R11;
  reg [33:0] R12;
  reg [33:0] R13;
  reg [33:0] R14;
  reg [33:0] R15;
  
  reg [3:0] counter;
  reg [3:0] next;
  
  always @(posedge clk)begin
    if (!rst_n)begin
      counter <= 0;
      s_p_flag_out <= 0;
      s_p_flag_mux <= 0;
      next <= 0;
      end
    else begin
      counter <= next;
      case(counter)
        4'b0000:begin
                R0 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 1'b1;
                s_p_flag_mux <= 1'b1;
                data_out_1  = {R15,R11,R7,R3};
                end
        4'b0001:begin
                R1 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b0010:begin
                R2 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b0011:begin
                R3 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b0100:begin
                R4 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b0101:begin
                R5 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b0110:begin
                R6 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b0111:begin
                R7 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b1000:begin
                R8 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b1001:begin
                R9 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b1010:begin
                R10 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b1011:begin
                R11 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b1100:begin
                R12 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 0;
                s_p_flag_mux <= 0;
                end
        4'b1101:begin
                R13 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 1'b1;
                s_p_flag_mux <= 1'b1;
                data_out_1  = {R12,R8,R4,R0};
                end
        4'b1110:begin
                R14 <= data_in_1;
                next <= counter + 1;
                s_p_flag_out <= 1'b1;
                s_p_flag_mux <= 1'b1;
                data_out_1  = {R13,R9,R5,R1};
                end
        4'b1111:begin
                R15 <= data_in_1;
                next <= 0;
                s_p_flag_out <= 1'b1;
                s_p_flag_mux <= 1'b1;
                data_out_1  = {R14,R10,R6,R2};
                end
        endcase
    end
  end
    
   
endmodule
