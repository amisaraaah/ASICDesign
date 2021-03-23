module logicU (a,b,s1,s0,out);
input [7:0] a,b;
input s1,s0;
output wire [7:0] out;
assign out = s1? (s0 ? (~ b) : (a | b)) : (s0 ? (a ^ b) : (a & b));
endmodule 