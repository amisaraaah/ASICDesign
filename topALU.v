module topALU (a,b,s,Z,C,V,f,eq,gr,ls,clk,rst);
input [7:0] a,b;
input [3:0] s;
input clk,rst;
output wire Z,C,V,eq,gr,ls;
output reg [7:0] f;
wire [7:0] auOut,luOut,suOut,ctrlOut;
reg [7:0] dIN;
arithU AU (.a(a),.b(b),.s1(s[2]),.s0(s[3]),.f(auOut),.C(C),.V(V),.Z(Z),.eq(eq),.gr(gr),.ls(ls));

logicU LU (.a(a),.b(b),.s1(s[2]),.s0(s[3]),.out(luOut));

shiftU SU (.a(a),.s1(s[2]),.s0(s[3]),.out(suOut),.clk(clk),.rst(rst));

aluCtrl ctrlU (.A(auOut),.L(luOut),.S(suOut),.out(ctrlOut),.s1(s[0]),.s0(s[1]));

always @(posedge clk or rst) begin 
  if(!rst)
    f <= 8'b0;
  else begin
    if(s == 4'b0010 || {s[0],s[1]} == 2'b01)
      f <= f;
    else
      f <= ctrlOut;
  end
end
endmodule
