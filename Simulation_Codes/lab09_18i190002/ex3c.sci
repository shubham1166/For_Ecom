clc,clear
function [y,p]=testexp(n)
    y=[]
    //counter=0
    c1=0
    i=0
    while i<=n
        z=grand(1,1,'exp',1)
        //counter=counter+1
        i=i+1
        if z>=0.5 then
            z=z-0.5
            y=[y',z']'
        end
    end
    p=(n-length(y))/n
endfunction
clf
[y,p]=testexp(50000);
printf('The fraction of values discarded is %f\n',p)
histplot(100,y,xlabel('-----values---->'),ylabel('--Frequency density---->'),xtitle('histogram plot '))
