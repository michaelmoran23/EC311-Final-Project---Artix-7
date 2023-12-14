`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 10:53:39 PM
// Design Name: 
// Module Name: tb_ambulance
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_ambulance();
  reg clk;
  wire speaker;
  
  reg [23:0] tone;   
    reg [14:0] counter;

  // Instantiate the module under test
  ambulance uut (
    .clk(clk),
    .speaker(speaker)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  
  always@ (posedge clk) 
  begin
  counter <= uut.counter;
  end 
  
  
  always@ (posedge clk) 
  begin
  tone <= uut.tone;
  end 

 
endmodule
