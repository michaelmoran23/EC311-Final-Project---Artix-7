`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2023 03:13:07 PM
// Design Name: 
// Module Name: music_tb
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


module music_tb;

  // Inputs
  reg clk;
  
  // Outputs
  wire speaker;
    
    reg [8:0] counter_note;
    reg [7:0] counter_octave;
    reg [7:0] fullnote;
    reg [30:0] tone;
    reg [2:0] octave;




  // Instantiate the music module
  music dut (
    .clk(clk),
    .speaker(speaker)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end

  // Stimulus
  initial begin
    // Add your stimulus here
end    


always @(posedge clk)
begin
counter_note <= dut.counter_note;
end

always @(posedge clk)
begin
counter_octave <= dut.counter_octave;
end

always @(posedge clk)
begin
fullnote <= dut.fullnote;
end

always @(posedge clk)
begin
tone <= dut.tone;
end

always @(posedge clk)
begin
octave <= dut.octave;
end
endmodule
