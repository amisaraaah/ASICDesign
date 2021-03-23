`timescale 1ms/100us
module testLogicU ();
reg [7:0] a,b;
reg s1,s0;
wire [7:0] out;
logicU dut (.a(a),.b(b),.s1(s1),.s0(s0),.out(out));
initial begin
$timeformat(-3,2,"ms",16);
a = 8'b0011_0101; b = 8'b0110_0111;
end
initial begin
#2 {s1,s0} = 2'b00;  // 0010_0101 and
#10 {s1,s0} = 2'b01; // 0101_0010 xor
#10 {s1,s0} = 2'b10; // 0111_0111 or
#10 {s1,s0} = 2'b11; // 1001_1000 not
end
initial begin
$monitor("%t %b%b a = %b b = %b , output = %b",$time,s1,s0,a,b,out);
end
endmodule
