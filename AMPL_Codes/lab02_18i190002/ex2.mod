#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
param N; #defining the parameter
set S := 1..N; #defining set S having n values 
param SPRICE{S}; #parameter SPRICE tells the SELLING PRICE of diffrent warehouses
param LSIZE{S};#parameter LSIZE tells the LOT SIZE(in sq. ft.) of diffrent warehouses
param ELEV{S};#parameter ELEV tells the ELEVATION(in feet) of diffrent warehouses
#defining the variables.
var x{S};
var b0>=0; #it is non negative because the base price cannot be negetive
var b1;
var b2;
#defining the objective function.
minimize residual: sum{i in S} x[i];
#defining the constraints:
s.t. con1{i in S}: x[i] >= SPRICE[i] - b0 - b1*LSIZE[i] - b2*ELEV[i];
s.t. con2{i in S}: x[i] >= -SPRICE[i] + b0 + b1*LSIZE[i] + b2*ELEV[i];


