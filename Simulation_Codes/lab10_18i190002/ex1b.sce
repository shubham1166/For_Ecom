clc,clear
clf
function testrand2(k)
    exec('input1.sce',-1)
    //k is an integer
    y=[]
    for i=1:length(S)
        if modulo(i,k)==0
            y=[y',S(i)']'
        end
    end
    histplot(10,y,xlabel('--S with kth elements-->'),ylabel('Frequency Density'))
endfunction


subplot(1,2,1)
testrand2(2)
title('Histogram Plot when k=2')

subplot(1,2,2)
testrand2(3)
title('Histogram Plot when k=3')
