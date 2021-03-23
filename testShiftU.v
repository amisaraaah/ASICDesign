`timescale 1ms/100us
module testShiftU ();
reg [7:0] a,b;
reg s1,s0,clk,rst;
wire [7:0] out;
shiftU dut(.a(a),.s1(s1),.s0(s0),.out(out),.clk(clk),.rst(rst));
initial begin
$timeformat(-3,2,"ms",16);
a = 8'b1111_1101 ;
clk = 1'b0;
rst = 1'b0;
end
always #5 clk = ~clk;
initial begin
#2 rst = 1'b1;
#10 {s1,s0} = 2'b00;  // 01111110
#10 {s1,s0} = 2'b01;  // 11111010
#10 {s1,s0} = 2'b10;  // 11111110
#10 {s1,s0} = 2'b11;  // 11111011
#10 $stop;
end
initial begin
$monitor("%t %b%b a = %b , output = %b",$time,s1,s0,a,out);
end
endmodule
