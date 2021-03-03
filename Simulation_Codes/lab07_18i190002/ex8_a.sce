//NAME:shubham sharma
//ROLL NO.:18i190002
//Msc Phd OR
clear,clc
clf
rho = input('Enter the value of rho : ')
mu1 = input('Enter the value of mu1 : ')
mu2 = input('Enter the value of mu2 : ')
sig1=input('Enter the value of sig1 : ')
sig2=input('Enter the value of sig2 : ')
s=linspace(0,1,100);
//Now , when the given R.V are not independent , then we have to use the correlation coefficient b/w two given R.V.
sig3=((s.^2) * sig1) + (((1-s)^2)*sig2) + 2*s.*(1-s)*rho*sqrt(sig1*sig2);
mu3=s*mu1 + (1-s)*mu2;
// plotting mean of z with respect to the s.
plot(s,mu3,'r',xlabel('s'),ylabel('mu3'),xtitle('Graph b/w s and mu3'))

 
