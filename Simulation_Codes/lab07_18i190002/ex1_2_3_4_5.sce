//NAME:shubham sharma
//ROLL NO.:18i190002
//Msc Phd OR
// part (i) inputting rho mu1 mu2 sig1 sig2
clear,clc
clf
rho = input('Enter the value of rho : ')
mu1 = input('Enter the value of mu1 : ')
mu2 = input('Enter the value of mu2 : ')
sig1=input('Enter the value of sig1 : ')
sig2=input('Enter the value of sig2 : ')
//part (ii) creating a vector by name 's' as per given in the question.
s=linspace(0,1,100);
disp(s,'vector holding 100 equally spaced values b/w 0 and 1')
//part (iii)
// Assuming that the given vectors are independent with mean mu1 and mu2 and variances sig1 and sig2.
// As both the RV are independent , value of corellation corelation coefficient is zero and thus we can easily find the value of sig3
mu3=s*mu1 + (1-s)*mu2;
disp(mu3,'The mean and varience of Z is : ')
// Let sig3 be the variance of Z:
sig3=((s.^2) * sig1) + (((1-s)^2)*sig2);  
//part (v) plotting of mean and variance of Z as a function of s
plot(s,mu3,'r',s,sig3,'b', xlabel('vector s'),xtitle('mu3(red curve) and sig3(blue curve) as functions of s'),ylabel('mu3 and sig3'))
//put // before every polt to get the other plots
//plot(s,mu3,'r', xlabel('vector s'),xtitle('curve b/w s and mu3'),ylabel('mu3'))
//plot(s,sig3,'blue', xlabel('vector s'),xtitle('curve b/w s and sig3'),ylabel('sig3'))
