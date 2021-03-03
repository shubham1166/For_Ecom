clc,clear
exec('tv.sce',-1)
dem = demand;
inventory = zeros(100,1); //store inventory
b = zeros(100,1); //backlog
a1 = zeros(100,1); // warehouse
b1 = zeros(100,1);  // dist centre
inventory(1)=5000;
a1(1)=5000;
b1(1)=5000;

i = 6
while i<100
    a1(i+1) = 5000
    inventory(i+2) = 5000
    b1(i) = 5000
    i = i+4
end

for i = 1:100
    if(dem(i)<=inventory(i))
        inventory(i) = inventory(i)-dem(i);
    else
        b(i) = dem(i) - inventory(i);
        inventory(i) = 0;
        if(i<=99)
        dem(i+1) = dem(i+1)+b(i);
        end
    end
    if(i<=99)
        if(inventory(i+1)~=0)
            inventory(i+1) = inventory(i+1) + inventory(i)
        end 
    inventory(i+1) = inventory(i)+min((5000-inventory(i)),a1(i));
    end
    a1(i) = a1(i)- min((5000-inventory(i)),a1(i));
    if(i<=99)
        if(a1(i+1)~=0)
            a1(i+1) = a1(i+1) + a1(i)
        end
    a1(i+1) = a1(i)+ min((5000-a1(i)),b1(i));
    end
    b1(i) = b1(i)-min((5000-a1(i)),b1(i));
    if(i<=99)
        if(b1(i+1)~=0)
            b1(i+1) = b1(i+1) + b1(i)
        end
    b1(i+1) = b1(i+1)+b1(i);
    end
    if(b1(i)<=5000 & i<=98)
    b1(i+2) = b1(i+2) + 5000-b1(i);
    end
    
end
figure(1);
plot(1:100,inventory,title("Inventory at store"));
figure(2);
plot(1:100,a1,title("Inventory at warehouse"));
figure(3);
plot(1:100,b1,title("Inventory at distribution centre"));
disp("Total cost : "+string(sum(b1)*60+sum(a1)*80+sum(inventory)*100+5000*100*50+110*sum(b)));






