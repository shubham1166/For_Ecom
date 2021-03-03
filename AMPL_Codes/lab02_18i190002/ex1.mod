#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N; #assigning a parameter N.
param b; #assigning a parameter b.
set S := 1..N; #defining a set S that has value from 1 to N where N is a natural number.
param c{S};#defining a parameter c that in which we can assign n values.
param lb{S};#defining a parameter lb that in which we can assign n values.
param ub{S};#defining a parameter ub that in which we can assign n values.

var x{S}; #defining n variables

minimize cost: sum{i in S} c[i]*x[i]; #defining the objective function.
#defining the constraints:
s.t. con1: sum{i in S} x[i] <= b; 
s.t. lbcon{i in S}: x[i] <= ub[i];
s.t. ubcon{i in S}: x[i]>= lb [i];
