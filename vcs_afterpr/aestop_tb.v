`timescale 1ns / 1ps
module aestop_tb;

wire [7:0] dout;
reg [7:0] din;
reg clk,rst,staenc,stadec,load_shift,loadkey;

aestop aestop(din , dout , loadkey , load_shift , stadec , staenc ,  rst , clk );

//clock generation				   
initial clk = 1;
always #2.5 clk = ~clk;
	
initial 
	begin		     	
		    rst=1;
		    staenc=0;
		    stadec=0;
		    load_shift=0;
		    loadkey=0;
		#1  rst=0;		//test reset
		#10 rst=1;
		    loadkey=1;//load cipher key 
		    din=8'h3c;                         
  		#5 loadkey=1; 
		    din=8'h4f;
		#5 loadkey=1; 
		    din=8'hcf;
		#5 loadkey=1; 
		    din=8'h09;
  		#5 loadkey=1; 
		    din=8'h88;
		#5 loadkey=1; 
		    din=8'h15;
		#5 loadkey=1; 
		    din=8'hf7;
		#5 loadkey=1; 
		    din=8'hab;
		#5 loadkey=1; 
		    din=8'ha6;
		#5 loadkey=1; 
		    din=8'hd2;
		#5 loadkey=1; 
		    din=8'hae;
		#5 loadkey=1; 
		    din=8'h28;
		#5 loadkey=1; 
		    din=8'h16;
		#5 loadkey=1; 
		    din=8'h15;
		#5 loadkey=1; 
		    din=8'h7e;
		#5 loadkey=1; 
		    din=8'h2b;
		     
		#5 loadkey=0;
		    load_shift=1;//load plain text 
		    din=8'h34;
		#5 load_shift=1;
        din=8'h07;         
    #5 load_shift=1;
        din=8'h37;
    #5 load_shift=1;
        din=8'he0;         
    #5 load_shift=1;
        din=8'ha2;
    #5 load_shift=1;
        din=8'h98;
    #5 load_shift=1;
        din=8'h31;
    #5 load_shift=1;
        din=8'h31;
    #5 load_shift=1;
        din=8'h8d;
    #5 load_shift=1;
        din=8'h30;
    #5 load_shift=1;
        din=8'h5a;
    #5 load_shift=1;
        din=8'h88;         
    #5 load_shift=1;
        din=8'ha8;
    #5 load_shift=1;
        din=8'hf6;     
    #5 load_shift=1;
        din=8'h43;
    #5 load_shift=1;
        din=8'h32;
    
    #5 load_shift=0;
        staenc=1; //start encryption
		#5 staenc=0;
		
		#65 load_shift=1;//shift right to output cipher text 
		#75  load_shift=0;//stop shift right
		
		#25  load_shift=1;//load cipher text 
		     din=8'h32;         
    #5  load_shift=1;
         din=8'h0b;
    #5  load_shift=1;
         din=8'h6a;
    #5  load_shift=1;
         din=8'h19;         
    #5  load_shift=1;
         din=8'h97;
    #5  load_shift=1;
         din=8'h85;
    #5  load_shift=1;
         din=8'h11;
    #5  load_shift=1;
         din=8'hdc;
    #5  load_shift=1;
         din=8'hfb;
    #5  load_shift=1;
         din=8'h09;         
    #5  load_shift=1;
         din=8'hdc;
    #5  load_shift=1;
         din=8'h02;         
    #5  load_shift=1;
         din=8'h1d;
    #5  load_shift=1;
         din=8'h84;     
    #5  load_shift=1;
         din=8'h25;
    #5  load_shift=1;
         din=8'h39;     
  		
  		#5  load_shift=0;
         stadec=1; //start decryption
		#5  stadec=0;
		
		#65 load_shift=1;//shift right to output plain text 
		#75  load_shift=0; //stop shift right
  		    		
		#25 $finish;		
	end
initial begin
	$fsdbDumpfile("aestop.fsdb");
	$fsdbDumpvars;
end
initial begin
	$sdf_annotate("aestop_io.sdf",aestop,,,"MINIMUM","1:1:1","FROM_MTM");
end
					
endmodule
