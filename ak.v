module ak(clk,newPacket,count,error,accum,DataIn);
input clk,newPacket,DataIn;
output reg count,error,accum;
always @ (posedge clk) begin
if (newPacket) begin
  count <= 0; error <= 0; accum <= 0;
end
else if (count <= 7) accum <= accum + DataIn;
else if (count == 8) error <= ~(DataIn == accum);
if (count <= 8) count <= count +1;
end
endmodule
