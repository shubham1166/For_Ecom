clc,clear
function [numCust,Completed,numArrival] = JobsDone(lambda,u,x,arrivals,L)
Queue = x-1;
//Currently there are x-1 persons in the que other thwn the last person
totalTime = 0
//In the begining the total arrival time is 0
Completed = 0
//Jobs completed till now are zero , i.e there are zero departures
arrivalsTotal = 0
//There is no person arrived yet so the it is zero in the begining
numCust = []
//The number of customers present in the very starting
busyPeriod = []
totalPeriod = []
while arrivalsTotal < arrivals
//We want to run for very large number arrivals 
Queue = Queue + 1
nextTime = grand(1,1,'exp',1/lambda)
//Checking for the arrival time of the next person
timeArrivalT = nextTime
arrivalsTotal = arrivalsTotal + 1
serviceTimtT = 0
totalTime = nextTime + totalTime
c=1
while c==1
if numCust>L
    serviceTime = grand(1,1,'exp',1/2*u)
else
    serviceTime = grand(1,1,'exp',1/u)
end
serviceTimtT = serviceTimtT + serviceTime
if Queue ~= 0 then
//First working when the currenque is not zero
if serviceTimtT < timeArrivalT then
//Acc to the question if the service time is less then that of the arrival time There is one departure
Completed = Completed + 1
//Then the jobs completed is job completed + 1
Queue = Queue - 1
//And Xn=Xn - 1 as per the question
if Queue == 0 then
numCust = [numCust; timeArrivalT Queue]
//now the cuurent que has zero members in it
idleTime = timeArrivalT - serviceTimtT
//idle time is time of arrival - service time
busyTime = serviceTimtT
//buzy period is the service time
busyPeriod = [busyPeriod; serviceTimtT]
totalPeriod = [totalPeriod; timeArrivalT]
break
end
else
numCust = [numCust; timeArrivalT Queue]
loopNum = 0
while serviceTimtT > timeArrivalT
loopNum = loopNum + 1
if arrivalsTotal > arrivals then
break
end
if loopNum > 1 then
numCust = [numCust; timeArrivalT Queue]
end
nextTime = grand(1,1,'exp',1/lambda)
//The next arrival time is exp (1/lambda)
arrivalsTotal = arrivalsTotal + 1
//Total arrivals will be +1
Queue = Queue + 1
//The queue will increase by 1
timeArrivalT = timeArrivalT + nextTime
//The time of the arrival is the sum of the arrival of the last person + this person
totalTime = totalTime + nextTime
if serviceTimtT < timeArrivalT then
//As we did above if the service time is less then the arrival of the next person 
//Then one person will be less in the queue
Queue = Queue - 1
//and the job completed will be 1 as per the idea in the question
Completed = Completed + 1
end
end
end
else
numCust = [numCust; timeArrivalT Queue]
break
end
if arrivalsTotal > arrivals then
break
end
end
end
numCust = numCust
numArrival = arrivalsTotal+x
end
numCust = []
[numCust jobs arr]= JobsDone(0.1,2,1,20000,2)
disp(strcat(["Stationary expected number of customers in an MM1 when L is 2 is:  ",string(mean(numCust(:,2)))]))
numCust = []
[numCust jobs arr]= JobsDone(0.1,2,1,20000,20)
disp(strcat(["Stationary expected number of customers in an MM1 when L is 20 is:  ",string(mean(numCust(:,2)))]))
