`timescale 1ns / 1ns
module aestop_tb;

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
		    din=8'h3c;                         
  		#10 loadkey=1; 
		    din=8'h4f;
		#10 loadkey=1; 
		    din=8'hcf;
		#10 loadkey=1; 
		    din=8'h09;
  		#10 loadkey=1; 
		    din=8'h88;
		#10 loadkey=1; 
		    din=8'h15;
		#10 loadkey=1; 
		    din=8'hf7;
		#10 loadkey=1; 
		    din=8'hab;
		#10 loadkey=1; 
		    din=8'ha6;
		#10 loadkey=1; 
		    din=8'hd2;
		#10 loadkey=1; 
		    din=8'hae;
		#10 loadkey=1; 
		    din=8'h28;
		#10 loadkey=1; 
		    din=8'h16;
		#10 loadkey=1; 
		    din=8'h15;
		#10 loadkey=1; 
		    din=8'h7e;
		#10 loadkey=1; 
		    din=8'h2b;
		     
		#10 loadkey=0;
		    load_shift=1;//load plain text 
		    din=8'h34;
		#10 load_shift=1;
        din=8'h07;         
    #10 load_shift=1;
        din=8'h37;
    #10 load_shift=1;
        din=8'he0;         
    #10 load_shift=1;
        din=8'ha2;
    #10 load_shift=1;
        din=8'h98;
    #10 load_shift=1;
        din=8'h31;
    #10 load_shift=1;
        din=8'h31;
    #10 load_shift=1;
        din=8'h8d;
    #10 load_shift=1;
        din=8'h30;
    #10 load_shift=1;
        din=8'h5a;
    #10 load_shift=1;
        din=8'h88;         
    #10 load_shift=1;
        din=8'ha8;
    #10 load_shift=1;
        din=8'hf6;     
    #10 load_shift=1;
        din=8'h43;
    #10 load_shift=1;
        din=8'h32;
    
    #10 load_shift=0;
        staenc=1; //start encryption
		#10 staenc=0;
		
		#130 load_shift=1;//shift right to output cipher text 
		#150  load_shift=0;//stop shift right
		
		#50  load_shift=1;//load cipher text 
		     din=8'h32;         
    #10  load_shift=1;
         din=8'h0b;
    #10  load_shift=1;
         din=8'h6a;
    #10  load_shift=1;
         din=8'h19;         
    #10  load_shift=1;
         din=8'h97;
    #10  load_shift=1;
         din=8'h85;
    #10  load_shift=1;
         din=8'h11;
    #10  load_shift=1;
         din=8'hdc;
    #10  load_shift=1;
         din=8'hfb;
    #10  load_shift=1;
         din=8'h09;         
    #10  load_shift=1;
         din=8'hdc;
    #10  load_shift=1;
         din=8'h02;         
    #10  load_shift=1;
         din=8'h1d;
    #10  load_shift=1;
         din=8'h84;     
    #10  load_shift=1;
         din=8'h25;
    #10  load_shift=1;
         din=8'h39;     
  		
  		#10  load_shift=0;
         stadec=1; //start decryption
		#10  stadec=0;
		
		#130 load_shift=1;//shift right to output plain text 
		#150  load_shift=0; //stop shift right
  		    		
		#50 $finish;		
	end
					
endmodule