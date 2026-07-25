module fulladder (input wire a, b, cin, output wire sum, cout);
wire t1, t2, t3;
xor (t1, a, b), (sum, cin, t1);
and (t2, cin, t1), (t3, a, b);
or (cout, t2, t3);
endmodule