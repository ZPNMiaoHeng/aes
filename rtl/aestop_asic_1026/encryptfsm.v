`timescale 1ns / 1ns

module encryptfsm(clk,rst,staenc,keysel,rndkren,rconsel,sboxinsel,wrregen,keyadsel,mixsel,reginsel,enc_state,deckeywen);

output rndkren,sboxinsel,wrregen,mixsel,reginsel,deckeywen;
output [1:0] keysel,keyadsel;
output [3:0] rconsel,enc_state;
input clk,rst,staenc;

reg [3:0] enc_state,next_state;
reg [3:0] rconsel;

parameter IDLE=4'd0,KEY_PREPARE=4'd1,INITIAL_KEY_ADD=4'd2,FIRST_ROUND=4'd3,SECOND_ROUND=4'd4,
          THIRD_ROUND=4'd5,FOURTH_ROUND=4'd6,FIFTH_ROUND=4'd7,SIXTH_ROUND=4'd8,
          SEVENTH_ROUND=4'd9,EIGHTH_ROUND=4'd10,NINTH_ROUND=4'd11,TENTH_ROUND=4'd12;
          
always @ (posedge clk or negedge rst)
	  if(!rst)
				enc_state<=IDLE;
		else 
				enc_state<=next_state;
	
always @ (*)
    case(enc_state)
        IDLE: if(staenc == 1) 
			            next_state = KEY_PREPARE;
					    else 
					        next_state = IDLE;
        KEY_PREPARE: next_state = INITIAL_KEY_ADD;
        INITIAL_KEY_ADD: next_state = FIRST_ROUND;
        FIRST_ROUND: next_state = SECOND_ROUND;
        SECOND_ROUND: next_state = THIRD_ROUND;
        THIRD_ROUND: next_state = FOURTH_ROUND;
        FOURTH_ROUND: next_state = FIFTH_ROUND;
        FIFTH_ROUND: next_state = SIXTH_ROUND;
        SIXTH_ROUND: next_state = SEVENTH_ROUND;
        SEVENTH_ROUND: next_state = EIGHTH_ROUND;
        EIGHTH_ROUND: next_state = NINTH_ROUND;
        NINTH_ROUND: next_state = TENTH_ROUND;
        TENTH_ROUND: next_state = IDLE;
        default: next_state = IDLE;
    endcase

assign keysel=(enc_state==KEY_PREPARE) ? 2'd0 : 2'd2;
assign rndkren=((enc_state==IDLE)||(enc_state==TENTH_ROUND)) ? 1'b0 : 1'b1;
assign sboxinsel=1'b0;
assign deckeywen=(enc_state==NINTH_ROUND) ? 1'b1 : 1'b0;
assign wrregen=((enc_state==IDLE)||(enc_state==KEY_PREPARE)) ? 1'b0 : 1'b1;
assign keyadsel=(enc_state==INITIAL_KEY_ADD) ? 2'd0 : ((enc_state==TENTH_ROUND) ? 2'd2 : 2'd1);
assign mixsel=1'b0;
assign reginsel=1'b0;
always @ (*)
    case(enc_state)
        INITIAL_KEY_ADD: rconsel=4'd0;//select 1th round constant
		    FIRST_ROUND: rconsel=4'd1;//select 2th round constant
		    SECOND_ROUND: rconsel=4'd2;//select 3th round constant
		    THIRD_ROUND: rconsel=4'd3;//select 4th round constant
		    FOURTH_ROUND: rconsel=4'd4;//select 5th round constant
		    FIFTH_ROUND: rconsel=4'd5;//select 6th round constant
		    SIXTH_ROUND: rconsel=4'd6;//select 7th round constant
		    SEVENTH_ROUND: rconsel=4'd7;//select 8th round constant
		    EIGHTH_ROUND: rconsel=4'd8;//select 9th round constant
		    NINTH_ROUND: rconsel=4'd9;//select 10th round constant
		    default: rconsel=4'd0;
		endcase
			
endmodule