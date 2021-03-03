#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
var x1;
var x2;
minimize objective:(x1/(3.0+sin(x1))) + (x2/(3.0+cos(x2)));
s.t. con:(((x1-20)^2) + ((x2-20)^2) - 2) * (((x1+20)^2) + ((x2+20)^2) - 5)<=0;
