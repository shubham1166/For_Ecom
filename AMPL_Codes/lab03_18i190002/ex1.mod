#NAME: SHUBHAM SHARMA
#ROLL NO: 18i190002
#COURSE: MSC PHD OR
#In the given question:
#. Food is being produced by two regions- A and E. So every region will have two choices for food.
#.Machines are manufactured at two regions-B and C. So every region will have two choices for machinery.
#.Consumer durables are manufactured at two places C and F. So every region will have two choices for Consumer durables.
#.Consumer non durables are manufactured at F only. So every region will have only one choice for consumer non durables.

#defining the set that has diffrent regions, eg-A,B,C...etc
set REGION;
#defining the function that has diffrent elements like fooda , machineryb...etc , then fooda will tell the amount(in tons) of food taken from a.   
set FUNCTION;
#defining the function that will tell us the resorces that we want such as food, machinery...etc
set FUNCTION2;
#defining a matrix AVAILM of the reqirements that each of these regions want
param AVAILM{REGION,FUNCTION2};
#Where,xi,Fooda  is the amount(in tons) of food region ‘i’ has got from A for all i € {A,B,C,D,E} and xi,Foode  is the amount(in tons) of food region ‘i’ has got from E for all i € {A,B,C,D,E}, and xi,Machineryb  is the amount(in tons) of Machinery region ‘i’ has got from B for all i € {A,B,C,D,E} and xi,Machineryc  is the amount(in tons) of Machinery region ‘i’ has got from C for all i € {A,B,C,D,E} and xi,c.d_c is the amount(in tons) of Consumer durables region ‘i’ has got from C for all i € {A,B,C,D,E} and xi,c.d_f is the amount(in tons) of Consumer durables region ‘i’ has got from F for all i € {A,B,C,D,E} and xi,c.nd_f is the amount(in tons) of Consumer non durables region ‘i’ has got from F for all i € {A,B,C,D,E}
#as these variables are in tons so they cannot be negetive
var amount{REGION,FUNCTION}>=0;
#Where dij = distance travelled when when region i is taking something from other region , where i € REGION and j € FUNCTION . Eg , dE,machineryb is the distance(km) when E is taking machiner from B.
param DISTANCEM{REGION,FUNCTION};
#Where cij = cost/ton/km when when region i is taking something from other region , where i € REGION and j € FUNCTION
param COST{REGION,FUNCTION};
#Now, with the help of these matrices , we can define our objective function , as my multiplying each term cij of matrix COSTM to the each term dij of matrix DISTANCEM, we will get the cost/ton for each movement between the regions.
#defining the objective function
minimize cost: sum{i in REGION, j in FUNCTION} (DISTANCEM[i,j]*COST[i,j]*amount[i,j]);
#we are defining six constrains on food to fulfill the requirement of every region of food using the matrix and notations defined above.
s.t. con1{i in REGION}: (amount[i,'fooda']+amount[i,'foode']=AVAILM[i,'food']);
#Now we are defining six constrains on machinery to fulfil  the requirement of every region of machinery using the matrix and notations defined above
s.t. con2{i in REGION}: (amount[i,'machineryb']+amount[i,'machineryc']=AVAILM[i,'machinery']);
#Now we are defining six constrains on consumer durables to fulfill the requirement of every region of consumer durables using the matrix and notations defined above
s.t. con3{i in REGION}: (amount[i,'c.d_c']+amount[i,'c.d_f']=AVAILM[i,'c.d']);
#Now we are defining six constrains on consumer non durables to fulfill the requirement of every region of consumer non durables using the matrix and notations defined above
s.t. con4{i in REGION}: (amount[i,'c.nd_f']=AVAILM[i,'c.nd']);
#As thefood production in sector A is restricted to half that of sector E.
s.t. con5: (sum{i in REGION} (2*amount[i,'fooda'])) <= (sum{i in REGION} amount[i,'foode']);


