//**********************************************************
// Author: @Qi Yixiang, copyright 2020
// e-mail: qyx123456@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: testbench
//
// Type: Sequential
//
// Purpose: test_bench of top everytime output is last clock cycle inputs' results, has been verified correct
// 
//
// Details:
// - Design Logic;
// - Variable setting.
//
// Release History:
// - Version 1.0 20/03/26: Create.
// - Version 1.1 20/03/28: Create Data_Input txt file & stimuli logic.
// - Version 1.2 20/03/29: Create easy version top to verify & debug.
//
// Notes:
// - <Problems>;
// - <Optimization Method>;
// - <Other Useful Info>.
//**********************************************************

`timescale 1ps/1ps

module testbench();

  reg     clk;
  reg     rst_n;
  reg[33:0] InputData [0:5'd15];
  reg[3:0] i;

  reg[33:0] data_in;
  wire[33:0] data_out;
    
initial begin
  clk = 1'b0;
  forever #50 clk = ~clk;
end
      
initial begin
	rst_n = 1'b0;
  $display("\n\nLoad Data\n");  
  $readmemb("G:/brainchild/verilog/FFT_Design/Data_Input.txt", InputData);
  #250 begin
    rst_n = 1'b1;
    for(i = 0; i < 16; i = i + 1) begin
      #100 data_in = InputData[i];
      $display("in%d:( %d,%d j)", i, data_in[33:17], data_in[16:0]);
      $display("out%d:( %d %d j)", i, data_out[33:17], data_out[16:0]);
    end 
  end
  #100000   $stop;   
end

top top0(
	  .clk(clk), 
		.rst_n(rst_n), 
		.data_in(data_in), 
		.data_out(data_out));

endmodule