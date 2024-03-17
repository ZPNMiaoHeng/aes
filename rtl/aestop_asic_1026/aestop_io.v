`timescale 1ns / 1ns
module aestop_io(clk,rst,staenc,stadec,load_shift,loadkey,din,dout);

output [7:0] dout;
input [7:0] din;
input clk,rst,staenc,stadec,load_shift,loadkey;

wire [7:0] dout_io,din_io;
wire clk_io,rst_io,stadec_io,staenc_io,load_shift_io,loadkey_io;

aestop aestop(.clk (clk_io),
		.rst (rst_io),
		.staenc (staenc_io),
		.stadec (stadec_io),
		.load_shift (load_shift_io),
		.loadkey (loadkey_io),
		.din (din_io),
		.dout (dout_io));

PX1W PIW_clk (.XIN (clk), .XC (clk_io));
PIW PIW_rst (.PAD (rst), .C (rst_io));
PIW PIW_staenc (.PAD (staenc), .C (staenc_io));
PIW PIW_stadec (.PAD (stadec), .C (stadec_io));
PIW PIW_load_shift (.PAD (load_shift), .C (load_shift_io));
PIW PIW_loadkey (.PAD (loadkey),.C (loadkey_io));
PIW PIW_din0 (.PAD (din[0]), .C (din_io[0]));
PIW PIW_din1 (.PAD (din[1]), .C (din_io[1]));
PIW PIW_din2 (.PAD (din[2]), .C (din_io[2]));
PIW PIW_din3 (.PAD (din[3]), .C (din_io[3]));
PIW PIW_din4 (.PAD (din[4]), .C (din_io[4]));
PIW PIW_din5 (.PAD (din[5]), .C (din_io[5]));
PIW PIW_din6 (.PAD (din[6]), .C (din_io[6]));
PIW PIW_din7 (.PAD (din[7]), .C (din_io[7]));


PO8W PO8W_dout0 (.PAD (dout[0]), .I (dout_io[0]));
PO8W PO8W_dout1 (.PAD (dout[1]), .I (dout_io[1]));
PO8W PO8W_dout2 (.PAD (dout[2]), .I (dout_io[2]));
PO8W PO8W_dout3 (.PAD (dout[3]), .I (dout_io[3]));
PO8W PO8W_dout4 (.PAD (dout[4]), .I (dout_io[4]));
PO8W PO8W_dout5 (.PAD (dout[5]), .I (dout_io[5]));
PO8W PO8W_dout6 (.PAD (dout[6]), .I (dout_io[6]));
PO8W PO8W_dout7 (.PAD (dout[7]), .I (dout_io[7]));

endmodule

