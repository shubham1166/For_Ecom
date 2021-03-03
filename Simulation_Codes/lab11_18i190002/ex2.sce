//Shubham sharma
//18i190002
//Msc PhD OR
clc,clear

function x=myfunction(T,L,n)
    function Z1=myfunction2(T,L)
        s=0
        flag=1
        i=0
        while flag==1
            X = grand(1, 1, "exp", L)
            s=s+X
            i=i+1
            if s>=T
                flag=0
            end
        end
        Z1=i
    endfunction
    
    for i=1:n
        x(i)=myfunction2(T,L) 
    end

endfunction

x=myfunction(25,1,20000)

disp(mean(x),'Mean is')
disp(variance(x),'Variance is ')

clf
histplot(10,x,xlabel('--values of Zk-->'),ylabel('--Frequency density-->'),title('Histogram plot when T=25, lambda=1 and n=20000'))



