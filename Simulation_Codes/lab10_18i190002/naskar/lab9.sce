function Bindu1(dem,stock)
    disp(mean(dem))
    disp(stdev(dem))
    figure
    histplot(50,dem)
    profit=[]
    for i=1:length(dem)
        if stock<dem(i)
            profit(i) = 38*stock-32*stock
        elseif stock == dem(i)
            profit(i) = 38*dem(i)-32*stock
        else
            profit(i) = 38*dem(i)-32*stock+30*(stock-dem(i))
        end
    end
    disp(mean(profit))
    disp(stdev(profit))
    figure
    histplot(10,profit)
    figure
    plot(dem)
endfunction


