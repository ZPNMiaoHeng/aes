module byte0203(a,a02,a03);

output[7:0] a02,a03;
input[7:0] a;

wire [7:0] b,c;

assign b={a[6:0],1'b0};
assign c=b^{8'h1b};
assign a02=(a[7]==0)? b:c;
assign a03=a02^a;

endmodule