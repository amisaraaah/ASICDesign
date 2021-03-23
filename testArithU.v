`timescale 1ms/100us
module testArithU ();
reg [7:0] a,b;
reg s1,s0;
wire [7:0] f;
wire eq,gr,ls,C,V,Z;
arithU dut (.a(a),.b(b),.s1(s1),.s0(s0),.f(f),.C(C),.V(V),.Z(Z),.eq(eq),.gr(gr),.ls(ls));
initial begin
$timeformat(-3,2,"ms",16);
// 8-bit so 0 - 255
end
initial begin
#2 {s1,s0}= 2'b00; a = 200; b = 100;  // a+b = 300 or 44(300-255 +1)
#10 {s1,s0}= 2'b01; a = 100; b = 200;  // a - b (or a + 2's comp of b) -100 or 156(255-100 +1)
#10 {s1,s0}= 2'b10; a = 0; b = 0;  // b (Z = 1) 
#10 {s1,s0}= 2'b11; a = 200; b = 100;  // b'+1  -100

end
initial begin
$monitor("%t %b%b a = %d b = %d , output = %d      >(%b) =(%b) <(%b)      carryOut = %b overflow = %b zero = %b " ,$time,s1,s0,a,b,f,gr,eq,ls,C,V,Z);
end
endmodule
