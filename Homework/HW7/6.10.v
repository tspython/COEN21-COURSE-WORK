module 610FSM(Clock, Resetn, w1, w2, z);
    input Clock, Resetn, w1, w2;
    output reg z;
    reg [2:1] y, Y;
    wire X;
    parameter [2:1]
                A = 2'b00,
                B = 2'b01,
                C = 2'b10,
                D = 2'b11;

    assign X = w1 ^ w2;

    always @(X, y)
        case(y1)
            A:  if(k) 
                begin
                    Y = A;
                    z = 0;
                end
                else 
                begin
                    Y = B;
                    z = 0;
                end
            B:  if(k) 
                begin
                    Y = A;
                    z = 0;
                end
                else begin
                    Y = C;
                    z = 0;
                end
            C: if(k) begin
                    Y = A;
                    z = 0;
                end
                else begin
                    Y = D;
                    z = 0;
                end
            D:  if(k) 
                begin
                    Y = A
                    z = 0;
                end
                else 
                begin 
                    Y = D;
                    z = 1;
                end
        endcase

    always @(negedge Resetn or posedge Clock)
        if(Resetn == 0)
            y1<=A;
        else 
            y<=Y;
endmodule
    
   
