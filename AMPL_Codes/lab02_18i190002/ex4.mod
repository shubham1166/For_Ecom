#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
set AMT;#defining the set of compositions.
set ITEMS;#defining the set of alloys.
var x{ITEMS}>=0;#the variables that define the amount(in quintals) that we take from in house stock.
var y{ITEMS}>=0;#the variables that define the amount(in quintals) that we purchase.
param MATRIX{AMT,ITEMS};#matrix defined in terms of resources as columns and composition as rows.
param HOUSE_STOCK{ITEMS};#parameter defined of in_house stock(quintals).
param HOUSE_COST{ITEMS};#parameter defined of in_house cost.
param PURCHASE_COST{ITEMS};#the parameter of the purchase cost of various alloys.
param MAXT{AMT};#the parameter defined that gives the values of maximum amount of in house stock we have.
#defining the objective function
minimize cost: sum{i in ITEMS} (HOUSE_COST[i] * x[i]) +sum{i in ITEMS} (PURCHASE_COST[i] * y[i]) ;
#subject to constraints:
s.t. con{i in AMT}: sum{j in ITEMS} MATRIX[i,j]*(x[j]+y[j])=MAXT[i];
s.t. con1{i in ITEMS}: x[i]<=HOUSE_STOCK[i];
s.t. con2: sum{j in ITEMS}(y[j]+x[j])=100;

