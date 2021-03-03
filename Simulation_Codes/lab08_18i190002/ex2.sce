//NAME: Shubham Sharma
//ROLL NO: 18i190002
//COURSE: Msc PhD OR
clear,clc
//Defining function 'k' that will tell us the size of the given column vector
function z=k(x)
    [z m]=size(x)
endfunction

//Defining a function that will tell us the minimum of all elements in our column vector
function counter3=minimum(x)
    counter3=x(1)
    for (i=1:k(x))
        if(x(i)<counter3) then
            counter3=x(i)
        end
    end
endfunction

//Defining a function that will tell us the maximum of all elements in our column vector
function counter2=maximum(x)
    counter2=x(1)
    for (i=1:k(x))
        if(x(i)>counter2) then
            counter2=x(i)
        end
    end
endfunction

//Defining a function that will tell us the number of times certain number is coming in teh given vector 'a'
function time=times(a)
    time=0
    for(i=1:k(x))
        if(x(i)==a) then
            time=time+1
        end
    end
endfunction

//Defining a function 'average' that will tell us the average of all elements of column vector a 'a'
function avg=average(x)
    avg=0
    for(i=1:k(x))
        avg=avg+x(i)
    end
    avg=avg/k(x)
endfunction

//Defining a function that will tell us the standard deviation of a function
function sd=standard_deviation(x)
    sd=0
    t=average(x)
    for(i=1:k(x))
        sd=sd+((x(i)-t)^2)
    end
    sd=sd/k(x)
    sd=sqrt(sd)
endfunction

//Now defining a function as per our demands in the question. The function will call the above functions we defined
//We define a function that will make another vector 'b' as per demamded in the question.
exec('ex2a.sce', -1)
function ex2fun(a,m)
    dummy=[]
    b=[]
    for (i=1:k(a))
        dummy=[dummy',[a(i)]']'
        if (k(dummy)==m)
            n=average(dummy)
            b=[b',[n]']'
            dummy=[]
        end
    end
    //disp(b)
    disp(length(b),'The size of vector b is : ')
    disp(minimum(b),'The minimum value amongst all elements of the matrix b is : ')
    disp(maximum(b),'The maximum value amongst all elements of the matrix b is : ')
    disp(average(b),' The average value of elements of b : ')
    disp(standard_deviation(b),'The Standard Deviation of elements of b is : ')
    clf
    histplot(5,b,xlabel('Class Intervals'),ylabel('Frequecies density'),xtitle('Histogram'))
endfunction

//Now defining a function as per our demands in the question. The function will call the above functions we defined
