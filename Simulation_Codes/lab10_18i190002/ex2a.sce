clc,clear,clf
function twodrand(n)
    for i=1:n
        x(i)=rand()
        y(i)=rand()
    end
    scatter(x,y,xlabel('---x-->'),ylabel('---y --->'))
endfunction

subplot(2,2,1)
twodrand(100)
title('When n=100')

subplot(2,2,2)
twodrand(1000)
title('When n=1000')

subplot(2,2,3)
twodrand(1000000)
title('When n=1000000')

