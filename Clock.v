`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 03:19:33 PM
// Design Name: 
// Module Name: Clock
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


module Clock(
    
    input switch, //Switch to turn clock on/off
    input [2:0] mode, //Switch to also turn clock on/off
    input [4:0] inhrs, //Input hrs from user
    input [5:0] inmin, //Input min from user
    input [5:0] insec, //Input sec from user
    output [4:0] outhrs, //Counted hrs
    output [5:0] outmin, //Counted mins
    output [5:0] outsec //Counted sec
    
    );
    
    reg clk;
    integer clkcycles;
    reg [5:0] numsec;
    reg [5:0] nummin;
    reg [4:0] numhrs;
    reg start; /*Used to initialize numsec, nummin, numhrs,
                and clkcycles in second always loop*/
    initial begin
        
        start = 1;
        clk = 0;
    
    end
    
    always #500 clk = ~clk; //500 ns for each clk value change
    
    always @ (posedge clk) begin
        
        if(switch == 1 && mode == 0) begin /*Only when switch is on
                                           and mode is equal to 0
                                           does clock start*/
            
            if(start == 1) begin
            
                start = 0;
                numsec = insec;
                nummin = inmin;
                numhrs = inhrs;
                clkcycles = 0;
            
            end
            clkcycles = clkcycles + 1;
            if(clkcycles == 1000000) begin
            //One cycle is 1000 ns, 1000ns*10^6ns = 1s
            
                clkcycles = 0; //Reset cycles after 1s
                numsec = numsec + 1;
                if(numsec == 60) begin
                //If hrs, min, sec overflow, reset to 0
                
                    numsec = 0;
                    nummin = nummin + 1;
            
                end
                if(nummin == 60) begin
            
                    nummin = 0;
                    numhrs = numhrs + 1;
            
                end
                if(numhrs == 24) begin
            
                    numhrs = 0;
            
                end
            
            end
            
        end
        
    end
   
    assign outhrs = numhrs;
    assign outmin = nummin;
    assign outsec = numsec;
    
endmodule
