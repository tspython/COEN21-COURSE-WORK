module 610FSM(Clock, Resetn, w1, w2, z);
    input Clock, Resetn, w1, w2;
    output reg z;
    reg [2:1] y1, y2;
    wire X;
    parameter [2:1]
                A = 2'b00,
                B = 2'b01,
                C = 2'b10,
                D = 2'b11;

    assign X = w1 ^ w2;

    always @(X or y1)
        case(y1)
            A:  if(k) begin
                    y2 <= A;
                    z <= 0;
                end
                else begin
                    y2 <= B;
                    z <= 0;
                end
            B: if(k) begin
                    y2 <= A;
                    z <= 0;
                end
                else begin
                    y2 <= C;
                    z <= 0;
                end
            C: if(k) begin
                    y2 <= A;
                    z <= 0;
                end
                else begin
                    y2 <= D;
                    z <= 0;
                end
            D: if(k) begin
                    y2 <= A
                    z <=  -
                end
                else begin 
                    y2 <= D
                    z <= 1
                end
        endcase
    always @(negedge Resetn or posedge Clock)
        if(Resetn == 0)
            y1<=A;
        else 
            y1<=y2;
endmodule
    
   
