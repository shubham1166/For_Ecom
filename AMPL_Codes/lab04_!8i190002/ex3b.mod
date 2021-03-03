#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;
set S:= 0..N;
param V{S};#it will define the variable cost of each month.
param D{S};#it will define the demand for each month from month 0-12.
var i{S}>=0;#it will define the inventory of each month from month 0-12.
var y{S}>=0,<=1, integer;# i.e., y can have only two values 0 or 1
param FIXED_COST;
param INVENTORY_COST;
param MAX_PRODUCTION;
var x{S}>=0;#production of wire in each moth in length

minimize cost:sum{j in S}((V[j]*x[j])+(INVENTORY_COST*i[j])+(FIXED_COST*y[j]));
s.t. con1{j in S:j==12}:i[j]=0;#inventory of month 12 is 0
s.t. con2: i[0]=0;#constraint on initial inventory
s.t. con3{j in S: j!=0}:x[j]+i[j-1]=D[j]+i[j];#demand should be fulfilled
s.t. con4{j in S}:x[j]<=MAX_PRODUCTION;#constraint on maximum production
s.t. con5{j in S:j==0}:x[j]=0;
s.t. con6{j in S}:y[j]>=x[j]/10000000;#this constraint will help in giving values to each y