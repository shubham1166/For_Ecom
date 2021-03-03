clear,clc,clf
//Y = grand(m, n, "exp", Av)

function Y=f(n,L1,L2)
    X1=grand(n,1,"exp",L1)
    X2=grand(n,1,"exp",L2)
    for i=1:n
        Y(i)=X1(i)+X2(i)
    end
    histplot(5,Y,xlabel('--Y-->'),ylabel('Frequency'))
endfunction

subplot(1,2,1)
f(100,1,1)
title('Histogram Plot when lambda1=1 and lambda2=1')

subplot(1,2,2)
f(100,1,2);
title('Histogram Plot when lambda1=1 and lambda2=2')
