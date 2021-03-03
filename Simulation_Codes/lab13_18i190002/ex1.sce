//Shubham Sharma
//Msc PhD OR
//Roll no: 18i190002
clc
clear
function [i,k]=JobsDoneInOneArrival(lembda,mu,x)
    summ=0
    y=grand(1,1,"exp",1/lembda)
    k=y
    for i=0:x
        p= grand(1,1, "exp",1/mu)
        summ=summ+p
        if summ>=y then
            break
        end
    end 
endfunction

M = 10000;
X0 = 1;
lembda = 0.1;
mu = 0.15;
tau = zeros(1,M);
 
for j = 1:M
    Time = 0;
    X_p = X0;
    while (1)
        [J, A] = JobsDoneInOneArrival(lembda,mu,X_p);
        X_n = (X_p - J) + 1;
        if J == X_p
            tau(j) = Time + A;
            break
        end
        Time = Time + A;
        X_p = X_n;
    end
end

tau_mean = mean(tau);
disp(tau)
disp(tau_mean,'the mean of tau is : ')
