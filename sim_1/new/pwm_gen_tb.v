`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2023 08:14:57 AM
// Design Name: 
// Module Name: pwm_gen_tb
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


module pwm_gen_tb;

    parameter PWM_RESOLUTION = 8; // 8 bit
    parameter CLK_PERIOD = 10;    // Clock period in ns (100 MHz clock for PWM frequency >= 50 kHz)
    parameter integer MAX_DUTY_CYCLE = 1 << PWM_RESOLUTION; // Maximum duty cycle value
    parameter integer SIM_STEP = CLK_PERIOD * 256; // Time step to change the duty cycle
    parameter integer SIM_DURATION = SIM_STEP * MAX_DUTY_CYCLE * 2; // Total simulation time

    reg clk = 0;
    reg rst = 1;

    wire pwm_out;
    reg [PWM_RESOLUTION-1:0] duty_cycle = 0; // Duty cycle for PWM generator

    pwm_gen #(.PWM_RESOLUTION(PWM_RESOLUTION)) uut (
        .clk(clk),
        .rst(rst),
        .pwm_out(pwm_out)
    );

    // simulate a 100 MHz hardware clock
    always #(CLK_PERIOD / 2) clk = ~clk;

    initial begin
        // reset for a bit
        #(CLK_PERIOD * 5);
        rst = 0;

        // Run the simulation for 2 * MAX_DUTY_CYCLE * SIM_STEP clock cycles to see the full duty cycle range *2
        #(SIM_DURATION);
        $finish;
    end

endmodule
