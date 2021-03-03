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
s=linspace(0,1,100);
// As both the RV are independent , value of corellation corelation coefficient is zero and thus we can easily find the value of sig3
mu3=s*mu1 + (1-s)*mu2;
// Let sig3 be the variance of Z:
sig3=((s.^2) * sig1) + (((1-s).^2)*sig2); 
plot(mu3,sig3,'blue',xlabel('mean-mu3'),ylabel('Variance-sig3'),xtitle('graph b/w mu3 and sig3'))

