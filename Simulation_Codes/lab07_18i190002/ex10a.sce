//NAME:shubham sharma
//ROLL NO.:18i190002
//Msc Phd OR
clear,clc
clf
rho =0
mu1 = 1
mu2 = 2
sig1=0.1
sig2=1
s=linspace(0,1,100);
//Now , when the given R.V are not independent , then we have to use the correlation coefficient b/w two given R.V.
sig3=((s.^2) * sig1) + (((1-s)^2)*sig2) + 2*s.*(1-s)*rho*sqrt(sig1*sig2);
mu3=s*mu1 + (1-s)*mu2;
//
//We have to make subplots
subplot(1,3,1)
// plotting mean of z with respect to the s.
plot(s,mu3,'r',xlabel('s'),ylabel('mu3'),xtitle('Graph b/w s and mu3'))
subplot(1,3,2)
// plotting varience of z with respect to the s.
plot(s,sig3,'r',xlabel('s'),ylabel('sig3'),xtitle('Graph b/w s and sig3'))
subplot(1,3,3)
//Now plotting graph of Mean vs Varience.
plot(mu3,sig3,'blue',xlabel('mean-mu3'),ylabel('Variance-sig3'),xtitle('graph b/w mu3 and sig3'))
