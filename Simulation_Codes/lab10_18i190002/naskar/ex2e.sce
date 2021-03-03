b1 = demand;
inventory = zeros(100,1);
B = zeros(100,1);
a1 = zeros(100,1);
b1 = zeros(100,1);
inventory(1)=5000;
a1(1)=5000; // warehouse
b1(1)=5000; //centre
for i = 1:100
    if(b1(i)<=inventory(i))
        inventory(i) = inventory(i)-b1(i);
    else
        B(i) = b1(i) - inventory(i);
        inventory(i) = 0;
        if(i<=99)
        b1(i+1) = b1(i+1)+B(i);
        end
    end
    
    a1(i) = a1(i)- min((B(i)-inventory(i)),a1(i));
    if(i<=99)
    a1(i+1) = a1(i)+ min((B(i)-a1(i)),b1(i));
    end
    b1(i) = b1(i)-min((B(i)-a1(i)),b1(i));
    if(i<=99)
    b1(i+1) = b1(i+1)+b1(i);
    end
    if(b1(i)<=B(i) & i<=98)
    b1(i+2) = b1(i+2) + B(i)-b1(i);
    end
    if(i<=99)
    inventory(i+1) = inventory(i)+min((B(i)-inventory(i)),a1(i));
    end
end
figure(1);
plot(1:100,inventory,title("store"));
figure(2);
plot(1:100,a1,title("warehouse"));
figure(3);
plot(1:100,b1,title("centre"));
disp(sum(b1)*60+sum(a1)*80+sum(inventory)*100+5000*100*50+110*sum(B));








