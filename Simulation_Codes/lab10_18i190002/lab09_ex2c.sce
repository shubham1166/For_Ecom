clc,clear
exec('tv.sce',-1)

//Data of 100 weeks is given.
//As each link in the supply chain orders a fixed quantity of 5000 units, thus assembly center has 5000 usits for all the weeks.
assembly=[]
for i=1:25
    assembly=[assembly',[5000]']'
end

//The array distribution will represent the inventory that is going to be used in the following month
distribution=zeros(100,1)
for i=1:25
    
        distribution(i)=distribution(i)+5000
    
end

//The array warehouse will represent the inventory that is going to be used in the following month
warehouse=zeros(25,1)
for i=1:25
    
        warehouse(i)=warehouse(i)+5000
    
end

//The array store will represent the inventory that is going to be used in the following month
store=zeros(100,1)
for i=1:25
    
        store(i)=store(i)+5000
    
end

demand2=[]
a=0
for i=1:length(demand)
    a=a+demand(i)
    if modulo(i,4)==0
        demand2=[demand2',a']'
        a=0
    end
end

new_demand=demand2
new_store=store
wt_list=zeros(100,1)
//new demand will be the demand of the month met by that month only
//new_store will show the inventory order that month

for i=1:24
    if new_demand(i)>=new_store(i)
        wt_list(i)=new_demand(i)-new_store(i)
        new_store(i+1)=new_store(i+1)+wt_list(i)
    else
        //when inventory is more than demand
        //i.e new_store(i)>new_demand(i)
        x=new_store(i)-new_demand(i)
        new_store(i+1)=new_store(i+1)-x
    end
end

for i=1:24
    if new_demand(i)>=new_store(i)
        wt_list(i)=new_demand(i)-new_store(i)
        new_store(i+1)=new_store(i+1)+wt_list(i)
    else
        //when inventory is more than demand
        //i.e new_store(i)>new_demand(i)
        x=new_store(i)-new_demand(i)
        new_store(i+1)=new_store(i+1)-x
    end
end

new_warehouse=warehouse
for i=1:24
    if new_store(i)>=new_warehouse(i)
        
        new_warehouse(i+1)=new_warehouse(i+1)+new_store(i)-new_warehouse(i)
    else
        //when inventory is more than demand
        //i.e new_store(i)>new_demand(i)
        x=new_warehouse(i)-new_store(i)
        new_warehouse(i+1)=new_warehouse(i+1)-x
    end
end

new_distribution=distribution
for i=1:24
    if new_warehouse(i)>=new_distribution(i)
        
        new_distributon(i+1)=new_distribution(i+1)+new_warehouse(i)-new_distribution(i)
    else
        //when inventory is more than demand
        //i.e new_store(i)>new_demand(i)
        x=new_distribution(i)-new_warehouse(i)
        new_distribution(i+1)=new_distribution(i+1)-x
    end
end

new_assembly=assembly
for i=1:24
    if new_distribution(i)>=new_assembly(i)
        
        new_assembly(i+1)=new_assembly(i+1)+new_distribution(i)-new_assembly(i)
    else
        //when inventory is more than demand
        //i.e new_store(i)>new_demand(i)
        x=new_assembly(i)-new_distribution(i)
        new_assembly(i+1)=new_assembly(i+1)-x
    end
end



subplot(2,2,1)
plot(new_store,title('inventory of store'))

subplot(2,2,2)
plot(new_warehouse,title('inventory of warehouse'))

subplot(2,2,3)
plot(new_assembly,title('inventory of assembly'))

subplot(2,2,4)
plot(new_distribution,title('inventory of distribution center'))

