`timescale 1ms/100us
module testTopALU ();
reg [7:0] a,b;
reg [3:0] s;
reg clk,rst;
wire [7:0] f;
wire eq,gr,ls,C,V,Z;
topALU dut (.a(a),.b(b),.s(s),.f(f),.C(C),.V(V),.Z(Z),.eq(eq),.gr(gr),.ls(ls),.clk(clk),.rst(rst));
initial begin
$timeformat(-3,2,"ms",16);
clk = 1'b0;
rst = 1'b0;
end
always #5 clk = ~clk;
initial begin
#2 rst = 1'b1;

//  A + B
#10 s = 4'b0000; a = 200; b = 100; //  44  (00101100)
#10 s = 4'b0001;  // invalid opcode so retain old value
#10 s = 4'b0000; a = 100; b = 100; // 200 (11001000)

// A - B
#10 s = 4'b1000; a = 14; b = 80; // 66
#10 s = 4'b0101;  // invalid opcode so retain old value
#10 s = 4'b1000; a = 100; b = 100; // 0 

// 2's comp
#10 s = 4'b0011; a = 8'b1011_0101; b = 8'b0110_0111; // b'+1

//Logic Unit 
//#10 s = 4'b0001; a = 8'b0011_0101; b = 8'b0110_0111; //AND
//#10 s = 4'b1001; a = 8'b0011_0101; b = 8'b0110_0111; // XOR
//#10 s = 4'b0101; a = 8'b0011_0101; b = 8'b0110_0111; //OR
//#10 s = 4'b1101; a = 8'b0011_0101; b = 8'b0110_0111; // 1's compl or not B

//Shift Unit (register A)
//#10 s = 4'b0011; a = 8'b1111_1101; b = 8'b0; // R rotate (01111110)
//#10 s = 4'b1011; a = 8'b1111_1101; b = 8'b0; // L rotate (11111010)
//#10 s = 4'b0111; a = 8'b1111_1101; b = 8'b0; // R shift (11111110)
//#10 s = 4'b1111; a = 8'b1111_1101; b = 8'b0; // L shift (11111011)

#10 $stop;
end
initial begin
$monitor("%t %b a = %d b = %d , output = %d       >(%b) =(%b) <(%b)      carryOut=%b overflow=%b zero=%b " ,$time,s,a,b,f,gr,eq,ls,C,V,Z);
end
endmodule
