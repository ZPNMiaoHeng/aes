module byte9bde(a,a02,a03,a09,a0b,a0d,a0e);

output[7:0] a09,a0b,a0d,a0e;
input[7:0] a,a02,a03;

wire [7:0] a04,a08,b,c;

byte02 byte02_0(a02,a04);
byte02 byte02_1(a04,a08);
assign a09=a08^a;
assign a0b=a08^a03;
assign b=a04^a;
assign c=a04^a02;
assign a0d=a08^b;
assign a0e=a08^c;

endmodule