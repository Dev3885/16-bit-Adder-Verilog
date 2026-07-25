// overflow, zero flag, parity flagg check is missing. add them
module add16 (input wire [15:0] A, B, input wire CIN, output wire [15:0] SUM, output wire COUT, sign, overflow, parity, eparity, zeroflag);
wire COUT1, COUT2, COUT3;
assign sign = SUM[15];
assign overflow = (A[15] & B[15] & ~SUM[15]) | (~A[15] & ~B[15] & SUM[15]);
assign zeroflag = (SUM == 16'h000);
assign parity = ^SUM;
assign eparity = ~(^SUM);

add4 A1 (.s(SUM[3:0]),.c_out(COUT1),.x(A[3:0]),.y(B[3:0]),.c_in(CIN));
add4 A2 (.s(SUM[7:4]),.c_out(COUT2),.x(A[7:4]),.y(B[7:4]),.c_in(COUT1));
add4 A3 (.s(SUM[11:8]),.c_out(COUT3),.x(A[11:8]),.y(B[11:8]),.c_in(COUT2));
add4 A4 (.s(SUM[15:12]),.c_out(COUT),.x(A[15:12]),.y(B[15:12]),.c_in(COUT3));

endmodule
