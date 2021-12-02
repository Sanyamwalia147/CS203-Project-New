// Code your design here
`timescale 1ns / 1ps
module parking_system( 
 input clk, reset_n,
 input sensor_entrance, sensor_exit, 
 input[1:0] password,
 output wire GREEN_LED, RED_LED, 
 output reg[2:0] state,
 output reg[3:0] number,
 output reg[9:0] fare
 );
 parameter IDLE = 3'b000, WAIT_PASSWORD=3'b001, WRONG_PASS=3'b010, RIGHT_PASS=3'b011, STOP = 3'b100;
 reg[2:0] current_state, next_state;

 reg red_tmp,green_tmp;
  
  initial begin
   current_state = IDLE;
   number=4'b0000;
   fare=10'b0000000000;
  end
//State Interconnections...
 always @(*)
   begin
    case(current_state)
     IDLE: 
       begin
        if(sensor_entrance==1 && sensor_exit==1)
 		 next_state = STOP;
   		else if(sensor_entrance==1)
 		 next_state = WAIT_PASSWORD;
   		else
     	 next_state = IDLE;
 	   end
     WAIT_PASSWORD: 
       begin
          if((password==2'b11))
		   next_state = RIGHT_PASS;
		  else
		   next_state = WRONG_PASS;
	   end
 	 WRONG_PASS: 
       begin
        if(password==2'b11)
 		 next_state = RIGHT_PASS;
 		else
		 next_state = WRONG_PASS;
	   end
     RIGHT_PASS: 
       begin
		if(sensor_entrance==1 && sensor_exit==1)
		 next_state = STOP;
		else if(sensor_exit==1)
		 next_state = IDLE;
		else
		 next_state = RIGHT_PASS;
		end
     STOP: 
       begin
		 if(sensor_entrance==1 && sensor_exit==1)
		  next_state = STOP;
		 else
 		  next_state = WAIT_PASSWORD;
 	   end
     default: next_state = IDLE;
    endcase
   end
