`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 02:54:59 PM
// Design Name: 
// Module Name: ambulance
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


module ambulance (clk, speaker);
input clk;
output reg speaker;

parameter clkdivider = 25000000/440/2;

reg [23:0] tone;
reg [14:0] counter;

initial begin 

speaker = 0;
tone = 24'd0;
counter = 15'd0; 
end


always @(posedge clk) tone <= tone+1;

always @(posedge clk) if(counter==0) counter <= (tone[23] ? clkdivider-1 : clkdivider/2-1); else counter <= counter-1;

always @(posedge clk) if(counter==0) speaker <= ~speaker;
endmodule
