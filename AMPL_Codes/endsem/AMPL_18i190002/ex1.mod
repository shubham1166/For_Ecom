#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
set A;
set S;
set P;
param string{S,P};
var x{S,P}, binary;
var y{P}, integer;
var D{S};
var Co;
var max_Dt;
var min_Dt;
minimize C:sum{i in S,j in P}x[i,j];
s.t.con1{i in S,j in P}: x[i,j]>=(y[j]-string[i,j])/26;
s.t.con2{i in S,j in P}: x[i,j]>=-(y[j]-string[i,j])/26;
s.t.con3{i in  S}:D[i]=sum{j in P}x[i,j];
s.t.con4{i in S}:max_Dt>=D[i];
s.t.con5{i in S}:min_Dt<=D[i]; 
s.t.con6: Co = max_Dt - min_Dt;