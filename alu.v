module alu (a,b,fn,unitEN,out,flagC,flagZ);
input [7:0] a,b;
input [2:0] fn;
input unitEN;
output wire [15:0] out;
output wire flagC, flagZ;
wire [16:0] aOut;
wire lOut;

arithmeticUnit au (.a(a),.b(b),.fn(fn),.result(aOut));
logicalUnit lu (.a(a),.b(b),.fn(fn),.result(lOut));

assign {flagC,out} = unitEN ? {17{lOut}} : aOut ;
assign flagZ = ({flagC,out} == 17'b0);
endmodule
