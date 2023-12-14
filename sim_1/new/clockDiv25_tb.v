`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 01:38:02 PM
// Design Name: 
// Module Name: clockDiv25_tb
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


module clockDiv25_tb;

  parameter CLK_PERIOD = 10; // Clock period in time units

  reg clk_in;

  wire clk_out;

    reg [2:0] counter;   
  clockDiv25 uut (
    .clk_in(clk_in),
    .clk_out(clk_out)
  );

  always #((CLK_PERIOD / 2)) clk_in = ~clk_in;

  initial begin
    clk_in = 0;
   
    #CLK_PERIOD;

  
  end


always@ (posedge clk_in) 
  begin
  counter <= uut.counter;
  end 
  
  
endmodule
