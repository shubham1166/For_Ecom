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

clf

for i=1:1000
    z1(i)=JobsDoneInOneArrival(1,0.1,100)
end
printf('Part (a) When lambda=1 and meu=0.1 mean is %f \n',mean(z1))

subplot(1,2,1)
histplot(15,z1,xlabel('No. of Jobs'),ylabel('Frequency Density'),title('PART (a) Histogram plot when lambda=1 and meu=0.1'))

for i=1:1000
    z2(i)=JobsDoneInOneArrival(1,30,100)
end
subplot(1,2,2)
histplot(15,z2,xlabel('No. of Jobs'),ylabel('Frequency Density'),title('PART (b) Histogram plot when lambda=1 and meu=30'))
printf('part (b),When lambda=1 and meu=30 mean is %f \n',mean(z2) )
