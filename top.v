`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 12:59:25 AM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input [6:0] internalmode,
    input [1:0] modeSelect,
    input [5:0] val, 
    output reg speaker,
    output reg sndOn,
    output [6:0] modeLED,
    output [1:0] modeselectLED,
    output [6:0] cathode, 
    output reg [7:0] anode    
    );
    
    
    wire soundwire, codewire, fsmclock; 
    wire [7:0] AN; 
    wire [31:0] swc; 
    wire [23:0] seg;
    reg [23:0] choice; 
    
    initial begin 
        sndOn = 0;
    end
    
    faster_clock_divider fcd(.in_clk(clk), .out_clk(fsmclock));
    
    radio_interface RI(.mode(internalmode[6:5]), .clk(clk), .out(rw), .led(modeLED[6:0]));
    
    //stopwatch module (.clk(clk), .counter(swc)); 
    
    EnterTime myenter(.mode(internalmode[4:2]), .switch(internalmode[1]), .val(val), .outhrstens(seg[23:20]), .outhrsones(seg[19:16]), .outmintens(seg[15:12]), .outminones(seg[11:8]), .outsectens(seg[7:4]), .outsecones(seg[3:0]));
    
    fsm myfsm(.clock(fsmclock), .in(choice), .cathode(cathode), .anode(AN)); 
    
    //code module(.switches(switches[x:x]), .correctout(correct)); 
    
    
      
    always @(*) begin
        if (modeSelect == 0) begin
            sndOn = 0;
            choice = seg;
            anode = AN; 
            //7seg logic for clock
            // if alarm going off set sndOn = 1 else leave 0; 
        end
        if (modeSelect == 1) begin
            //7seg logic for SW
            sndOn = 0; 
        end 
        if (modeSelect == 2) begin
            sndOn = 1; 
            speaker = rw; 
        end  
     
    
    
    end
    
endmodule
