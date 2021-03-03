#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;
set S:=1..N;#NO of facilities or locations
param COSTM{S,S};#the matrix representing the cost of assigning factory i to location j.
var x{S,S}>=0,<=1, integer;
#defining the objective function
minimize cost:sum{i in S, j in S}(COSTM[i,j]*x[i,j]);
#defing the constrains in such a way that each location gets only one factory and each factory is assigned to only one location.
s.t. con1{j in S}:sum{i in S}x[i,j]=1;
s.t. con2{j in S}:sum{i in S}x[j,i]=1;

