#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N;#defining a a parameter N that will have the value N=5, for each location. 
set S:=1..N;#set S will have 5 ELEMENTS EACH CORRESPONDING TO CORNER 'i'as described in qustion 1 of the exercise.
set CORD;#Let S={1,2,3,4,5} (where each i denotes the corner I as per given in the question and 5 represents the center of the lake)
param LOCATION{S,CORD};#Let CORD={x,y}(that will help us defining the coordinate of every corner and the center of the lake)
param RADIUS;#this parameter will tell us the radius of the lake.
var xf;#x coordinate of the end point of the farm.
var yf;#y coordinate of the end point of the farm.
var xl;#x coordinate of the end point of the lake.
var yl;#y coordinate of the end point of the lake.

minimize dist:sqrt(((xl-xf)^2) + ((yl-yf)^2));
#(we are defining the equation of line in terms of parameters as if someone change the corners and want to see the changes in the optimal/
# point then we dont have to find the equation every time)
#(As we are given that  (xf,yf) must lie inside the farm, we will define four constrains such that these coordinates must lie in each line of the polyhedron)
s.t. con1:yf-LOCATION[1,'y']<=((LOCATION[1,'y']-LOCATION[2,'y'])/(LOCATION[1,'x']-LOCATION[2,'x']))*(xf-LOCATION[1,'x']);#i.e, y<=x
s.t. con2:yf-LOCATION[1,'y']<=((LOCATION[1,'y']-LOCATION[4,'y'])/(LOCATION[1,'x']-LOCATION[4,'x']))*(xf-LOCATION[1,'x']);
s.t. con3:yf-LOCATION[3,'y']>=((LOCATION[3,'y']-LOCATION[4,'y'])/(LOCATION[3,'x']-LOCATION[4,'x']))*(xf-LOCATION[3,'x']);
s.t. con4:yf-LOCATION[3,'y']>=((LOCATION[3,'y']-LOCATION[2,'y'])/(LOCATION[3,'x']-LOCATION[2,'x']))*(xf-LOCATION[3,'x']);
#constraint for circle:-
s.t. con5:(xl-LOCATION[5,'x'])^2 + (yl-LOCATION[5,'y'])^2 <= RADIUS^2;

