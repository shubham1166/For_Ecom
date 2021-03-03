clc,clear
exec('tv.sce',-1)
SUPPLY = 5000
COSTA = SUPPLY*50*50*1.5;
CB = zeros(100,1);
CS = zeros(100,1);
inventory = zeros(100,1);
inventory(1) = SUPPLY;
CD=zeros(100,1)
for i=1:2:99
    CD(i)=SUPPLY
end
CW=zeros(100,1)
for i=2:2:100
    CW(i)=SUPPLY
end
DM = demand;
for i = 1:99
    if(DM(i)<=inventory(i))
        inventory(i) = inventory(i) - DM(i);
        
    else
        CB(i) = DM(i) - inventory(i);
        inventory(i) = 0;
        DM(i+1) = DM(i+1) + CB(i); 
    end
    inventory(i+1) = CW(i)+ inventory(i);

end
i=i+1;
if(demand(i)<=inventory(i))
        inventory(i) = inventory(i) - demand(i);
        
    else
        CB(i) = demand(i) - inventory(i);
        inventory(i) = 0;
        
end

clf
cost  = sum(CD)*60+sum(CW)*80+sum(inventory)*100+COSTA+110*sum(CB);
disp((sum(CD)*60+sum(CW)*80+sum(inventory)*100+COSTA),'The inventory cost is');  // inventory cost
disp((110*sum(CB)),'The back ordering cost is : '); //backing order
disp(cost,'The total cost is : '); // total cost
week = 1:100;
plot(week',inventory);


