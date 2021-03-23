module compliment (in,s,out);
input [7:0] in;
input s;
output reg [7:0]out;
always @ (in,s) begin
 out =  (s ? ~(in) : in) + s;
end
endmodule
