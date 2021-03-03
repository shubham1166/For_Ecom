clc,clear
function x=testrand(n)
    x=[]
    for i=1:n
        x=[x',[rand()]']'
    end
endfunction

clf
subplot(2,2,1)
histplot(5,testrand(10),xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of testrand(10)'))
subplot(2,2,2)
histplot(5,testrand(1000),xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of testrand(1000)'))
subplot(2,2,3)
histplot(5,testrand(100000),xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot of testrand(100000)'))



