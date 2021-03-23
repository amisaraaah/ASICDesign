`timescale 1ms/100us
module testCompliment();
reg [7:0] in;
reg s;
wire [7:0] out;
compliment dut (.in(in),.s(s),.out(out));
initial begin
$timeformat(-3,2,"ms",16);
in = 8'b0011_0101; 
end
initial begin
#2 {s} = 1'b0;
#2 {s} = 1'b1;
end
initial begin
$monitor("%t %b in = %b out = %b ," ,$time,s,in,out);
end
endmodule
