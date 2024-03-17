module mux21_128(sel,a,b,c);

output[127:0] c;
input[127:0] a,b;
input sel;

reg [127:0] c;

always@(sel or a or b)
      case(sel)
          1'b0: c=a;
          1'b1: c=b;          
      endcase

endmodule