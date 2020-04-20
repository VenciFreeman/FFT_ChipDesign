module fft_chip(clk,rstn,din,dout);

input clk,rstn;
// input [1:0] mode;
// input start;
input [33:0] din;

output [33:0] dout;
// output [1:0] dout_mode;

wire net_clk,net_rstn;
// wire [1:0] net_mode,net_dout_mode;
// wire net_start;
wire [33:0] net_din,net_dout;

PIW
	PIW_clk(.PAD(clk),.C(net_clk)),
	PIW_rstn(.PAD(rstn),.C(net_rstn)),
	// PIW_start(.PAD(start),.C(net_start)),
	// PIW_mode0(.PAD(mode[0]),.C(net_mode[0])),
	// PIW_mode1(.PAD(mode[1]),.C(net_mode[1])),
	PIW_din0(.PAD(din[0]),.C(net_din[0])),
	PIW_din1(.PAD(din[1]),.C(net_din[1])),
	PIW_din2(.PAD(din[2]),.C(net_din[2])),
	PIW_din3(.PAD(din[3]),.C(net_din[3])),
	PIW_din4(.PAD(din[4]),.C(net_din[4])),
	PIW_din5(.PAD(din[5]),.C(net_din[5])),
	PIW_din6(.PAD(din[6]),.C(net_din[6])),
	PIW_din7(.PAD(din[7]),.C(net_din[7])),
	PIW_din8(.PAD(din[8]),.C(net_din[8])),
	PIW_din9(.PAD(din[9]),.C(net_din[9])),
	PIW_din10(.PAD(din[10]),.C(net_din[10])),
	PIW_din11(.PAD(din[11]),.C(net_din[11])),
	PIW_din12(.PAD(din[12]),.C(net_din[12])),
	PIW_din13(.PAD(din[13]),.C(net_din[13])),
	PIW_din14(.PAD(din[14]),.C(net_din[14])),
	PIW_din15(.PAD(din[15]),.C(net_din[15])),
	PIW_din16(.PAD(din[16]),.C(net_din[16])),
	PIW_din17(.PAD(din[17]),.C(net_din[17])),
	PIW_din18(.PAD(din[18]),.C(net_din[18])),
	PIW_din19(.PAD(din[19]),.C(net_din[19])),
	PIW_din20(.PAD(din[20]),.C(net_din[20])),
	PIW_din21(.PAD(din[21]),.C(net_din[21])),
	PIW_din22(.PAD(din[22]),.C(net_din[22])),
	PIW_din23(.PAD(din[23]),.C(net_din[23])),
	PIW_din24(.PAD(din[24]),.C(net_din[24])),
	PIW_din25(.PAD(din[25]),.C(net_din[25])),
	PIW_din26(.PAD(din[26]),.C(net_din[26])),
	PIW_din27(.PAD(din[27]),.C(net_din[27])),
	PIW_din28(.PAD(din[28]),.C(net_din[28])),
	PIW_din29(.PAD(din[29]),.C(net_din[29])),
	PIW_din30(.PAD(din[30]),.C(net_din[30])),
	PIW_din31(.PAD(din[31]),.C(net_din[31])),
	PIW_din32(.PAD(din[32]),.C(net_din[32])),
	PIW_din33(.PAD(din[33]),.C(net_din[33]));
	
PO8W
	PO8W_dout0(.I(net_dout[0]),.PAD(dout[0])),
	PO8W_dout1(.I(net_dout[1]),.PAD(dout[1])),
	PO8W_dout2(.I(net_dout[2]),.PAD(dout[2])),
	PO8W_dout3(.I(net_dout[3]),.PAD(dout[3])),
	PO8W_dout4(.I(net_dout[4]),.PAD(dout[4])),
	PO8W_dout5(.I(net_dout[5]),.PAD(dout[5])),
	PO8W_dout6(.I(net_dout[6]),.PAD(dout[6])),
	PO8W_dout7(.I(net_dout[7]),.PAD(dout[7])),
	PO8W_dout8(.I(net_dout[8]),.PAD(dout[8])),
	PO8W_dout9(.I(net_dout[9]),.PAD(dout[9])),
	PO8W_dout10(.I(net_dout[10]),.PAD(dout[10])),
	PO8W_dout11(.I(net_dout[11]),.PAD(dout[11])),
	PO8W_dout12(.I(net_dout[12]),.PAD(dout[12])),
	PO8W_dout13(.I(net_dout[13]),.PAD(dout[13])),
	PO8W_dout14(.I(net_dout[14]),.PAD(dout[14])),
	PO8W_dout15(.I(net_dout[15]),.PAD(dout[15])),
	PO8W_dout16(.I(net_dout[16]),.PAD(dout[16])),
	PO8W_dout17(.I(net_dout[17]),.PAD(dout[17])),
	PO8W_dout18(.I(net_dout[18]),.PAD(dout[18])),
	PO8W_dout19(.I(net_dout[19]),.PAD(dout[19])),
	PO8W_dout20(.I(net_dout[20]),.PAD(dout[20])),
	PO8W_dout21(.I(net_dout[21]),.PAD(dout[21])),
	PO8W_dout22(.I(net_dout[22]),.PAD(dout[22])),
	PO8W_dout23(.I(net_dout[23]),.PAD(dout[23])),
	PO8W_dout24(.I(net_dout[24]),.PAD(dout[24])),
	PO8W_dout25(.I(net_dout[25]),.PAD(dout[25])),
	PO8W_dout26(.I(net_dout[26]),.PAD(dout[26])),
	PO8W_dout27(.I(net_dout[27]),.PAD(dout[27])),
	PO8W_dout28(.I(net_dout[28]),.PAD(dout[28])),
	PO8W_dout29(.I(net_dout[29]),.PAD(dout[29])),
	PO8W_dout30(.I(net_dout[30]),.PAD(dout[30])),
	PO8W_dout31(.I(net_dout[31]),.PAD(dout[31])),
	PO8W_dout32(.I(net_dout[32]),.PAD(dout[32])),
	PO8W_dout33(.I(net_dout[33]),.PAD(dout[33]));
	// PO8W_dout_mode0(.I(net_dout_mode[0]),.PAD(dout_mode[0])),
	// PO8W_dout_mode1(.I(net_dout_mode[1]),.PAD(dout_mode[1]));
	
fft inst_fft(.clk(net_clk),.rst_n(net_rstn),.data_in(net_din),.data_out(net_dout));

endmodule
	