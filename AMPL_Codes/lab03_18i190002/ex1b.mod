#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
set REGION;
set FUNCTION;
set FUNCTION2;
param AVAILM{REGION,FUNCTION2};
var amount{REGION,FUNCTION}>=0;
param DISTANCEM{REGION,FUNCTION};
param COST{REGION,FUNCTION};
minimize cost: sum{i in REGION, j in FUNCTION} (DISTANCEM[i,j]*COST[i,j]*amount[i,j]);
s.t. con1{i in REGION}: (amount[i,'fooda']+amount[i,'foode']=AVAILM[i,'food']);
s.t. con2{i in REGION}: (amount[i,'machineryb']+amount[i,'machineryc']=AVAILM[i,'machinery']);
s.t. con3{i in REGION}: (amount[i,'c.d_c']+amount[i,'c.d_f']=AVAILM[i,'c.d']);
s.t. con4{i in REGION}: (amount[i,'c.nd_f']=AVAILM[i,'c.nd']);
s.t. con5: (sum{i in REGION} (2*amount[i,'fooda'])) <= (sum{i in REGION} amount[i,'foode']);


