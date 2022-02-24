module tb();
	reg Clock, Reset, Stop;
	wire Lose, Win;
	wire [2:0] DownCount, UpCount;
	
	lab7 dut(
		.Clock(Clock),
		.Reset(Reset),
		.Stop(Stop),
		.Lose(Lose),
		.Win(Win),
		.DownCount(DownCount[2:0]),
		.UpCount(UpCount[2:0])); 
	
	initial begin
		Clock = 0;
		forever #5 Clock = ~Clock;
	end
	
	initial begin
		Reset = 1;
		Stop = 0;
		#10 Reset = 0;
		#55 Stop = 1;
		#25 Reset = 1;
		Stop = 0;
		#10 Reset = 0;
		#45 Stop = 1;
		#25 $finish;
	end
endmodule
