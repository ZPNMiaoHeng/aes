module keyexp(clk,rst,keysel,rndkren,rconsel,loadkey,key,sboxinsel,deckeywen,rndkrout);

output[127:0] rndkrout;
input clk,rndkren,sboxinsel,loadkey,deckeywen;
input[3:0] rconsel;
input[1:0] keysel;
input[7:0] key;
input rst;

wire [127:0] rndkey,enckey,deckey;
wire [31:0] w1,w2,w3,w4,w5,w6,w7,subword,sboxin;
reg [7:0] rconout;

//write 16 key bits in the register per cycle by shift right
shfreg_128 shfreg_128(clk,rst,loadkey,key,enckey);
//select first encryption round key or first decryption round key or next encryption round key or next decryption round key
mux41_128 mux41_128(keysel,enckey,deckey,{w4,w5,w6,w7},{w4,w1,w2,w3},rndkey); 
reg_128_rst rndkreg(clk,rst,rndkren,rndkey,rndkrout);

assign sboxin=(sboxinsel==0) ? rndkrout[31:0]:w3;
sbox_mux sbox0(sboxin[23:16],subword[31:24]);
sbox_mux sbox1(sboxin[15:8],subword[23:16]);
sbox_mux sbox2(sboxin[7:0],subword[15:8]);
sbox_mux sbox3(sboxin[31:24],subword[7:0]);

always@(rconsel)
      case(rconsel)
          4'd0: rconout=8'h01;
          4'd1: rconout=8'h02;
          4'd2: rconout=8'h04;
          4'd3: rconout=8'h08;
          4'd4: rconout=8'h10;
          4'd5: rconout=8'h20;
          4'd6: rconout=8'h40;
          4'd7: rconout=8'h80;
          4'd8: rconout=8'h1b;
          4'd9: rconout=8'h36;
          default: rconout=8'hxx;
      endcase
      
assign w4[31:24]=subword[31:24]^rconout^rndkrout[127:120];
assign w4[23:0]=subword[23:0]^rndkrout[119:96];
assign w5=w4^rndkrout[95:64];
assign w6=w5^rndkrout[63:32];
assign w7=w6^rndkrout[31:0];

assign w3=rndkrout[63:32]^rndkrout[31:0];
assign w2=rndkrout[95:64]^rndkrout[63:32];
assign w1=rndkrout[127:96]^rndkrout[95:64];
reg_128_rst deckeyreg(clk,rst,deckeywen,{w4,w5,w6,w7},deckey);

endmodule