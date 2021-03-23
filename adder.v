module adder (a,b,sum,cin,C,V,Z);
input [7:0] a,b;
input cin;
output wire C,V,Z;
output wire [7:0] sum;
wire [7:0]tc;
fa u1 (.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(tc[0]));
fa u2 (.a(a[1]),.b(b[1]),.cin(tc[0]),.sum(sum[1]),.cout(tc[1]));
fa u3 (.a(a[2]),.b(b[2]),.cin(tc[1]),.sum(sum[2]),.cout(tc[2]));
fa u4 (.a(a[3]),.b(b[3]),.cin(tc[2]),.sum(sum[3]),.cout(tc[3]));
fa u5 (.a(a[4]),.b(b[4]),.cin(tc[3]),.sum(sum[4]),.cout(tc[4]));
fa u6 (.a(a[5]),.b(b[5]),.cin(tc[4]),.sum(sum[5]),.cout(tc[5]));
fa u7 (.a(a[6]),.b(b[6]),.cin(tc[5]),.sum(sum[6]),.cout(tc[6]));
fa u8 (.a(a[7]),.b(b[7]),.cin(tc[6]),.sum(sum[7]),.cout(tc[7]));
assign C = tc[7];
assign Z = ~(|sum);
assign V = tc[7]^tc[6];
endmodule
