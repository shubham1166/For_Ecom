//NAME: Shubham Sharma
//ROLL NO: 18i190002
//COURSE: Msc PhD OR
clc,clear
exec('demand.sce',-1);
exec('supply.sce',-1);
//I1 will tell us the inventory or amount of milk that left at the end of that day and she will sell it on the very next day
I1=[];
//I2 will tell us the amount of milk that will be left at the end of the very next day and she will have to sell it at Rs23/Litre
I2=zeros(729,1);
//We will create a variable dem2 that will tell us the demand of that day that has to be satisfied only by the supply of that day
dem2=dem;
for (i=1:length(dem2)-1)
    if (supp(i)>=dem2(i)) then
        a=supp(i)-dem2(i)
    else
        a=0
    end
    I1=[I1',[a]']'
    //we are defining the dem2 function that will subtract the inventory of the first day that is is basically selling the milk from the previous day to fulfill the demand of the customers
    if (i~=730) then
        x=dem2(i+1)-I1(i)
        if (x>=0) then
            //it means that if x is positive then the milk from the last is sold first and demand for satisfying supply of that day will be found
            dem2(i+1)=x
        else
            I2(i)=-x
            dem2(i+1)=0
        end
    end
end

//The profit function is defined in such a way that it will include first try to sell the milk from last day 
profit2=[]
for i=1:length(dem)
    if (i==730)
        if dem2(i)>=supp(i)
            x=35*supp(i)-30*supp(i)+35*I1(729)+23*I2(729)
        else 
            x=(35*dem2(i)) + (23*(supp(i)-dem2(i))) - (30*supp(i))+35*I1(729)+23*I2(729)
        end
    elseif i==1 then
        //Will calculate the profit on the very first day
        if dem2(i)>=supp(i)
            x=35*supp(i)-30*supp(i)
        else 
            x=(35*dem2(i)) - (30*supp(i))
        end
    else
        if dem2(i)>=supp(i) then
            //Will calculate the profit till day-729
            x=35*supp(i)+35*I1(i-1)+23*I2(i-1)-30*supp(i)
        else
            x=(35*dem2(i)) + 35*I1(i-1)+23*I2(i-1) - (30*supp(i))
        end
    end
    profit2=[profit2',x']'
end
printf('The maximum value of profit is : %d\n',max(profit2))
printf('The minimum value of profit is : %d\n',min(profit2))
printf('The mean of profit is : %d\n',mean(profit2))
printf('The standard deviation of profit is : %d\n',max(profit2))

