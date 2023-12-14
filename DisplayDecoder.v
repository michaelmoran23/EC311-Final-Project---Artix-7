`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 09:12:27 PM
// Design Name: 
// Module Name: DisplayDecoder
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


module DisplayDecoder(

    input [4:0] inhrs,
    input [5:0] inmin,
    input [5:0] insec,
    output [3:0] outhrstens,
    output [3:0] outhrsones,
    output [3:0] outmintens,
    output [3:0] outminones,
    output [3:0] outsectens,
    output [3:0] outsecones

    );
    
    reg [5:0] hrstens;
    reg [5:0] hrsones;
    reg [5:0] mintens;
    reg [5:0] minones;
    reg [5:0] sectens;
    reg [5:0] secones;
    
    always @ (inhrs) begin
    
        hrsones = inhrs;
        hrstens = 0;
        if(hrsones > 9) begin
        
            hrstens = hrsones/10;
            hrsones = hrsones%10;
        
        end
                
    end
    
    always @ (inmin) begin
    
        minones = inmin;
        mintens = 0;
        if(minones > 9) begin
        
            mintens = minones/10;
            minones = minones%10;
        
        end
    
    end
    
    always @ (insec) begin
        
        secones = insec;
        sectens = 0;
        if(secones > 9) begin
        
            sectens = secones/10;
            secones = secones%10;
        
        end
    
    end
    
    assign outhrstens = hrstens[3:0];
    assign outhrsones = hrsones[3:0];
    assign outmintens = mintens[3:0];
    assign outminones = minones[3:0];
    assign outsectens = sectens[3:0];
    assign outsecones = secones[3:0];
    
    
endmodule