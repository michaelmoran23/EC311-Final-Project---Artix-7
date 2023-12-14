`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 03:11:09 PM
// Design Name: 
// Module Name: single_tone
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


module single_tone(clk, speaker);
input clk;
output speaker;

reg [15:0] counter;


initial begin 
counter = 16'd0;
end

// first create a 16bit binary counter
always @(posedge clk) counter <= counter+1;

// and use the most significant bit (MSB) of the counter to drive the speaker
assign speaker = counter[15];


endmodule