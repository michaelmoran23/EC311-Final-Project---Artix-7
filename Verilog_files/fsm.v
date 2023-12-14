`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2023 08:43:13 AM
// Design Name: 
// Module Name: fsm
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


module fsm(
        input clock,
        input [23:0] in,
        output [6:0] cathode,
        output reg [7:0] anode
    );
    reg [3:0] four_bit_number;
    decoder dec(.number(four_bit_number), .cathode(cathode));// instantiate decoder that decodes the four bit number into the cathode
    reg [2:0] state; // stores state of FSM
    
    initial begin
		state = 0;
		anode = 8'b11111111;
	end
    
    always @(posedge clock)
	begin
		// increment state
		state = state + 1;
		if (state == 0) 
		begin 
		anode = 8'b11111110;
		four_bit_number = in[3:0];
		end
		if (state == 1) 
		begin 
		anode = 8'b11111101;
		four_bit_number = in[7:4];
		end
		if (state == 2) 
		begin 
		anode = 8'b11111011;
		four_bit_number = in[11:8];
		end
		if (state == 3) 
		begin 
		anode = 8'b11110111;
		four_bit_number = in[15:12];
		end
		if (state == 4) 
		begin 
		anode = 8'b11101111;
		four_bit_number = in[19:16];
		end
		if (state == 5) 
		begin 
		anode = 8'b11011111;
		four_bit_number = in[23:20];
		end
		
	end
    
endmodule
