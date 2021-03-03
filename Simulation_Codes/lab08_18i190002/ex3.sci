//NAME: Shubham Sharma
//ROLL NO: 18i190002
//COURSE: Msc PhD OR
clc,clear
exec('demand.sce',-1);
exec('supply.sce',-1);
profit=[]
for (i=1:length(dem))
    if (dem(i)>=supp(i)) then
        x=(35*supp(i)) - (30*supp(i))
        profit=[profit',x']'
    else
        x=(35*dem(i)) + (23*(supp(i)-dem(i))) - (30*supp(i))
        profit=[profit',x']'
    end
end
disp(min(profit),'the minimum value among profit is :')
disp(max(profit),'the maximum value among profit is :')
disp(mean(profit),'The mean of the data is : ')
disp(stdev(profit),'the standard Deviation of the given data is : ')
