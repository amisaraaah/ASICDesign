module aluCtrl (A,L,S,out,s1,s0);
input [7:0] A,L,S;
input s1,s0;
output wire [7:0] out;
// s1 = 0 selects arithmetic unit
// s1 = 1 ; s0 = 0 selects logic unit
// s1 = 1 ; s0 = 1 selects shift unit
assign out = s1 ? (s0 ? S : L) : A ;
endmodule
