#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;
set S:=1..N;
param COSTM{S,S};#the matrix representing the cost of assigning factory i to location j.
var x{S,S}>=0,<=1,integer;
#defining the objective function
minimize cost:sum{i in S, j in S}(COSTM[i,j]*x[i,j]);
s.t. con1{j in S}:sum{i in S}x[i,j]=1;
s.t. con2{j in S}:sum{i in S}x[j,i]=1;
s.t. con3:x[1,3]=0;#i.e, facility 1 cannot be assigned to location 3.
s.t. con4:x[12,12]=0;#i.e, facility 12 cannot be assigned to location 12.
s.t. con5:x[7,7]=0;#i.e, facility 7 cannot be assigned to location 7.
