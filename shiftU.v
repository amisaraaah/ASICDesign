module shiftU (a,s1,s0,out,clk,rst);
input [7:0] a;
input s1,s0,clk,rst;
output reg [7:0]out;
parameter [1:0] rShift = 2'b00,lShift = 2'b01,rRotate = 2'b10,lRotate = 2'b11;
always @ (posedge clk or rst) begin
if (!rst) begin out <= 8'b0; end
else begin
 case ({s1,s0}) 
  rShift: out <= {1'b0,a[7:1]};
  lShift: out <= {a[6:0],1'b0};
  rRotate: out <= {a[0],a[7:1]};
  lRotate: out <= {a[6:0],a[7]};
 endcase
end
end
endmodule 
