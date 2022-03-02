module tb; 
	reg Clock, Reset;
	integer index;
	reg [7:0] N = 8'b01001011;
	reg [7:0] D = 8'b00110100;
	wire [1:0] CS, NS;
	wire Open, Change;
	
	binary_mealy_schematic dut(
		.Clock(Clock),
		.Reset(Reset),
		.D(D[index]),
		.N(N[index]),
		.CS(CS[1:0]),
		.NS(NS[1:0]),
		.Open(Open),
		.Change(Change));
		
	initial begin
		Clock <= 1;
		forever #5 Clock <= ~Clock;
	end
	
	initial begin
		index = 0;
		Reset = 0;
		@(posedge Clock) Reset = 1;
		@(posedge Clock) Reset = 0;
		repeat(8) 
			@(posedge Clock) index <= index + 1; 
		$finish; 
	end
endmodule
