`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 11:04:38 PM
// Design Name: 
// Module Name: tb_police
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


module tb_police();
  reg clk;
  wire speaker;

  // Instantiate the module under test
  police uut (
    .clk(clk),
    .speaker(speaker)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end


endmodule
