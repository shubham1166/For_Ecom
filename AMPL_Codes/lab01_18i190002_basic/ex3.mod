#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
#defining variables
#variable 1:
var z1>=0;
#variable 2
var z2>=0;
#variable 3
var z3>=0;
#variable 4
var z4>=0;
#variable 5
var z5>=0;
#variable 6
var z6>=0;
#variable 7
var b0>=0; #it is non negative because the base price cannot be negetive
#variable 8
var b1;
#variable 9
var b2;

#defining the objective function
minimize residual: z1+z2+z3+z4+z5+z6;
#defining the constraints
#constraint number one:
s.t. con1:z1>=155000-b0-b1*12000-b2*350;
#constraint number two:
s.t. con2:z1>=-155000+b0+b1*12000+b2*350;
#constraint number three:
s.t. con3:z2>=120000-b0-b1*10000-b2*300;
#constraint number four:
s.t. con4:z2>=-120000+b0+b1*10000+b2*300;
#constraint number five:
s.t. con5:z3>=100000-b0-b1*9000-b2*100;
#constraint number six:
s.t. con6:z3>=-100000+b0+b1*9000+b2*100;
#constraint number seven:
s.t. con7:z4>=70000-b0-b1*8000-b2*200;
#constraint number eight:
s.t. con8:z4>=-70000+b0+b1*8000+b2*200;
#constraint number nine:
s.t. con9:z5>=60000-b0-b1*6000-b2*100;
#constraint number ten:
s.t. con10:z5>=-60000+b0+b1*6000+b2*100;
#constraint number eleven:
s.t. con11:z6>=100000-b0-b1*9000-b2*200;
#constraint number twelve:
s.t. con12:z6>=-100000+b0+b1*9000+b2*200;