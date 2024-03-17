module reg_8_10(clk,rst,write,din,dout);

output [7:0] dout;
input  clk,rst,write;
input  [7:0] din;

reg [7:0] dout;

always @ (posedge clk or negedge rst)
	begin
		if(!rst)
			dout  <= 8'h98;
		else 
		  if(write)
					 dout<=din;
		  else 
					 dout<=dout;
	end

endmodule