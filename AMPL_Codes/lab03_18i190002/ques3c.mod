#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
#Defining two sets that will help us in formation of the lpp
set MACHINE;
set ITEMS;
var x{MACHINE,ITEMS}>=0;#Then xij represents the amount in units item j made by machine corresponding to i.
param theta;
param TM{MACHINE,ITEMS};
param COSTM{MACHINE,ITEMS};#Where cij is the cost/unit machine i is taking while making j
param MATM{MACHINE,ITEMS};#Where mij is the material consumed /unit by machine i while making item j
param CAPACITYM{MACHINE,ITEMS};#Where aij is the capacity consumed /unit by machine i on item j.
param POLLUTIONM{MACHINE,ITEMS};#Where, pij is the pollution/unit by machine i while making item j.
minimize qum:sum{i in MACHINE,j in ITEMS} (x[i,j]*COSTM[i,j])  + sum{i in MACHINE,j in ITEMS} (x[i,j]*TM[i,j]) ;
s.t. con1: sum{i in MACHINE,j in ITEMS} (x[i,j]*MATM[i,j])<=900;#As the total amount of raw-material available for production is 900 units
s.t. con2{i in MACHINE}:sum{j in ITEMS} (x[i,j]*CAPACITYM[i,j])<=5000;#As the total capacity of each machine is also limited to 5000 units
s.t. con3: sum{i in MACHINE,j in ITEMS} (x[i,j]*POLLUTIONM[i,j])<=3000;#As the division must control the total pollutionlevel to 3000 units
s.t. con4{j in ITEMS}: sum{i in MACHINE} x[i,j]=100;#As the requirements is 100 units of each tool
