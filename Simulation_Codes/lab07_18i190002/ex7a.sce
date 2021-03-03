//NAME:shubham sharma
//ROLL NO.:18i190002
//Msc Phd OR
//pat(vii)
clear,clc
rho = input('Enter the value of rho : ')
mu1 = input('Enter the value of mu1 : ')
mu2 = input('Enter the value of mu2 : ')
sig1 = input('Enter the value of sig1 : ')
sig2 = input('Enter the value of sig2 : ')
s=linspace(0,1,100);
disp(s,'vector holding 100 equally spaced values b/w 0 and 1')
mu3=s*mu1 + (1-s)*mu2;
sig3=((s.^2) * sig1) + (((1-s).^2)*sig2);  
subplot(1,3,1)
plot(s,mu3,xlabel('s'),ylabel('mu3'),xtitle('The graph b/w s and mu3'))
subplot(1,3,2)
plot(s,sig3,style=5,xlabel('s'),ylabel('mu3'),xtitle('The graph b/w s and sig3'))
subplot(1,3,3)
plot(mu3,sig3,style=2,xlabel('mu3'),ylabel('sig3'),xtitle('The graph b/w mu3 and sig3'))

