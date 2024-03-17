module reg_128_rst(clk,rst,write,din,dout);

output [127:0] dout;
input  clk,write,rst;
input  [127:0] din;

reg [127:0] dout;

always @ (posedge clk or negedge rst)
	begin
		  if(!rst)
		       dout<=128'hd014_f9a8_c9ee_2589_e13f_0cc8_b663_0ca6;
		  else if(write)
					 dout<=din;
		  else 
					 dout<=dout;
	end

endmodule