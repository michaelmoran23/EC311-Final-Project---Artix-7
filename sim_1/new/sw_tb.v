`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 09:10:08 PM
// Design Name: 
// Module Name: sw_tb
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


module sw_tb(

    );
    
    
     reg clk;
    reg [2:0] control;
    wire [31:0] count;

    StopwatchModule uut (
        .clk(clk),
        .control(control),
        .count(count)
    );

    // Generate a clock with a 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    initial begin 
    
        control = 0; 
        
        #2000
        
        control = 1; 
        
        #2000
        
        control = 2; 
        
        end
        
        
    
endmodule
