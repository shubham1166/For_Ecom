#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;#Defining a parameter N for the number of feeders.
param M;#defining a parameter M that we will give the value 3 that will tell us the cordinates x,y,z of diffrent facilities.
set S:=1..N;#defining a set S of N elements
set q:=1..M;# defining a set q of M elements
var a;# defining the x cordinate of the facility.
var b;# defining the y cordinate of the facility.
var c;# defining the z cordinate of the facility.
param QUANTITY{S};#This parameter will tell us the weightes of the various facilities/feeders.
param CORDINATE{S,q};#this parameter will tell us the cordinates of the diffrent facilities.
minimize dist: sum{i in S}QUANTITY[i]*sqrt((CORDINATE[i,1]-a)^2 + (CORDINATE[i,2]-b)^2 + (CORDINATE[i,3]-c)^2);#this is the objective value that is the summision of all the weighted distances from the facility to all the feeders.

