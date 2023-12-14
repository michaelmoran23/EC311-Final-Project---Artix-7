`timescale 1ms / 1us
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 11:28:40 AM
// Design Name: 
// Module Name: EnterTime_TB
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


module EnterTime_TB(

    );
    
    reg [2:0] mode;
    reg switch;
    reg [5:0] val;
    wire [3:0] outhrstens;
    wire [3:0] outhrsones;
    wire [3:0] outmintens;
    wire [3:0] outminones;
    wire [3:0] outsectens;
    wire [3:0] outsecones;
    
    EnterTime myenter(.mode(mode), .switch(switch), .val(val), .outhrstens(outhrstens), .outhrsones(outhrsones), .outmintens(outmintens), .outminones(outminones), .outsectens(outsectens), .outsecones(outsecones));
    
    initial begin
        
        switch = 1; //Resart and run simulation for 13 seconds to see results
        mode = 1;
        val = 55;
        #10;
        mode = 2;
        val = 59;
        #10;
        mode = 3;
        val = 23;
        #10;
        mode = 0;
        switch = 1;
        #50
        switch = 0;
        #50
        $finish;
    
    end
    
endmodule