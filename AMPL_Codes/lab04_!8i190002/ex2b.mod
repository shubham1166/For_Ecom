#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;
param M;
set S:=1..N;
set P:=1..M;
param b{P};
param c{S};
param A{P,S};
var x{S}>=0,<=1;# i.e., x can be any real no between 0-1
maximize z:sum{i in S}(c[i]*x[i]);
s.t. con{i in P}:sum{j in S}(A[i,j]*x[j])<=b[i];
