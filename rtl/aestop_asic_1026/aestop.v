`timescale 1ns / 1ns
module aestop(clk,rst,staenc,stadec,load_shift,loadkey,din,dout);

output [7:0] dout;
input [7:0] din;
input clk,rst,staenc,stadec,load_shift,loadkey;

wire mixsel,reginsel,shiftsel,dataregen,rndkren,sboxinsel,deckeywen;
wire [1:0] keyadsel,keysel;
wire [3:0] rconsel;
wire [127:0] roundkey;

cryptdap cryptdap(clk,rst,keyadsel,mixsel,reginsel,shiftsel,dataregen,din,roundkey,dout);
keyexp keyexp(clk,rst,keysel,rndkren,rconsel,loadkey,din,sboxinsel,deckeywen,roundkey);
control control(clk,rst,staenc,stadec,load_shift,rndkren,sboxinsel,dataregen,
                mixsel,reginsel,shiftsel,deckeywen,keysel,keyadsel,rconsel);

endmodule
