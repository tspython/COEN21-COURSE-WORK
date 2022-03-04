module 64FSM(Clock, Resetn, w, z);
    input Clock, Resetn, w;
    output reg z;
    reg [2:0] y, Y;

    parameter A = 3'b000, 
            B = 3'b001, 
            C = 3'b010,
            D = 3'b011, 
            E = 3'b100, 
            F = 3'b101;

    always @(y, w)
        begin
        case (y)
            A:  if (w)
                begin
                    Y = B;
                    z = 1'b0;
                end
                else
                begin
                    Y = A;
                    z = 1'b0;
                end

            B:  if (w)
                begin
                    Y = D;
                    z = 1'b0;
                end
                else
                begin
                    Y = C;
                    z <= 1'b0;
                end

            C:  if (w)
                begin
                    Y = B;
                    z = 1'b0;
                end
                else
                begin
                    Y = S4;
                    z = 1'b0;
                end

            D:  if (w)
                begin
                    Y = F;
                    z = 1'b0;
                end
                else
                begin
                    Y = C;
                    z = 1'b0;
                end

            E:  if (w)
                begin
                    Y = B;
                    z = 1'b1;
                end
                else
                begin
                    Y = A;
                    z = 1'b0;
                end

            F:  if (w)
                begin
                    Y = F;
                    z = 1'b1;
                end
                else
                begin
                    Y = C;
                    z = 1'b0;
                end
        endcase

        always @(negedge Resetn or posedge Clock)
            if(Resetn == 0)
                y <= S1;
            else    
                y <= Y;
endmodule