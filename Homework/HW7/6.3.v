module 63FSM(clock, w, z);
input clock, w;
output reg z;
reg [2:0] ps = 3'b000, ns;

parameter A = 3'b000, 
        B = 3'b001, 
        C = 3'b010,
        D = 3'b011, 
        E = 3'b100, 
        F = 3'b101;

always @(posedge clock)
begin
   ps <= ns;
end

always @(ps, w)
begin
   case (ps)
       A:  if (w)
                begin
                    ns <= B;
                    z <= 1'b0;
                end
           else
                begin
                    ns <= A;
                    z <= 1'b0;
                end

       B:   if (w)
                begin
                    ns <= D;
                    z <= 1'b0;
                end
           else
                begin
                    ns <= C;
                    z <= 1'b0;
                end

       C:   if (w)
                begin
                    ns <= B;
                    z <= 1'b0;
                end
           else
                begin
                    ns <= S4;
                    z <= 1'b0;
                end

       D:   if (w)
                begin
                    ns <= F;
                    z <= 1'b0;
                end
           else
                begin
                    ns <= C;
                    z <= 1'b0;
                end

       E:   if (w)
                begin
                    ns <= B;
                    z <= 1'b1;
                end
           else
                begin
                    ns <= A;
                    z <= 1'b0;
                end

       F:   if (w)
                begin
                    ns <= F;
                    z <= 1'b1;
                end
           else
                begin
                    ns <= C;
                    z <= 1'b0;
                end

       default:   ns <= A;

   endcase
end

endmodule