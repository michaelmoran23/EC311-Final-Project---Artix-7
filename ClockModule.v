`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 05:27:23 PM
// Design Name: 
// Module Name: ClockModule
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

module ClockModule(
    input wire clk_in,  // External clock input
    output reg clk_out  // Generated the clock output
);

parameter DIVIDE_BY = 2; //divide the input clock frequency by 2

reg [31:0] counter = 0; // Counter to toggle the output clock


initial begin
    clk_out = 0;
end

always @(posedge clk_in) begin
    counter <= counter + 1;
    if (counter >= (DIVIDE_BY - 1)) begin
        counter <= 0;
        clk_out <= ~clk_out; // Toggle the clock output
    end
end

endmodule