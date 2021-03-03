#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
set S; 
param EDGES{S,S};#martrix of the edges
var v{S}>=0,<=1,integer;#because they are binary
var v_s{S}>=0,<=1,integer;#because they are binary
var x{S,S}>=0,<=1, integer;#because they are binary
maximize dist:sum{i in S, j in S}(EDGES[i,j]*x[i,j]);
s.t. con1{i in S}:v[i]+v_s[i]=1;#a vertex can eighter be in one of the partitions
#we will compel this variable to be V¬i*V_sj by introducing some addition constrains
s.t. con2{i in S,j in S}:x[i,j]<=v[i];
s.t. con3{i in S,j in S}:x[i,j]<=v_s[j];
s.t. con4{i in S,j in S}:x[i,j]>=v[i]+v_s[j]-1;


