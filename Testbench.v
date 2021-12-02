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