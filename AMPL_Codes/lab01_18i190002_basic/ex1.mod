#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
#introducing the variables
#defining the first variable
var x1>=0;
#defining the second variable
var x2>=0;
#defining the third variable
var x3>=0;
#defining the forth variable
var x4>=0;
#defining the fifth variable
var x5>=0;
#defining the sixth variable
var y>=0,<=10;

#introducing the objective function
maximize cost: 0.043*x1 + 0.027*x2 + 0.025*x3 + 0.022*x4 + 0.045*x5-0.0275*y;

#introducing the constraints
#constraint 1
s.t. con1:x1 + x2 + x3 + x4 + x5 - y <= 100;
#constraint 2
s.t. con2:x2 + x3 + x4 >= 40;
#constraint 3
s.t. con3:0.6*x1 + 0.6*x2 - 0.4*x3 - 0.4*x4 + 3.6*x5<=0;
#constraint 4
s.t. con4:4*x1 + 10*x2 - x3 -2*x4-3*x5<=0;




