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
// Assuming that the given vectors are independent with mean mu1 and mu2 and variances sig1 and sig2.
// As both the RV are independent , value of corellation corelation coefficient is zero and thus we can easily find the value of sig3
mu3=s*mu1 + (1-s)*mu2;
//disp(mu3,'The mean and varience of Z is : ')
// Let sig3 be the variance of Z:
sig3=((s.^2) * sig1) + (((1-s)^2)*sig2);  
//part (v) plotting of mean and variance of Z

//plot(s,mu3,'red',s,sig3,'blue')
//Plotting Mean vs Variance : 
//plot(mu3,sig3)
//Plotting through subplot
//To do later
//Now , when the given R.V are not independent , then we have to use the correlation coefficient b/w two given R.V.
sig3=((s.^2) * sig1) + (((1-s)^2)*sig2) + 2*s.*(1-s)*rho*sqrt(sig1*sig2);
// plotting varience of z with respect to the s.
//plot(s,sig3)
//Now plotting both mean and varience of Z with respect to vector s.
//plot(s,mu3,'r',s,sig3,'b')
//Now plotting graph of Mean vs Varience.
plot(mu3,sig3)
//part(x) 
 

