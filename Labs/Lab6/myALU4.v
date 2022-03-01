module myALU4(P, A, B, C0, R, C4, V, Z);
  input C0;
  input [3:0] A, B, P;
  output [3:0] R;
  output C4, V, Z;
  reg [3:0] Y;
  
  always @(*)
  begin
    case(P[2:1])
      2'b00: Y = B;
      2'b01: Y = ~B;
      2'b10: Y = 4'b0000;
      2'b11: Y = 4'b1111;
    endcase
  end 
  
  myadder4(P[0], A, Y, V, C4, R);
  assign Z = ~(R[0]|R[1]|R[2]|R[3]);
endmodule
