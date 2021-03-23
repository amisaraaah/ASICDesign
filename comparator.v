module comparator (a,b,eq,gr,ls);
input [7:0] a,b;
output reg eq,gr,ls;
always @ (a,b) begin
 eq = a == b;
 gr = a > b;
 ls = a < b;
end
endmodule
