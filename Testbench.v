// Code your testbench here
// or browse Examples

`timescale 1ns / 1ps
module tb_parking_system();
  // Inputs
  reg clk;
  reg reset_n;
  reg sensor_entrance;
  reg sensor_exit;
  reg [1:0] password;

  // Outputs
  wire GREEN_LED;
  wire RED_LED;
  wire [3:0] number;
  wire [9:0] fare;
  wire [2:0] state;
  
  parking_system uut (
  .clk(clk), 
  .reset_n(reset_n), 
  .sensor_entrance(sensor_entrance), 
  .sensor_exit(sensor_exit), 
  .password(password),
  .GREEN_LED(GREEN_LED), 
  .RED_LED(RED_LED), 
  .number(number),
  .fare(fare),
  .state(state)
 );
  
  initial begin
 // Initialize Inputs
 
 clk=1'b0;
 reset_n = 0;
 sensor_entrance = 0;
 sensor_exit = 0;
 password = 2'b00;
 #10 clk=1'b1;
 #10;
   $display("Welcome to Smart Car Parking System.\n");
   $display("Note: Single bit port mean ON if 1 and OFF if 0");
   $display("\nINPUTS\nSensor-entrance: %b, Sensor-exit: %b    //Idle state",sensor_entrance, sensor_exit);
   $display("Password: %b  (Correct password=11)",password);
   $display("OUTPUTS\nRed Light: %b, Green Light: %b",RED_LED, GREEN_LED);
   
   $display("Number: %b(Binary), %d (Decimal) | Fare: %d(Decimal)",number,number,fare);
   if(state==3'b000)
     $display("State: IDLE\n");
   else if(state==3'b001)
     $display("State: WAIT PASSWORD\n");
   else if(state==3'b010)
     $display("State: WRONG PASSWORD\n");
   else if(state==3'b011)
     $display("State: RIGHT PASSWORD\n");
   else if(state==3'b100)
     $display("State: STOP\n");
 
 clk=1'b0;
 reset_n = 0;
 sensor_entrance = 1;
 sensor_exit = 0;
 password = 2'b00;
 #10 clk=1'b1;
 #10;
   $display("\nINPUTS\nSensor-entrance: %b, Sensor-exit: %b    //Car incoming. Red Light and ask for Password",sensor_entrance, sensor_exit);
   $display("Password: %b  (Correct password=11)",password);
   $display("OUTPUTS\nRed Light: %b, Green Light: %b",RED_LED, GREEN_LED);
   
   $display("Number: %b(Binary), %d (Decimal) | Fare: %d(Decimal)",number,number,fare);
   if(state==3'b000)
     $display("State: IDLE\n");
   else if(state==3'b001)
     $display("State: WAIT PASSWORD\n");
   else if(state==3'b010)
     $display("State: WRONG PASSWORD\n");
   else if(state==3'b011)
     $display("State: RIGHT PASSWORD\n");
   else if(state==3'b100)
     $display("State: STOP\n");
