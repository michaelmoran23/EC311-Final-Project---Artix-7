`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 02:56:25 PM
// Design Name: 
// Module Name: police
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


module police(clk, speaker);
input clk;
output reg speaker;

reg [27:0] tone;
reg [14:0] counter;

initial begin 

tone = 28'd0; 
counter = 15'd0; 
speaker = 0;

end 
 
always @(posedge clk) tone <= tone+1;

wire [6:0] fastsweep = (tone[22] ? tone[21:15] : ~tone[21:15]);
wire [6:0] slowsweep = (tone[25] ? tone[24:18] : ~tone[24:18]);
wire [14:0] clkdivider = {2'b01, (tone[27] ? slowsweep : fastsweep), 6'b000000};

always @(posedge clk) if(counter==0) counter <= clkdivider; else counter <= counter-1;


always @(posedge clk) if(counter==0) speaker <= ~speaker;
endmodule
