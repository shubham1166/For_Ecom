//Shubham sharma
//18i190002
//Msc PhD OR
clc,clear
function k=simvirus(n)
    class=[]
    for i=1:n
        class=[class,i']
    end
    //The above set shows the no of students that are in the class.
    cc=class(1)
    infected=[1]//i.e, bindu
    for i=1:n
        y=class
        y(find(y==cc))=[]
        a= grand(1, 1, "uin", 1, n-1)
        //a is any number between 1 to n-1
        //we will treat this as an index of the set y to find a random number in y
        z=y(a)
        //if this z is not there in infected we will append it to the set , otherwise it will terminate
        if find(infected==z)==[]
            infected=[infected,z']
            cc=z
        else
            break
        end
        k=length(infected)
    end
endfunction

for i=1:15000
    m(i)=simvirus(20)
end

clf
histplot(15,m,xlabel('Students from 1 to 20'),ylabel('--Frequency density-->'),title('Histogram plot when it is run 15000 times and n=20'))

disp(mean(m),'Mean is')
disp(variance(m),'Variance is ')
