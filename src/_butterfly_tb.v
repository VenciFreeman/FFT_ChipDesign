//**********************************************************
// Author: @VenciFreeman, copyright 2020
// e-mail: vencifreeman16@sjtu.edu.cn
// School: Shanghai Jiao Tong University
//
// File Name: butterfly_tb
//
// Type: Sequential
//
// Purpose: Test butterfly module.
//
// Details: 
//
// Release History:
// - Version 1.0 20/04/15: Create;
// - Version 2.0 20/04/16: Fix some errors;
// - Version 2.1 20/04/17: Change test vectors;
// - Version 2.2 20/04/17: Edit display style;
// - Version 2.3 20/04/17: Change latency;
// - Version 2.4 20/04/17: Fix input vectors.
//
// Notes:
// - data format: in4(Re,Im), in3(Re,Im), in2(Re,Im), in1(Re,Im).
// - Input and output are both 2's Complements.
//
//**********************************************************
`include "butterfly.v"

module butterfly_tb( );

  reg          clk_test;
  reg          rst_n_test;
  reg  [135:0] calc_in_test;
  reg  [2:0]   rotation_test;
  wire [135:0] calc_out_test;

  reg  [135:0] temp1, temp2, temp3, temp4;

  parameter clk_freq = 10;

  butterfly butterfly0(
    .clk(clk_test),
    .rst_n(rst_n_test),
    .calc_in(calc_in_test),
    .rotation(rotation_test),
    .calc_out(calc_out_test)
  );

  initial begin
    clk_test = 0;
    rst_n_test = 0;
    calc_in_test = 135'b0;
    rotation_test = 3'b0;
  end

  always begin
      #(clk_freq / 2) clk_test = ~ clk_test;	// create a 100MHz clock
      rst_n_test = 1;
  end

  initial begin
    $display("\n\nLoad Data\n");
    #20 begin
      calc_in_test = 136'b000000001000000000000000000000000000000000100000000000000000000000000000000110000000000000000000000000000000001000000000000000000000000;
    //calc_in_test = 136'b0000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000;
      //                  |   x[4]Real    ||    x[4]Imag   ||    x[3]Real   ||    x[3]Imag   ||    x[2]Real   ||    x[2]Imag   ||    x[1]Real   ||   x[1]Imag    |
      rotation_test = 3'b000;
    end

    temp1 = calc_out_test;

    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000010000000000000001000000000000000001000000000000000100000000000000000000000000000000000000000000;
    //calc_in_test = 136'b0000000100000000000000001000000000000000001000000000000010000000000000000001000000000000000100000000000000000110000000000000000000000000;
      //                  |   x[8]Real    ||    x[8]Imag   ||    x[7]Real   ||    x[7]Imag   ||    x[6]Real   ||    x[6]Imag   ||    x[5]Real   ||   x[5]Imag    |
      rotation_test = 3'b001;
    end

    temp2 = calc_out_test;

    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000000000000000000000100000000000000000100000000000001000000000000000000010000000000000000000000000;
    //calc_in_test = 136'b0000000000000000000000000000000000000000001000000000000000000000000000000001000000000000000100000000000000000010000000000000000000000000;
      //                  |   x[12]Real   ||   x[12]Imag   ||    x[11]Real  ||    x[11]Imag  ||    x[10]Real  ||    x[10]Imag  ||    x[9]Real   ||   x[9]Imag    |
      rotation_test = 3'b010;
    end

    temp3 = calc_out_test;

    #10 begin
      calc_in_test = 136'b0000000010000000000000000000000000000000000000000000000000000000000000000001000000000000000010000000000000000000000000000000000000000000;
    //calc_in_test = 136'b0000000010000000000000000000000000000000001000000000000000000000000000000000100000000000000000000000000000000010000000000000000000000000;
    //                    |   x[16]Real   ||    x[16]Imag  ||    x[15]Real  ||    x[15]Imag  ||    x[14]Real  ||    x[14]Imag  ||    x[13]Real  ||   x[13]Imag   |
      rotation_test = 3'b011;
    end

    temp4 = calc_out_test;

    $display("\n\nStage 2\n");

    #10 begin
      calc_in_test = {temp4[33:0], temp3[33:0], temp2[33:0], temp1[33:0]};
      rotation_test = 3'b100;
    end

    $display("[0]  %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    $display("[4]  %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
    $display("[8]  %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
    $display("[12] %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);

    #10 begin
      calc_in_test = {temp4[67:34], temp3[67:34], temp2[67:34], temp1[67:34]};
      rotation_test = 3'b101;
    end
    
    $display("[1]  %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    $display("[5]  %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
    $display("[9]  %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
    $display("[13] %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);

    #10 begin
      calc_in_test = {temp4[101:68], temp3[101:68], temp2[101:68], temp1[101:68]};
      rotation_test = 3'b110;
    end
    
    $display("[2]  %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    $display("[6]  %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
    $display("[10] %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
    $display("[14] %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);

    #10 begin
      calc_in_test = {temp4[135:102], temp3[135:102], temp2[135:102], temp1[135:102]};
      rotation_test = 3'b111;
    end
    
    $display("[3]  %b_%b_%b %b_%b_%b\n", calc_out_test[135], calc_out_test[134:127], calc_out_test[126:119], calc_out_test[118], calc_out_test[117:110], calc_out_test[109:102]);
    $display("[7]  %b_%b_%b %b_%b_%b\n", calc_out_test[101], calc_out_test[100:93],  calc_out_test[92:85],   calc_out_test[84],  calc_out_test[83:76],   calc_out_test[75:68]);
    $display("[11] %b_%b_%b %b_%b_%b\n", calc_out_test[67],  calc_out_test[66:59],   calc_out_test[58:51],   calc_out_test[50],  calc_out_test[49:42],   calc_out_test[41:34]);
    $display("[15] %b_%b_%b %b_%b_%b\n", calc_out_test[33],  calc_out_test[32:25],   calc_out_test[24:17],   calc_out_test[16],  calc_out_test[15:8],    calc_out_test[7:0]);
    #100 $stop;   
  end

endmodule