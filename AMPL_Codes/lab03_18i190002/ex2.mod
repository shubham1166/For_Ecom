#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;
 #defining a parameter N
set month:= 0..N;
#this set will help us defing the months as we have done in the explanation in the report
param COSTDEC; 
#cost of decreasing production per unit
param COSTINC; 
#cost of increasing production per unit
param SALES{month}; 
# The sales forcast for month i (in units), i = 0-12
param MAXIMUM_INVENTORY; 
#maximum allowable inventory i.e 10000
var y{month} >= 0 , integer; #integers as units produced cannot be decimals
#the number of units produced during month TIME
var invent{month}, integer >= 0; #integer as the amount of invenntory cannot be in decimal
#the amount of inventory at the end of each month
var inc{month}, integer >= 0; #amount increased taken to be integer
#the amount of production increase in month ,i.e, in month i as compared to i-1
var dec{month} >= 0, integer; #amount decreased taken to be integer
#the amount of production decrease in month TIME, i.e.,in month i as compared to i-1
minimize cost: (sum{t in month}COSTINC * inc[t]) + (sum{t in month}COSTDEC * dec[t]);
s.t. con1{t in month: t != 0}: invent[t-1] + y[t] - invent[t] = SALES[t];    
#demand must be met each month
s.t. con2{t in month: t !=  0}: y[t] - y[t-1] = inc[t] - dec[t];     
#at least one of increase or decrease must be zero
s.t. con3{t in month: t==0}: invent[t] = 0;    
#setting the initial inventory
s.t. con4{t in month: t==0}: y[t]=4000;   
#setting the production rate for the preceeding June
s.t. con5{t in month}: invent[t] <= MAXIMUM_INVENTORY;   
#setting the maximum inventory