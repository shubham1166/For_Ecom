//NAME: Shubham Sharma
//ROLL NO: 18i190002
//COURSE: Msc PhD OR
clear,clc
//We will make rthe use of rand() to compute the uniform distribution of 0 and 1 that is an inbuild function.
dem3=[]
supp3=[]
//Formation of column vectors of random entries between 20 and 40
for (i=1:2000)
    r=20*rand() + 20
    y=20*rand() + 20
    dem3=[dem3',r']'
    supp3=[supp3',y']'
end
//making a vector of averages of revenue
revenue_avg=[]
for (i=1:length(dem3))
    if i==1 then
        if (dem3(i)>=supp3(i)) then
            y=(35*supp3(i))
            revenue_avg=[revenue_avg',y']'
        else
            y=(35*dem3(i)) + (23*(supp3(i)-dem3(i)))
            revenue_avg=[revenue_avg',y']'
        end
    else
        if (dem3(i)>=supp3(i)) then
            y=(35*supp3(i))
        else
            y=(35*dem3(i)) + (23*(supp3(i)-dem3(i)))
        end
        y=((i-1)*revenue_avg(i-1)+y)/i
        revenue_avg=[revenue_avg',y']'
    end
end

clf
for i=1:40
    printf('Day = %d    Average = %d\n',50*i,revenue_avg(50*i))
end

a=50:50:2000;
clf
plot(a,revenue_avg(a),xlabel('----Days---->'),ylabel('----Average---->'),title('The graph of average and days.'))
