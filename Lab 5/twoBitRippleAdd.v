module twoBitRippleAdder(A1, A0, B1, B0, C0, S1, S0, C2);
    input A1, A0, B1, B0, C0;
    output S1, S0, C2;
    wire COUT1;
    fullAdd(A1, A0, C0, S0, COUT1);
    fullAdd(B1, B0, COUT1, S1, C2);
endmodule