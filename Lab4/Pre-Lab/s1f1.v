module S1F1(A0,B0,B1,f);
    input A0,B0,B1;
    output f;
    assign f = (A0&B1&B0)|(~B1&~B0)|(~A0&~B1);
endmodule