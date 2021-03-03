param N;
#Denotes the no of types

set S:= 1..N;
param LOT{S};
param STORIES{S};
param BEDROOMS{S};
param PROFIT{S};
param TOTAL_LAND;
param ONE_STOREY;
param BED;
#Defining the decision variables:-
var x{S}>=0;

#Defining the objective function to maximize the profit.
maximize profit: sum{i in S}(PROFIT[i]*x[i]);

#Only 20 acres is available
s.t. con1:sum{i in S}LOT[i]*x[i]<=TOTAL_LAND;

#Atleast 40 are to be one story homes
#As x[1] and x[2] only have one story
s.t. con2:x[1]+x[2]>=ONE_STOREY;

#Atleast 50 need to have 3 or more bedrooms
s.t. con3:sum{i in S:i!=1}x[i]>=BED;

#There are to be 10 of each home type
s.t. con{i in S}:x[i]>=10;

