#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
#defining variables
#variable 1:
var x11>=0,<=6;
#variable 2:
var x13>=0,<=6;
#variable 3:
var x15>=0,<=6;
#variable 4:
var x22>=0,<=6;
#variable 5:
var x24>=0,<=6;
#variable 6:
var x31>=0,<=4;
#variable 7:
var x32>=0,<=8;
#variable 8:
var x33>=0,<=4;
#variable 9:
var x35>=0,<=4;
#variable 10:
var x41>=0,<=5;
#variable 11:
var x42>=0,<=5;
#variable 12:
var x43>=0,<=5;
#variable 13:
var x45>=0,<=5;
#variable 14:
var x51>=0,<=3;
#variable 15:
var x53>=0,<=3;
#variable 16:
var x54>=0,<=8;
#variable 17:
var x64>=0,<=6;
#variable 18:
var x65>=0,<=2;
#defining objective function

minimize cost: 150*x11+150*x13+150*x15+152*x22+152*x24+148*x31+148*x32+148*x33+148*x35+146*x41+146*x42+146*x43+146*x45+166*x51+166*x53+166*x54+176*x64+176*x65;

#defining th constraints
#constraint one is:
s.t. con1:x11+x13+x15>=8;
#constraint two is:
s.t. con2:x22+x24>=8;
#constraint three is:
s.t. con3:x31+x32+x33+x35>=8;
#constraint four is:
s.t. con4:x41+x42+x43+x45>=8;
#constraint five is:
s.t. con5:x51+x53+x54>=7;
#constraint six is:
s.t. con6:x64+x65>=7;
#constraint seven is:
s.t. con7:x11+x31+x41+x51=14;
#constraint eight is:
s.t. con8:x22+x32+x42=14;
#constraint nine is:
s.t. con9:x13+x33+x43+x53=14;
#constraint ten is:
s.t. con10:x24+x54+x64=14;
#constraint eleven is:
s.t. con11:x15+x35+x45+x65=14;


