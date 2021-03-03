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

//We will make a column vector 'b' that will contain all the distinct elements of 'a' and the function defined below will help us to find the no of times a number is coming in column vector 'b'
function times2=times2(b)
    times2=0
    for(i=1:k(y))
        if(y(i)==b) then
            times2=times2+1
        end
    end
endfunction


//Function to define a vector that will contain all the distinct elements of a
function y=separate(x)
    y=[]'
    for (i=1:k(x))
        if times2(x(i))==0 then
            y=[y',[x(i)]']'
        end
    end

endfunction

//defining the function as per given in the question.
function ex1fun(x)
    disp(k(x),'The number of elements are:')
    disp(minimum(x),'The minimum value amongst all elements of a: ')
    disp(maximum(x),'The maximum value among all elements of a : ')
    y=separate(x)
    for(i=1:k(y))
        printf('The number of times %d is coming is %d\n',y(i),times(y(i)))
    end
    disp(average(x),'The average value of elements of a is :')
    disp(standard_deviation(x),'The standard dev. of elements of a is : ')
endfunction
