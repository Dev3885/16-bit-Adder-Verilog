module add4 (input wire [3:0] x, y, input wire c_in, output wire [3:0] s, output wire c_out);
wire c_out1, c_out2, c_out3;
fulladder a1 (.sum(s[0]),.cout(c_out1),.a(x[0]),.b(y[0]),.cin(c_in));
fulladder a2 (.sum(s[1]),.cout(c_out2),.a(x[1]),.b(y[1]),.cin(c_out1));
fulladder a3 (.sum(s[2]),.cout(c_out3),.a(x[2]),.b(y[2]),.cin(c_out2));
fulladder a4 (.sum(s[3]),.cout(c_out),.a(x[3]),.b(y[3]),.cin(c_out3));

endmodule