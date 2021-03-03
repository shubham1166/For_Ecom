clc,clear
exec('tv.sce',-1)

//Data of 100 weeks is given.
//As each link in the supply chain orders a fixed quantity of 5000 units, thus assembly center has 5000 usits for all the weeks.
assembly=[]
for i=1:100
    assembly=[assembly',[5000]']'
end

//The array distribution will represent the inventory that is going to be used in the following month
distribution=zeros(100,1)
for i=1:100
    if i~=2
        distribution(i)=distribution(i)+5000
    end
end

//The array warehouse will represent the inventory that is going to be used in the following month
warehouse=zeros(100,1)
for i=1:100
    if i~=3
        warehouse(i)=warehouse(i)+5000
    end
end

//The array store will represent the inventory that is going to be used in the following month
store=zeros(100,1)
for i=1:100
    if i~=4
        store(i)=store(i)+5000
    end
end

new_demand=demand
new_store=store
wt_list=zeros(100,1)
for i=1:99
    if new_store(i)>=new_demand(i)
        //what we are doing is if demand is less than inventory than inventory is carry forward to the next week
        new_store(i+1)=new_store(i+1)+new_store(i)-new_demand(i)
    else
        //If the demand is more than that of inventory than we have backlogging defined below
        wt_list(i)=new_demand(i)-new_store(i)
        //new_demand(i+1)=new_demand(i+1)-wt_list(i)
        x=new_store(i+1)-wt_list(i)
        if x>=0
            new_store(i+1)=x
        else
            new_store(i+1)=0
            wt_list(i+1)=-x
        end
    end
end

total_inventory=50*sum(assembly) + 60*sum(distribution) +80* sum(warehouse) + 100*sum(new_store)

backcost=110*sum(wt_list)

printf('The total cost of inventory is Rs%d\n',total_inventory)
printf('The total cost of back-ordering is Rs%d\n',backcost)

total=total_inventory+backcost
clf

subplot(2,2,1)
i=1:100
plot(i',assembly,xlabel('--weeks-->'),ylabel('inventory of assembly'),title('graph of inventory of assembly with weeks'))

subplot(2,2,2)
i=1:100
plot(i',distribution,'.b',xlabel('--weeks-->'),ylabel('inventory of distribution'),title('graph of inventory of assembly with weeks'))

subplot(2,2,3)
i=1:100
plot(i',warehouse,'.r',xlabel('--weeks-->'),ylabel('inventory of warehouse'),title('graph of inventory of warehouse with weeks'))


subplot(2,2,4)
plot(i',new_store,xlabel('--weeks-->'),ylabel('inventory of store'),title('graph of inventory of store with weeks'))


