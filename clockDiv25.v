`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 11:28:57 AM
// Design Name: 
// Module Name: clockDiv25
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


module clockDiv25(
  input wire clk_in,   // 100MHz input clock
  output reg clk_out  // 25MHz output clock
);

  reg [2:0] counter;    // 2-bit counter for dividing the clock

    initial begin
    clk_out = 0;
    counter = 3'd0;
    end 
    
    
  always @(posedge clk_in) begin
    if (counter == 3'b111) begin
      counter <= 3'b000;  // Reset the counter when it reaches 7
      clk_out <= ~clk_out;  // Toggle the output clock on each division
    end
    else begin
      counter <= counter + 1;  // Increment the counter
    end
  end

endmodule
