module arithU (a,b,s1,s0,f,C,V,Z,eq,gr,ls);
input [7:0] a,b;
input s1,s0;
output reg [7:0] f;
output wire eq,gr,ls,C,V,Z;
wire [7:0] bModified,adderOut;
// s1 decides add or sub ;  s0 decides b should be 2's comp or not
 comparator compr (.a(a),.b(b),.eq(eq),.gr(gr),.ls(ls));
 compliment compl (.in(b),.s(s0),.out(bModified));
 adder adr (.a(a),.b(bModified),.sum(adderOut),.cin(s1),.C(C),.V(V),.Z(Z));

always @ (s1,bModified,adderOut) begin
 f = s1 ? bModified : adderOut;
end
endmodule
