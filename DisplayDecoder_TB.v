`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 09:58:01 PM
// Design Name: 
// Module Name: DisplayDecoder_TB
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


module DisplayDecoder_TB(

    );
    
    reg [4:0] inhrs;
    reg [5:0] inmin;
    reg [5:0] insec;
    wire [5:0] outhrstens;
    wire [5:0] outhrsones;
    wire [5:0] outmintens;
    wire [5:0] outminones;
    wire [5:0] outsectens;
    wire [5:0] outsecones;
    
    DisplayDecoder mydecoder(inhrs, inmin, insec, outhrstens, outhrsones, outmintens, outminones, outsectens, outsecones);
    
    initial begin
    
        inhrs = 23;
        inmin = 59;
        insec = 55;
        #10;
        inhrs = 5;
        inmin = 9;
        insec = 0;
        #10;
        $finish;
    
    end
    
endmodule
