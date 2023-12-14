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
    output [3:0] outhrstens, //Value for hrs tens to send to 7-seg display
    output [3:0] outhrsones, //Value for hrs ones to send to 7-seg display
    output [3:0] outmintens, //Value for min tens to send to 7-seg display
    output [3:0] outminones, //Value for min ones to send to 7-seg display
    output [3:0] outsectens, //Value for sec tens to send to 7-seg display
    output [3:0] outsecones //Value for sec ones to send to 7-seg display
    
    );
    
    reg [4:0] hours;
    reg [5:0] minutes;
    reg [5:0] seconds;
    wire [5:0] hrstensc;
    wire [5:0] hrsonesc;
    wire [5:0] mintensc;
    wire [5:0] minonesc;
    wire [5:0] sectensc;
    wire [5:0] seconesc;
    wire [5:0] hrstensd;
    wire [5:0] hrsonesd;
    wire [5:0] mintensd;
    wire [5:0] minonesd;
    wire [5:0] sectensd;
    wire [5:0] seconesd;
    reg [5:0] hrstensf;
    reg [5:0] hrsonesf;
    reg [5:0] mintensf;
    reg [5:0] minonesf;
    reg [5:0] sectensf;
    reg [5:0] seconesf;
    
    
    initial begin
    
        hours = 0;
        minutes = 0;
        seconds= 0;
        hrstensf = 0;
        hrsonesf = 0;
        mintensf = 0;
        minonesf = 0;
        sectensf = 0;
        seconesf = 0;
    
    end
    
    always @ (*) begin
        
        if(mode == 1) begin
        
            if(val >= 59) begin
            
                seconds = 59;
            
            end else begin
            
                seconds = val; // Mode 1 changes seconds
            
            end
        
        end else begin
        
            if(mode == 2) begin
                
                if(val >= 59) begin
                
                    minutes = 59;
                
                end else begin
                
                    minutes = val; //Mode 2 changes min
                
                end
            
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
    
    always @ (*) begin
    
        if(mode == 0) begin
        
            hrstensf = hrstensc;
            hrsonesf = hrsonesc;
            mintensf = mintensc;
            minonesf = minonesc;
            sectensf = sectensc;
            seconesf = seconesc;
        
        end else begin
        
            hrstensf = hrstensd;
            hrsonesf = hrsonesd;
            mintensf = mintensd;
            minonesf = minonesd;
            sectensf = sectensd;
            seconesf = seconesd;
        
        end
    
    end
    
    assign outhrstens = hrstensf[3:0];
    assign outhrsones = hrsonesf[3:0];
    assign outmintens = mintensf[3:0];
    assign outminones = minonesf[3:0];
    assign outsectens = sectensf[3:0];
    assign outsecones = seconesf[3:0];
    
    //Clock tracks time and returns it
    Clock clock1(switch, mode, hours, minutes, seconds, hrstensc, hrsonesc, mintensc, minonesc, sectensc, seconesc);
    
    DisplayDecoder decoder1(hours, minutes, seconds, hrstensd, hrsonesd, mintensd, minonesd, sectensd, seconesd);
    
endmodule
