`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 09:01:03 PM
// Design Name: 
// Module Name: stopwatch_tb
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


module stopwatch_tb(

    );
    
    
    
    
    reg clk;
    reg [1:0] control;
    wire [23:0] count;

    StopwatchModule uut (
        .clk(clk),
        .control(control),
        .count(count)
    );
    
     initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
    
    control = 0; 
    
    #200
    
    control = 1; 
    
    #200 
    
    control = 2; 
    
    end
    
    

endmodule
