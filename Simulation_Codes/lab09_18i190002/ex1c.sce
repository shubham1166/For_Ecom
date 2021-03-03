//Defining a function that will give the profit vector when the stock is n units for 500 days
clc,clear
exec('milk.sce',-1)

function profit=f(n)
    to_be_sold=zeros(500,1)
    //to_be_sold be the column vector that will tell us the amount of milk Akbar will decide to sell 
    //we want to know the expected profit of akbar if he packs 1000L

    for (i=1:500)
        to_be_sold(i)=to_be_sold(i)+n
    end

    profit=[]
    //Will tell the profit of each day in Rupees

    for i=1:500
        if demand(i)>=to_be_sold(i)
            x=38*to_be_sold(i)-32*to_be_sold(i)
        else
            x=38*demand(i)+30*(to_be_sold(i)-demand(i))-32*to_be_sold(i)
        end
        profit=[profit',x']'
    end
endfunction
avg=[]
for i=950:10:1100
    avg=[avg',[mean(f(i))]']'
end
clf
x=(950:10:1100)';
subplot(2,1,1)
plot(x,avg,'.r',xlabel('-----Stock Quantity---->'),ylabel('---Average Profit--->'),xtitle('Dotted Plot b/w Quantity and Profit'))

subplot(2,1,2)
plot(x,avg,'blue',xlabel('-----Stock Quantity---->'),ylabel('---Average Profit--->'),xtitle('Plot b/w Quantity and Profit'))

for i=1:16
    printf('Quantity:%d              Average Profit:%f\n',940+10*i,avg(i))
end
