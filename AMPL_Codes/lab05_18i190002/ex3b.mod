#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;#the parameter that will tell us the no of coins.
set I=1..N;#the set I if the no of coins.
set S;#As every line has an equation of the form Ax+By+C=0, this set has those A , B< C that will help us /
#/ defining the equation of lines and distance of those lines from the diffrent points.
set LINES;#this is the set of three diffrent lines of the triangle.
param VALUE{LINES,S};#This parameter is the values of A,B,C for diffrent lines.
var x{I};#variable of the x coordinates of the coins
var y{I};#variable of the y coordinates of the coins
param radius;# this parameter is the radius of the coin that is 0.67
s.t. con1{i in I,j in I:i!=j}:sqrt(((x[i]-x[j])^2)+((y[i]-y[j])^2))>=2*radius;#Here the constraints means that distance between the centres /
#/of any two coins is greater than or equal to twice the radius.
#The linear constraints to force each coin to lie inside the triangular box are :-
#(For this to happen the distance of each points from these lines should be greater than or equal to radius)
s.t. con2{i in I}:x[i]>=radius;
s.t. con3{i in I}:y[i]>=radius;
s.t. con4{i in I}:x[i]+y[i]<=5-radius*sqrt(2);
