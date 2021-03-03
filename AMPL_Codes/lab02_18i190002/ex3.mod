#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
set CANDS; #defining a set CANDS
set DAYS;#defining a set DAYS
param WAGE_RATE{CANDS};#defining a set WAGE_RATE
param AVAIL_HOURS{CANDS,DAYS};#defining a parameter AVAIL_HOURS
param DAYS_HOURS;#defining a parameter CANDS
param WORK_HOUR{CANDS};#defining a parameter WORK_HOUR 
var hours{CANDS,DAYS} >=0;#defining the variables hours
#defining the optimisation function:
minimize cost:sum{c in CANDS,d in DAYS}WAGE_RATE[c]*hours[c,d];
#subject the constraints:
s.t. con1{i in DAYS}:sum{j in CANDS} hours[j,i] = DAYS_HOURS;
s.t. con2{i in CANDS}:sum{j in DAYS} hours[i,j] >= WORK_HOUR[i]; 
s.t. con3{i in CANDS,j in DAYS}: hours[i,j] <= AVAIL_HOURS[i,j];
