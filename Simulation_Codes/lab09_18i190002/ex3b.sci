function y=testexp(n)
    y=grand(10,1,'exp',1)
endfunction

clf
subplot(2,2,1)
histplot(5,testexp(10),xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of testrand(10)'))
subplot(2,2,2)
histplot(5,testexp(1000),xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of testrand(1000)'))
subplot(2,2,3)
histplot(5,testexp(100000),xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of testrand(100000)'))



