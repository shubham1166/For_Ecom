//Shubham Sharma
//Msc PhD OR
//Roll no: 18i190002
clc
clear
function counter=JobsDoneInOneArrival(lambda,meu,x)
    x1(1)=grand(1, 1, "exp", 1/meu)
    //first guy took x1(1) times to go
    for i=2:x
        x1(i)=x1(i-1)+grand(1, 1, "exp", 1/meu)
        //The other people took time taken by the previous one + exponential time as per told in the question
    end
    y=grand(1, 1, "exp", 1/lambda)
    //disp(y)
    counter=0
    for i=1:x
        if x1(i)<=y
            counter=counter+1
            //finding the number of people left before 101th guy
        end
    end
    //disp(x1)
    counter
endfunction

x0=100
c1=JobsDoneInOneArrival(1,10,x0)
c2=x0-c1+1
x(1)=c2
for i=1:(10000-1)
    c1=JobsDoneInOneArrival(1,10,c2)
    J(i)=c1
    c2=c2-c1+1
    x(i+1)=c2
end
J(10000)=JobsDoneInOneArrival(1,10,x(10000))

//subplot(1,2,1)
//t=1:10000
//plot(t',x,xlabel('Jobs remaining to serve'),ylabel('Frequency density'))
printf('Part (1) When lambda=1 and meu=10 mean of x is %f \n',mean(x))
//disp(x)

//subplot(1,2,2)
//plot(t',J,xlabel('Jobs served'),ylabel('Frequency density'))
printf('Part (2) When lambda=1 and meu=10 mean of J is %f \n',mean(J))


