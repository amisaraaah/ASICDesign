module dFlip(clk,rst,din,dout);
input clk,rst;
input [7:0] din;
output reg [7:0] dout;
always @ (negedge clk)
begin
if(rst)
 dout <= 8'b0;
else
 dout <= din;
end
endmodule

