//**********************************************************
// Author: @Qi Yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: ctrl
//
// Type: Sequential
//
// Purpose: control rotation factors and set flag, has been verified correctly in Modelsim
// 
//
// Details:
// - Design Logic;
// - Variable setting.
//
// Release History:
// - Version 1.0 20/03/26: Create.
// - Version 1.1 20/03/27: Create counter core_tick & mux/demux flag logic according to core_tick.
// - Version 1.2 20/03/28: Create rotation logic according to core_tick & add specific parameters.
//
// Notes:
// - <Problems>;
// - <Optimization Method>;
// - <Other Useful Info>.
//**********************************************************

module ctrl(clk, rst_n, s_p_flag_in, mux_flag, rotation, demux_flag); // s_p_flag_mux,reg1_flag_mux no use

  input clk;
  input rst_n;
  input s_p_flag_in;  // s_p_flag_in=1 when s_p has 13 elements, else=0

  output mux_flag;
  output rotation;
  output demux_flag;

  parameter STOP = 3'b0;
  parameter MUX_IDLE = 3'b0;
  parameter DEMUX_IDLE = 3'b0;
  parameter ROT_IDLE = 3'b0;
  parameter S_P_SEL_0 = 3'b0;
  parameter S_P_SEL_1 = 3'b001;
  parameter S_P_SEL_2 = 3'b010;
  parameter S_P_SEL_3 = 3'b011;
  parameter REG_SEL_0 = 3'b100;
  parameter REG_SEL_1 = 3'b101;
  parameter REG_SEL_2 = 3'b110;
  parameter REG_SEL_3 = 3'b111;
  parameter P_S_SEL_0 = 3'b0;
  parameter P_S_SEL_1 = 3'b001;
  parameter P_S_SEL_2 = 3'b010;
  parameter P_S_SEL_3 = 3'b011;
  parameter W_K0123469_N4 = 3'b000;
  parameter W_K0_N16 = 3'b001;
  parameter W_K123_N16 = 3'b010;
  parameter W_K246_N16 = 3'b011;
  parameter W_K369_N16 = 3'b100;

  wire clk;
  wire rst_n;
  wire s_p_flag_in;

  reg[2:0] mux_flag;
  reg[2:0] rotation;
  reg[2:0] demux_flag;
  reg[2:0] core_tick;  // count how many sequential logic 时序逻辑

always @ (posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    core_tick <= STOP; // 3 bits
  end
  else if (core_tick==STOP) begin
    case (s_p_flag_in)
    1'b0: core_tick <= STOP;
    1'b1: core_tick <= core_tick+1;
    endcase
  end
  else begin
    core_tick <= core_tick+1;
  end
end

always @ (posedge clk or negedge rst_n) begin
  if (!rst_n) begin
    mux_flag <= MUX_IDLE;
    demux_flag <= DEMUX_IDLE;
  end
  // else if (s_p_flag_in) begin    no use to lower power consumption
  //   mux_flag <= S_P_SEL_0;
  //   demux_flag <= REG_SEL_0;
  // end
  else begin
    case (core_tick)
      3'b000: begin mux_flag <= S_P_SEL_0; demux_flag <= REG_SEL_0; end // <Reason> comment here to lower power consumption but no use
      3'b001: begin mux_flag <= S_P_SEL_1; demux_flag <= REG_SEL_1; end // 15
      3'b010: begin mux_flag <= S_P_SEL_2; demux_flag <= REG_SEL_2; end // 16
      3'b011: begin mux_flag <= S_P_SEL_3; demux_flag <= REG_SEL_3; end // 17
      3'b100: begin mux_flag <= REG_SEL_0; demux_flag <= P_S_SEL_0; end // 18
      3'b101: begin mux_flag <= REG_SEL_1; demux_flag <= P_S_SEL_1; end // 19
      3'b110: begin mux_flag <= REG_SEL_2; demux_flag <= P_S_SEL_2; end // 20
      3'b111: begin mux_flag <= REG_SEL_3; demux_flag <= P_S_SEL_3; end // 21
      // default: begin mux_flag <= IDLE; demux_flag <= IDLE; end     if mux/demux have 3 OPTIONS(SP/PS, REG, IDLE), but no use to lower power consumption because still need compute IDLE
    endcase
  end
end

always @ (posedge clk or negedge rst_n) begin // for rotations
  if (!rst_n) begin
    rotation <= ROT_IDLE; 
  end
  // else if (s_p_flag_in) begin    no use to lower power consumption
  //   mux_flag <= S_P_SEL_0;
  //   demux_flag <= REG_SEL_0;
  // end
  else begin
    case (core_tick)
      3'b000: begin rotation <= W_K0123469_N4; end // <Reason> comment here to lower power consumption but no use
      3'b001: begin rotation <= W_K0123469_N4; end // 15
      3'b010: begin rotation <= W_K0123469_N4; end // 16
      3'b011: begin rotation <= W_K0123469_N4; end // 17
      3'b100: begin rotation <= W_K0_N16; end // 18
      3'b101: begin rotation <= W_K123_N16; end // 19
      3'b110: begin rotation <= W_K246_N16; end // 20
      3'b111: begin rotation <= W_K369_N16; end // 21
      // default: begin mux_flag <= IDLE; demux_flag <= IDLE; end     if mux/demux have 3 OPTIONS(SP/PS, REG, IDLE), but no use to lower power consumption because still need compute IDLE
    endcase
  end
end
    
endmodule