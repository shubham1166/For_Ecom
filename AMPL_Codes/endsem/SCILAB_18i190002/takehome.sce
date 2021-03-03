//SHUBHAM SHARMA
//Roll no:18i190002
//Msc PhD OR
clc,clear
lambda=0.1
mu=0.2
N=30000
A=grand(N+1,1,"exp",1/lambda);
idle_time=zeros(N+1,1)
J=grand(1,1,"exp",1/mu)
i=1;
Y(1,1)=1; //Y(i,1) is the no of customers seen by the i th customer at his arriaval
CAT=A(1,1);   // cumulative arriaval time
CST=J(1,1); // cumulative service time
while i<=N

while CAT<=CST
    Y(i+1,1)=Y(i,1)+1;
    i=i+1;
    CAT=CAT+A(i,1)
end

while CAT>CST & Y(i,1)>0
    Y(i,1)=Y(i,1)-1;
    CST=CST+grand(1,1,"exp",1/mu)
end
if CAT>=CST & Y(i,1)==0
    idle_time(i,1)=CAT - CST;
    CST=CAT;
    CST=CST+grand(1,1,"exp",1/mu)
end 
end
disp("stationary expected number of customers "+string(mean(Y)))

disp("fraction of time server is busy  "+string(1-sum(idle_time)/CAT))
