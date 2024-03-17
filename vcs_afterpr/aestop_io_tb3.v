`timescale 1ns / 1ps
module aestop_tb3;

wire [7:0] dout;
reg [7:0] din;
reg clk,rst,staenc,stadec,load_shift,loadkey;

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
		    din=8'h72;                         
  		#10 loadkey=1; 
		    din=8'hAE;
		#10 loadkey=1; 
		    din=8'h2C;
		#10 loadkey=1; 
		    din=8'hD6;
  		#10 loadkey=1; 
		    din=8'h3D;
		#10 loadkey=1; 
		    din=8'h6C;
		#10 loadkey=1; 
		    din=8'h4A;
		#10 loadkey=1; 
		    din=8'hE1;
		#10 loadkey=1; 
		    din=8'h67;
		#10 loadkey=1; 
		    din=8'h84;
		#10 loadkey=1; 
		    din=8'h18;
		#10 loadkey=1; 
		    din=8'hBE;
		#10 loadkey=1; 
		    din=8'h48;
		#10 loadkey=1; 
		    din=8'h23;
		#10 loadkey=1; 
		    din=8'h00;
		#10 loadkey=1; 
		    din=8'h29;
		     
		#10 loadkey=0;
		    load_shift=1;//load plain text 
		    din=8'h01;
		#10 load_shift=1;
        din=8'hEB;         
    #10 load_shift=1;
        din=8'h26;
    #10 load_shift=1;
        din=8'hE9;         
    #10 load_shift=1;
        din=8'h41;
    #10 load_shift=1;
        din=8'hBB;
    #10 load_shift=1;
        din=8'h5A;
    #10 load_shift=1;
        din=8'hF1;
    #10 load_shift=1;
        din=8'h6D;
    #10 load_shift=1;
        din=8'hF1;
    #10 load_shift=1;
        din=8'h16;
    #10 load_shift=1;
        din=8'h49;         
    #10 load_shift=1;
        din=8'h5F;
    #10 load_shift=1;
        din=8'h90;     
    #10 load_shift=1;
        din=8'h69;
    #10 load_shift=1;
        din=8'h52;
    
    #10 load_shift=0;
        staenc=1; //start encryption
		#10 staenc=0;
		
		#130 load_shift=1;//shift right to output cipher text 
		#150  load_shift=0;//stop shift right
		
		#50  load_shift=1;//load cipher text 
		     din=8'h2E;         
    #10  load_shift=1;
         din=8'h76;
    #10  load_shift=1;
         din=8'h09;
    #10  load_shift=1;
         din=8'h10;         
    #10  load_shift=1;
         din=8'hD5;
    #10  load_shift=1;
         din=8'h87;
    #10  load_shift=1;
         din=8'h88;
    #10  load_shift=1;
         din=8'h24;
    #10  load_shift=1;
         din=8'h47;
    #10  load_shift=1;
         din=8'h91;         
    #10  load_shift=1;
         din=8'h35;
    #10  load_shift=1;
         din=8'h6D;         
    #10  load_shift=1;
         din=8'hF4;
    #10  load_shift=1;
         din=8'h3E;     
    #10  load_shift=1;
         din=8'h04;
    #10  load_shift=1;
         din=8'h1D;     
  		
  		#10  load_shift=0;
         stadec=1; //start decryption
		#10  stadec=0;
		
		#130 load_shift=1;//shift right to output plain text 
		#150  load_shift=0; //stop shift right
  		    		
		#50 $finish;		
	end
					
endmodule