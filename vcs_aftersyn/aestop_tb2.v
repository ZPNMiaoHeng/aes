`timescale 1ns / 1ps
module aestop_tb2;

wire [7:0] dout;
reg [7:0] din;
reg clk,rst,staenc,stadec,load_shift,loadkey;

//aestop aestop(din , dout , loadkey , load_shift , stadec , staenc , rst , clk );
aestop aestop(clk,rst,staenc,stadec,load_shift,loadkey,din,dout);
//clock generation				   
initial clk = 1;
always #5 clk = ~clk;
	
initial 
	begin		     	
		    rst=1;
		    staenc=0;
		    stadec=0;
		    load_shift=0;
		    loadkey=0;
		#2  rst=0;		//test reset
		#20 rst=1;
		    loadkey=1;//load cipher key 
		    din=8'h0f;                         
  		#10 loadkey=1; 
		    din=8'h0e;
		#10 loadkey=1; 
		    din=8'h0d;
		#10 loadkey=1; 
		    din=8'h0c;
  		#10 loadkey=1; 
		    din=8'h0b;
		#10 loadkey=1; 
		    din=8'h0a;
		#10 loadkey=1; 
		    din=8'h09;
		#10 loadkey=1; 
		    din=8'h08;
		#10 loadkey=1; 
		    din=8'h07;
		#10 loadkey=1; 
		    din=8'h06;
		#10 loadkey=1; 
		    din=8'h05;
		#10 loadkey=1; 
		    din=8'h04;
		#10 loadkey=1; 
		    din=8'h03;
		#10 loadkey=1; 
		    din=8'h02;
		#10 loadkey=1; 
		    din=8'h01;
		#10 loadkey=1; 
		    din=8'h00;
		     
		#10 loadkey=0;
		    load_shift=1;//load plain text 
		    din=8'hff;
		#10 load_shift=1;
        din=8'hee;         
    #10 load_shift=1;
        din=8'hdd;
    #10 load_shift=1;
        din=8'hcc;         
    #10 load_shift=1;
        din=8'hbb;
    #10 load_shift=1;
        din=8'haa;
    #10 load_shift=1;
        din=8'h99;
    #10 load_shift=1;
        din=8'h88;
    #10 load_shift=1;
        din=8'h77;
    #10 load_shift=1;
        din=8'h66;
    #10 load_shift=1;
        din=8'h55;
    #10 load_shift=1;
        din=8'h44;         
    #10 load_shift=1;
        din=8'h33;
    #10 load_shift=1;
        din=8'h22;     
    #10 load_shift=1;
        din=8'h11;
    #10 load_shift=1;
        din=8'h00;
    
    #10 load_shift=0;
        staenc=1; //start encryption
		#10 staenc=0;
		
		#130 load_shift=1;//shift right to output cipher text 
		#150  load_shift=0;//stop shift right
		
		#50  load_shift=1;//load cipher text 
		     din=8'h5a;         
    #10  load_shift=1;
         din=8'hc5;
    #10  load_shift=1;
         din=8'hb4;
    #10  load_shift=1;
         din=8'h70;         
    #10  load_shift=1;
         din=8'h80;
    #10  load_shift=1;
         din=8'hb7;
    #10  load_shift=1;
         din=8'hcd;
    #10  load_shift=1;
         din=8'hd8;
    #10  load_shift=1;
         din=8'h30;
    #10  load_shift=1;
         din=8'h04;         
    #10  load_shift=1;
         din=8'h7b;
    #10  load_shift=1;
         din=8'h6a;         
    #10  load_shift=1;
         din=8'hd8;
    #10  load_shift=1;
         din=8'he0;     
    #10  load_shift=1;
         din=8'hc4;
    #10  load_shift=1;
         din=8'h69;     
  		
  		#10  load_shift=0;
         stadec=1; //start decryption
		#10  stadec=0;
		
		#130 load_shift=1;//shift right to output plain text 
		#150  load_shift=0; //stop shift right
  		    		
		#50 $finish;		
	end
	initial begin
	$fsdbDumpfile("aestop.fsdb");
	$fsdbDumpvars;
end
initial begin
	$sdf_annotate("aestop.mapped.sdf",aestop,,,"MINIMUM","1:1:1","FROM_MTM");
end

					
endmodule
