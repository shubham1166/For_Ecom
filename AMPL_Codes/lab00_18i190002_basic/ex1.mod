# The variables are as follows:
var x1;
var x2;
var y1 <= 1000;
# Declaring the objective function:
minimize cost: 3*x1 + 4*x2 + 5*y1;
# The first constraint is:
s.t. con1: 6*x1 + 8*x2 + 10*y1 >= 200;
# And the second constraint is:
s.t. con2: 6*x2 + 5*y1 <= 8;

