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
 //reg[31:0] counter_wait;
 reg red_tmp,green_tmp;
  
  initial begin
   current_state = IDLE;
   number=4'b0000;
   fare=10'b0000000000;
  end