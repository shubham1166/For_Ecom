function Bindu(dem)
    stock = 950:10:1100
    profit=[]
    for j=1:length(stock)
        for i=1:length(dem)
            if stock<dem(i)
                profit(j) = 38*stock(j)-32*stock(j)
            elseif stock == dem(i)
                profit(j) = 38*dem(i)-32*stock(j)
            else
                profit(j) = 38*dem(i)-32*stock(j)+30*(stock(j)-dem(i))
            end
        end
        avg(j)=mean(profit)
    end
    plot(avg)
endfunction
