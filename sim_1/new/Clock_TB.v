`timescale 1ms / 1us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 11:31:01 PM
// Design Name: 
// Module Name: Clock_TB
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


module Clock_TB(

    );
    
    reg switch;
    reg [2:0] mode;
    reg [4:0] inhrs;
    reg [5:0] inmin;
    reg [5:0] insec;
    wire [5:0] outhrstens;
    wire [5:0] outhrsones;
    wire [5:0] outmintens;
    wire [5:0] outminones;
    wire [5:0] outsectens;
    wire [5:0] outsecones;
    
    Clock myclock(switch, mode, inhrs, inmin, insec, outhrstens, outhrsones, outmintens, outminones, outsectens, outsecones);
    
    initial begin
        
        switch = 1; //Restart and run simulation for 10 seconds to see results
        mode = 0;
        inhrs = 23;
        inmin = 59;
        insec = 55;
        #5000;
        switch = 0;
        #5000;
        $finish;
    
    end
    
endmodule