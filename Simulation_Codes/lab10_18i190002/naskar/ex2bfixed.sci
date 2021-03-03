clc,clear
exec('tv.sce',-1)
function [cost] = FS(SUPPLY,demand)

    CA = SUPPLY*50*50*1.5;
    CS = zeros(100,1);
    CB = zeros(100,1);

    inventory = zeros(100,1);
    inventory(1) = SUPPLY;
    CD=zeros(100,1)
    for i=1:2:99
        CD(i)=SUPPLY
    end
    W=zeros(100,1)
    for i=2:2:100
        W(i)=SUPPLY
    end
    CD = demand;
    for i = 1:99
        if(CD(i)<=inventory(i))
            inventory(i) = inventory(i) - CD(i);
        
        else
            CB(i) = CD(i) - inventory(i);
            inventory(i) = 0;
            CD(i+1) = CD(i+1) + CB(i); 
        end
        inventory(i+1) = W(i)+ inventory(i);

    end
    i=i+1;
    if(demand(i)<=inventory(i))
            inventory(i) = inventory(i) - demand(i);
            
        else
            CB(i) = demand(i) - inventory(i);
            inventory(i) = 0;
            
    end

    cost  = sum(CD)*60+sum(W)*80+sum(inventory)*100+CA+110*sum(CB);

endfunction

CS = 4000:100:6000;
C = zeros(length(CS));
for i = 1:length(CS)
    temp = FS(CS(i),demand);
    C(i) = temp(1)
    
end
Min = C(1);
position = 1;
for i = 2:length(CS)
    if(C(i)<Min)
        Min = C(i);
        position = i;
    end    
end
disp("The best fixed order quantity is "+string(CS(position)));
plot(CS',C)
