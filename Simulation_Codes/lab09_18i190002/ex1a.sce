clc,clear
exec('milk.sce',-1)
printf('The Mean of the demand is %f\n',mean(demand))
printf('The Standard Deviation of the demand is %f\n',stdev(demand))
t=[1:500]';
clf
subplot(1,2,1)
plot(t,demand,xlabel('-----time(T)---->'),ylabel('----Demand at time T=t---->'),xtitle('Graph of time and Demand'))
subplot(1,2,2)
histplot(10,demand,xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of Demand'))
