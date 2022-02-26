module Counter(
	input Clock,
	input Reset,
	input Dir,
	input CntEn,
	input Load,
	input [2:0] New,
	output reg [2:0] Count);
	
	always @(posedge Clock) begin
		if(Reset == 1)
			Count <= 3'b001;
		else begin	
			if(CntEn == 1) begin
				if(Load == 1)
					Count <= New;
				else begin
					if (Dir == 1)
						Count <= Count + 1;
					else
						Count <= Count - 1;
				end
			end
		end
	end
endmodule

module UpControl(
	input [2:0] Count,
	output Load,
	output [2:0] New);
	
	/* While all other "?" symbols in this file need to be replaced with something,
		the one in the below "assign Load" line should stay, as it's part of the syntax
		of the completed line. The statement can be interpreted like this: assign binary
		1 to Load if Count is binary 101, otherwise assign binary 0 to Load. */
	assign Load = (Count == 3'b101) ? 1'b1 : 1'b0;
	assign New = 3'b001; 
endmodule

module DownControl(
  input [2:0] Count,
  output Load,
  output [2:0] New);
  
  assign Load = (Count == 3'b001) ? 1'b1 : 1'b0;
  assign New = 3'b101; 
endmodule

module WinLose(
	input Stop,
	input [2:0] UpCount,
	input [2:0] DownCount,
	output reg CntEn,
	output reg Lose,
	output reg Win);
	// There should be more than one line in this block (I had 11 for reference).
	always @(UpCount or DownCount) begin
		//Set Win and Lose to 0
		Win <= 0;
		Lose<= 0;

		if(Stop) //assert stop
			begin
				CntEn = 0; //stop counting
				if(UpCount == DownCount) //win case
					Win<=1;
				else
					Lose<=1; //lose case
			end
		else
			CntEn = 1; //continue counting
	end
endmodule
