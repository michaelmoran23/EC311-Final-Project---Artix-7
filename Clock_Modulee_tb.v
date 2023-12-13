`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2023 05:40:56 PM
// Design Name: 
// Module Name: Clock_Modulee_tb
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
module ClockModuleTestbench;

// Testbench clock frequency
parameter TB_CLOCK_FREQ_HZ = 100_000_000;
real TB_CLOCK_PERIOD_NS = 1_000_000_000.0 / TB_CLOCK_FREQ_HZ;  // Use real for accurate division

reg tb_clk_in;
wire tb_clk_out;

// Instance of the ClockModule
ClockModule #(.DIVIDE_BY(4)) uut (
    .clk_in(tb_clk_in),
    .clk_out(tb_clk_out)
);

// Generate the testbench clock with the desired frequency
initial begin
    tb_clk_in = 0;
    forever #(TB_CLOCK_PERIOD_NS / 2) tb_clk_in = ~tb_clk_in;
end


initial begin
    // Initialize
   
    #1000;

    // Finish the simulation
    $finish;
end

// Monitor the output
initial begin
    $monitor("Time = %0t, tb_clk_out = %b", $time, tb_clk_out);
end

endmodule
