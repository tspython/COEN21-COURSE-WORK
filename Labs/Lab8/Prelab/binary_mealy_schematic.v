module binary_mealy_schematic(Clock, Resetn, d, n, z, c);
    input Clock, Resetn, d, n;
    output reg z, c;
    reg [2:1] y, Y;
    parameter [2:1] 
                S1 = 2'b00;
                S2 = 2'b10;
                S3 = 2'b01;
    always @(d,n,y)
        case(y)
            S1: if(d) 
                begin
                    z = 0;
                    c = 0;
                    Y = 2'b10;
                end
                if(n)
                begin 
                    z = 0;
                    c = 0;
                    Y = 2'b01;
                else 
                begin
                    z = 0;
                    c = 0;
                    Y = 2'b00;
                end
            S2: if(d)
                begin
                    z = 0;
                    c = 0;
                    Y = 2'b11;
                end
                if(n)
                begin
                    z = 1;
                    c = 0;
                    Y = 2'b00;
                end
                begin
                    z = 0;
                    c = 0;
                    Y = b'10;
                end
            S3: if(d)
                begin
                    z = 1;
                    c = 0;
                    Y = b'00;
                end
                if(n)
                begin
                    z = 0;
                    c = 0;
                    Y = b'10;
                end
                else 
                begin
                    z = 0;
                    c = 0;
                    Y = b'01;
                end
        endcase

    always @(negedge Resetn or posedge Clock)
        if(Resetn == 0)
            y <= S1;
        else
            y <= Y;
endmodule