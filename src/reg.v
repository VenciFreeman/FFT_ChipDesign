//**********************************************************
// Author: Luo Tian, copyright 2020
// e-mail: luotian12345@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: reg
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

module reg1(clk,rst_n,data_in_2,reg_datain_flag,data_out_2,reg_flag_mux);
  
  input clk;
  input rst_n;
  input data_in_2;
  input reg_datain_flag;
  output data_out_2;
  output reg_flag_mux;
  
  wire clk;
  wire rst_n;
  wire [135:0] data_in_2;
  reg [135:0] data_out_2;
  reg reg_flag_mux;
  
  
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
  
  reg [1:0] counter;
  reg [1:0] counter2;
  
  always @(posedge clk or negedge rst_n)begin
    if (!rst_n)begin
      data_out_2 <= 136'b0;
      reg_flag_mux <= 1'b0;
      counter <= 2'b0;
      counter2 <= 2'b0;
      end
    else if (reg_datain_flag)begin
        counter <= counter + 2'b01;
        end
  end

  always @(posedge clk)begin
    if(reg_datain_flag)begin
      case(counter)
        2'b00:begin
              R0 <= data_in_2[33:0];
              R1 <= data_in_2[67:34];
              R2 <= data_in_2[101:68];
              R3 <= data_in_2[135:102];
            end
        2'b01:begin
              R4 <= data_in_2[33:0];
              R5 <= data_in_2[67:34];
              R6 <= data_in_2[101:68];
              R7 <= data_in_2[135:102];
            end
        2'b10:begin
              R8 <= data_in_2[33:0];
              R9 <= data_in_2[67:34];
              R10 <= data_in_2[101:68];
              R11 <= data_in_2[135:102];
            end
        2'b11:begin
              R12 <= data_in_2[33:0];
              R13 <= data_in_2[67:34];
              R14 <= data_in_2[101:68];
              R15 <= data_in_2[135:102];
            end
      endcase
    end
  end
  
  always @
  (posedge clk)begin
    if(counter == 2'b11)begin
      reg_flag_mux <= 1'b1;
      end
    else if(counter2 == 2'b11)begin
      reg_flag_mux <= 1'b0;
      end
    end
  
  always @(posedge clk)begin
    if(reg_flag_mux)begin
      counter2 <= counter2 + 1;
      end
    end
  
  always @(posedge clk)begin
    if(reg_flag_mux)begin
      case(counter2)
        2'b00:begin
              data_out_2 <= {R12,R8,R4,R0};
              end
        2'b01:begin
              data_out_2 <= {R13,R9,R5,R1};
              end
        2'b10:begin
              data_out_2 <= {R14,R10,R6,R2};
              end
        2'b11:begin
              data_out_2 <= {R15,R11,R7,R3};
              end
    endcase
  end
end
endmodule
