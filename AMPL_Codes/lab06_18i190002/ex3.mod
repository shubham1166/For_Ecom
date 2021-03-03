#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;
set LOCATION:=1..N;
set FACTORY:=1..N;
param COSTM{LOCATION,LOCATION};
param TRIPSM{FACTORY,FACTORY};
var x{FACTORY,LOCATION}>=0,<=1,integer;
var y{FACTORY,LOCATION,FACTORY,LOCATION}>=0,<=1, integer;
#minimize cost:sum{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION}(TRIPSM[i,k]*COSTM[j,r]*x[i,j]*x[k,r]);
minimize cost:sum{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION:i!=k and j!=r}(TRIPSM[i,k]*COSTM[j,r]*y[i,j,k,r]);
s.t. con1{j in LOCATION}:sum{i in FACTORY}x[i,j]=1;
s.t. con2{j in FACTORY}:sum{i in LOCATION}x[j,i]=1;
#s.t. con3{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION:i!=k and j!=r}:(y[i,j,k,r]=x[i,j]*x[k,r]) 
s.t. con3{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION}: y[i,j,k,r]<=x[i,j];
#s.t. con4{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION:i!=k and j!=r}: y[i,j,k,r]<=x[k,r];
s.t. con5{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION}: y[i,j,k,r]>=x[k,r]+x[i,j]-1;
s.t. con6{i in FACTORY,j in LOCATION,k in FACTORY,r in LOCATION}: y[i,j,k,r]=y[k,r,i,j];
