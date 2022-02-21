module fullAdd(A,B, CIN, SOUT, COUT);
    input A, B, CIN;
    output SOUT, COUT;
    assign SOUT = CIN ^ A ^ B;
    assign COUT = (CIN & (A ^ B))|(A&B);
endmodule
