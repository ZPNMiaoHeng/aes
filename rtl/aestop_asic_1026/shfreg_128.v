module shfreg_128(clk,rst,write,din,dout);

output [127:0] dout;
input  clk,rst,write;
input  [7:0] din;

reg [127:0] dout;

always @ (posedge clk or negedge rst)
	begin
	    if(!rst)
		      dout <= 128'h2b7e151628aed2a6abf7158809cf4f3c;
	    else if(write)
					dout<={din,dout[127:8]};
		  else 
					dout<=dout;
	end

endmodule