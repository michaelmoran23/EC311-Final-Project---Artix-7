`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/13/2023 12:00:38 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;

  // Inputs
  reg clk;
  reg [1:0] soundmode;
  reg [1:0] clkmode; 
  reg [1:0] swmode;
  reg switch;
  reg [1:0] modeSelect;
  reg [5:0] val; 

  // Outputs
  wire speaker;
  wire sndOn;
  wire [6:0] modeLED;
  wire [1:0] modeselectLED;
  wire [6:0] cathode; 
  wire [7:0] anode;
  
      reg [23:0] choice, seg; 
      reg [31:0] swcount; 


  // Instantiate your module
  top uut (
    .clk(clk),
    .clkmode(clkmode),
    .swmode(swmode),
    .soundmode(soundmode),
    .switch(switch),
    .modeSelect(modeSelect),
    .val(val), 
    .speaker(speaker),
    .sndOn(sndOn),
    .modeLED(modeLED),
    .modeselectLED(modeselectLED),
    .cathode(cathode), 
    .anode(anode)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize inputs

    switch = 1; 
    soundmode = 0; 
    clkmode = 1; 
    modeSelect = 2'b00;
    val = 55;
    
    #2000
    clkmode = 2; 
    val = 59; 
    
    #2000
    clkmode = 3; 
    val = 23;
    
    #2000
    clkmode = 0; 
   
   #2000
   modeSelect = 2'b01;
   swmode = 0; 
   
   #20000
   swmode = 1; 
   
   #2000 
   swmode = 2; 
   
   
   

    // Apply some test vectors
    #200000 modeSelect = 2'b10;
    #2000 val = 6'b101010;

  end

    always@ (posedge clk) begin
        choice = uut.choice;
        end
        
        always@ (posedge clk) begin
        seg = uut.seg;
        swcount = uut.swcount;
        end
        
     
endmodule
