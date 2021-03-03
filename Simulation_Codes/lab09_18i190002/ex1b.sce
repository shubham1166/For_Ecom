clc,clear
exec('milk.sce',-1)
to_be_sold=zeros(500,1)

//to_be_sold be the column vector that will tell us the amount of milk Akbar will decide to sell 
//we want to know the expected profit of akbar if he packs 1000L

for (i=1:500)
    to_be_sold(i)=to_be_sold(i)+1000
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

printf('The Mean of the profit is %f\n',mean(profit))

