`timescale 1ns / 1ns
module control(clk,rst,staenc,stadec,load_shift,rndkren,sboxinsel,dataregen,
               mixsel,reginsel,shiftsel,deckeywen,keysel,keyadsel,rconsel);

input clk,rst,staenc,stadec,load_shift;
output rndkren,sboxinsel,dataregen,mixsel,reginsel,shiftsel,deckeywen;
output [1:0] keysel,keyadsel;
output [3:0] rconsel;

parameter IDLE=4'd0;

wire rndkren_e,sboxinsel_e,wrregen_e,mixsel_e,reginsel_e,
     rndkren_d,sboxinsel_d,wrregen_d,mixsel_d,reginsel_d,
     wrregen;
wire [1:0] keysel_e,keysel_d,keyadsel_e,keyadsel_d;
wire [3:0] rconsel_e,rconsel_d,enc_state,dec_state;
     
encryptfsm encryptfsm(clk,rst,staenc,keysel_e,rndkren_e,rconsel_e,sboxinsel_e,wrregen_e,keyadsel_e,mixsel_e,reginsel_e,enc_state,deckeywen);
decryptfsm decryptfsm(clk,rst,stadec,keysel_d,rndkren_d,rconsel_d,sboxinsel_d,wrregen_d,keyadsel_d,mixsel_d,reginsel_d,dec_state);

assign keysel=(enc_state != IDLE) ? keysel_e : keysel_d;
assign rndkren=rndkren_e | rndkren_d;
assign rconsel=(enc_state != IDLE) ? rconsel_e : rconsel_d;
assign sboxinsel=(enc_state != IDLE) ? sboxinsel_e : sboxinsel_d;
assign wrregen=wrregen_e | wrregen_d;
assign dataregen=wrregen | load_shift;
assign keyadsel=(enc_state != IDLE) ? keyadsel_e : keyadsel_d;
assign mixsel=(enc_state != IDLE) ? mixsel_e : mixsel_d;
assign reginsel=(enc_state != IDLE) ? reginsel_e : reginsel_d;
assign shiftsel=((enc_state != IDLE)||(dec_state != IDLE))? 1'b0:1'b1;
			
endmodule