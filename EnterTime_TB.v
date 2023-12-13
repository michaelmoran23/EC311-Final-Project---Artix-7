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
    wire [4:0] outhrs;
    wire [5:0] outmin;
    wire [5:0] outsec;
    
    EnterTime myenter(mode, switch, val, outhrs, outmin, outsec);
    
    initial begin
        
        switch = 0; //Resart and run simulation for 13 seconds to see results
        mode = 1;
        val = 55;
        #1000;
        mode = 2;
        val = 59;
        #1000;
        mode = 3;
        val = 23;
        #1000;
        mode = 0;
        switch = 1;
        #5000
        switch = 0;
        #5000
        $finish;
    
    end
    
endmodule
