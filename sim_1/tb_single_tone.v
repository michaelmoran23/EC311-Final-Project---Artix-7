`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 10:46:01 PM
// Design Name: 
// Module Name: tb_single_tone
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


`timescale 1ns/1ns

module tb_single_tone();
  reg clk;
  wire speaker;
  reg [15:0] counter;
      reg clk_out;


  // Instantiate the module under test
  tone_test uut (
    .clk(clk),
    .speaker(speaker)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  always@ (posedge clk) 
  begin
  clk_out <= uut.clk_out;
  end 
  
endmodule

