#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;#defining a parameter N 
set S:=1..N;#defining a set having n elements
var x{S}>=0, integer; #the following variable denotes the no of units of aircrafts of each type
param CAPACITY{S}; #it denote the carrying capacity of each aircraft that we have to maximize
param MAX_BUDGET;#it denote the maximum budget
param COST{S};#it denote the cost of each aircraft
param MAX_PS;#it denote the maximum parking space
param SPACE_REQUIREMENT{S};#it denote the space requirement for each type of aircraft

#defining the objective function
maximize cap: sum{i in S}(x[i]*CAPACITY[i]);#it defines our objective function value as the objective is to maximize the capacity
#defining the constraint
s.t. cont1:sum{i in S}(x[i]*COST[i])<=MAX_BUDGET;#the constraint on the total amount we have
s.t. con2:sum{i in S}(x[i]*SPACE_REQUIREMENT[i])<=MAX_PS;#the constraint on the space every aircraft is occupying
