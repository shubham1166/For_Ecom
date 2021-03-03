clc,clear
exec('tv.sce',-1)
function total= cost(n)
    
    //Data of 100 weeks is given.
    //As each link in the supply chain orders a fixed quantity of 5000 units, thus assembly center has 5000 usits    for all the weeks.
    assembly=[]
    for i=1:100
        assembly=[assembly',[n]']'
    end

    //The array distribution will represent the inventory that is going to be used in the following month
    distribution=zeros(100,1)
    for i=1:100
        if i~=2
            distribution(i)=distribution(i)+n
        end
    end

    //The array warehouse will represent the inventory that is going to be used in the following month
    warehouse=zeros(100,1)
    for i=1:100
       if i~=3
            warehouse(i)=warehouse(i)+n
        end
    end

    //The array store will represent the inventory that is going to be used in the following month
    store=zeros(100,1)
    for i=1:100
        if i~=4
            store(i)=store(i)+n
        end
    end

    new_demand=demand
    new_store=store
    wt_list=zeros(100,1)
    for i=1:99
        if new_store(i)>=new_demand(i)
            new_store(i+1)=new_store(i+1)+new_store(i)-new_demand(i)
        else
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

    //printf('The total cost of inventory is Rs%d\n',total_inventory)
    //printf('The total cost of back-ordering is Rs%d\n',backcost)

    total=total_inventory+backcost
endfunction

x=[]
for i=4000:100:6000
    x=[x',[cost(i)]']'
end

z=find(x==max(x))
y=3900+100*z

clf

a=4000:100:6000;
printf('The best fixed order quantity is : %d\n',y)
plot(a,x,'.r')

for i=1:21
    printf('Quantity=%d         Total Cost=%d\n',3900+100*i,x(i))
end
