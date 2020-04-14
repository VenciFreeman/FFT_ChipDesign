//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: mux
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

module mux(

  input wire        mux_flag,
  input wire[135:0] data_in_1,
  input wire[135:0] data_in_2,
  output reg[135:0] data_out

  );

  always @ ( mux_flag ) begin
    if ( mux_flag )
      data_out <= data_in_1;
    else
      data_out <= data_in_2;
  end

endmodule