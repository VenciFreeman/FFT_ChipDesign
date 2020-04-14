//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: demux
//
// Type: Sequential
//
// Purpose: 
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/14: Create.
//
// Notes:
//
//**********************************************************

module demux(

  input wire        demux_flag,
  input wire[135:0] data_in,
  output reg[135:0] data_out_1,
  output reg[135:0] data_out_2

  );

  parameter idle = 136'b0;

  always @ ( demux_flag ) begin
    if ( demux_flag )
      data_out_1 <= data_in;
    else
      data_out_1 <= idle;
  end

  always @ ( demux_flag ) begin
    if ( demux_flag )
        data_out_2 <= idle;
    else
        data_out_2 <= data_in;
  end

endmodule