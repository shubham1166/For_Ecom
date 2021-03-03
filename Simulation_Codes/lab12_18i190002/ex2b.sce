//Shubham Sharma
//Msc PhD OR
//Roll no: 18i190002
clc
clear
function i=JobsDoneInOneArrival(lembda,mu,x)
    summ=0
    y=grand(1,1,"exp",1/lembda)
    for i=0:x
        p= grand(1,1, "exp",1/mu)
        summ=summ+p
        if summ>=y then
            break
        end
    end 
endfunction

x0=10
c1=JobsDoneInOneArrival(1,0.1,x0)
c2=x0-c1+1
x(1)=c2
for i=1:(10000-1)
    c1=JobsDoneInOneArrival(1,0.1,c2)
    J(i)=c1
    c2=c2-c1+1
    x(i+1)=c2
end
J(10000)=JobsDoneInOneArrival(1,0.1,x(10000))
clf
subplot(1,2,1)
t=1:10000
histplot(15,x,xlabel('Jobs remaining to serve'),ylabel('Frequency density'))
printf('Part (1) When lambda=1 and meu=10 mean of x is %f \n',mean(x))
//disp(x)

subplot(1,2,2)
histplot(15,J,xlabel('Jobs served'),ylabel('Frequency density'))
printf('Part (2) When lambda=1 and meu=10 mean of J is %f \n',mean(J))


