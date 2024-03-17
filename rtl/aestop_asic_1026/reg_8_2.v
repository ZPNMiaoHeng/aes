module reg_8_2(clk,rst,write,din,dout);

output [7:0] dout;
input  clk,rst,write;
input  [7:0] din;

reg [7:0] dout;

always @ (posedge clk or negedge rst)
	begin
		if(!rst)
			dout  <= 8'hf6;
		else 
		  if(write)
					 dout<=din;
		  else 
					 dout<=dout;
	end

endmodule