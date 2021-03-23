`timescale 1ms/100us
module testAdder ();
reg [7:0] a,b;
reg cin;
wire [7:0] f;
wire C,V,Z;
adder dut (.a(a),.b(b),.sum(f),.cin(cin),.C(C),.V(V),.Z(Z));
initial begin
$timeformat(-3,2,"ms",16);

// 8-bit so 0 - 255
end
initial begin
#2 a = 200; b = 100; cin = 1'b1; // a+b = 300-256 = 44
#10 a = 50; b = 23; cin = 1'b0;
#10 a = 8'b1101_1001; b = 8'b1000_0011; cin = 1'b0;
#10 a = 0; b = 0; cin = 1'b0;
end
initial begin
$monitor("%t a = %d b = %d , output = %d   carryOut=%b overflow=%b zero=%b " ,$time,a,b,f,C,V,Z);
end
endmodule
