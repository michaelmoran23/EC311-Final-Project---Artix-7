`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2023 12:16:02 PM
// Design Name: 
// Module Name: wavTB
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


module wavTB ();

  reg CLK;
  reg [1:0]switch_play;
  wire audio_out;
    reg [7:0] counter;
    reg [5:0] prescaler; 
  //  reg [1:0]file_select; 
    reg [19:0] address;
    reg [7:0] value;
      reg [7:0] memory;







  // Instantiate the wav_player module
  wav_player uut (
    .CLK(CLK),
    .switch_play(switch_play),
    .audio_out(audio_out)
  );

  // Clock generation
  initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
  
  end 
  
  initial begin
  
  switch_play = 1; 
  
  #100 
  
  switch_play = 0; 
  
  #100 
  
  switch_play = 3;
  
  #100 
  switch_play = 1;
  
  end
 
   always @(posedge CLK) begin
    counter <= uut.counter;
  end 
  always @(posedge CLK) begin
    prescaler <= uut.prescaler;
  end 
  always @(posedge CLK) begin
    file_select <= uut.file_select;
  end
  always @(posedge CLK) begin
    address <= uut.address;
  end
  always @(posedge CLK) begin
    value <= uut.value;
  end

  always @(posedge CLK) begin
    memory <= uut.memory[uut.address];
end
  
endmodule
