module pr (clock,A,B,C,D,Compare,Result,interimResult1,interimResult2,Dint);
input A,B,C,D,clock;
output reg Compare,Dint,Result,interimResult1,interimResult2;
reg Cnew,Dnew,InterimComparel,InterimCompare2;
always @ ( posedge clock ) begin 
interimResult1 <= A + B ;
Cnew <= C ; 
Dint <= D ; 
Dnew <= Dint ; 
interimResult2 <= interimResult1 + Cnew ; 
Result <= interimResult2 + Dnew ;
InterimComparel <= A * B ;
InterimCompare2 <= InterimComparel ; 
Compare <= InterimCompare2 ; 
end
endmodule
