`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 09:02:32 AM
// Design Name: 
// Module Name: radio_interface
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


module radio_interface(
    input [1:0] mode, 
    input clk, 
    output reg out,
    output on,
    output [1:0] led
    );
    
    assign led[1:0] = mode[1:0];
    wire music, amb, pol, tone, clk_out; 
    
    
    clockDiv25 clk25 (.clk_in(clk), .clk_out(clk_out));
    
    music mus(.clk(clk_out), .speaker(music));
    
    ambulance am(.clk(clk_out), .speaker(amb));
    
    police po(.clk(clk_out), .speaker(pol));
    
    single_tone ton(.clk(clk_out), .speaker(tone));
   
   assign on = 1; 
  
  /* 
  always@ (*) 
  assign out = tone; 
  */
    
     always @(*) 
        case (mode) 
             0: out = music; 
             1: out = amb; 
             2: out = pol; 
             3: out = tone; 
        endcase

   //pwm_gen(.clk(clk), .rst(rst), .pwm_out(pwm_out));
    
endmodule
