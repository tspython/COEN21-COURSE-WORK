module VendingMachineOneHotMealy(
	input Clock, Reset, D, N,
	output reg [2:0] CS, NS,
	output reg Open, Change);
	
	parameter s0cent = 3'b001, s5cent = 3'b010, s10cent = 3'b100;
	
	always @(posedge Clock) begin
		if(Reset)
			CS <= s0cent;
      else
			CS <= NS;
	end
	
	always @(*)
		case(CS)
			s0cent: begin
				Open = 1'b0;
				Change = 1'b0;
				if(N)
					NS = s5cent;
				else if(D)
					NS = s10cent;
			end
			s5cent: begin
				if(N) begin
					Open = 1'b0;
					Change = 1'b0;
					NS = s10cent;
				end
				else if(D) begin
					Open = 1'b1;
					Change = 1'b0;
					NS = s0cent;
				end
			end
			s10cent: begin
				if(N) begin
					Open = 1'b1;
					Change = 1'b0;
					NS = s0cent;
				end
				else if(D) begin
					Open = 1'b1;
					Change = 1'b1;
					NS = s0cent;
				end 
			end
		endcase
endmodule
