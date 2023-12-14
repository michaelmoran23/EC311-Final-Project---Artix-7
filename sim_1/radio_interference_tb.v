`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 07:11:38 PM
// Design Name: 
// Module Name: radio_interference_tb
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



module radio_interface_tb;

  reg clk;
  reg [1:0] mode;
  wire out;
  reg music;

  radio_interface dut (
    .mode(mode),
    .clk(clk),
    .out(out)
  );

  initial begin
    clk = 0;
    mode = 0;

 
    forever #1 clk = ~clk;
    end

    initial begin
    #20 mode = 3; 
    #5000000 mode = 2; 
    #2000000 mode = 1; 
    #2000000 mode = 0; 
    #2000000 mode = 2; 
    end
      

endmodule
