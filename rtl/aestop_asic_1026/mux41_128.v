module mux41_128(sel,a,b,c,d,e);

output[127:0] e;
input[127:0] a,b,c,d;
input [1:0] sel;

reg [127:0] e;

always@(sel or a or b or c or d)
      case(sel)
          2'b00: e=a;
          2'b01: e=b;
          2'b10: e=c;
          2'b11: e=d;
      endcase

endmodule