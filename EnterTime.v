`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 10:56:22 AM
// Design Name: 
// Module Name: EnterTime
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


module EnterTime(
    
    input [2:0] mode, //Switches different mode or change between hrs, min, sec
    input switch, //Switch used for turning clock counting on/off
    input [5:0] val, //Value used for changing hrs, min, sec
    output [4:0] outhrs, //Value for hrs to send to 7-seg displau
    output [5:0] outmin, //Value for min to send to 7-seg display
    output [5:0] outsec //Value for sec to send to 7-seg displau
    
    );
    
    reg [4:0] hours;
    reg [5:0] minutes;
    reg [5:0] seconds;
    
    initial begin
    
        hours = 0;
        minutes = 0;
        seconds= 0;
    
    end
    
    always @ (mode, val) begin
        
        if(mode == 1) begin
        
            seconds = val; // Mode 1 changes seconds
        
        end else begin
        
            if(mode == 2) begin
            
                minutes = val; //Mode 2 changes min
            
            end else begin
            
                if(mode == 3) begin
                    
                    if(val >= 23) begin //Cannot set hrs to more than 23
                    
                        hours = 23;
                    
                    end else begin
                    
                        hours = val; //Mode 3 changes hrs
                    
                    end
                
                end
            
            end
        
        end
    
    end
    
    //Clock tracks time and returns it
    Clock myclock(switch, mode, hours, minutes, seconds, outhrs, outmin, outsec);
    
endmodule
