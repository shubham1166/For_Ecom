//SHUBHAM SHARMA
//Roll no:18i190002
//Msc PhD OR
clc,clear
function[TR_busy, TR_total, TR_idle] =JobsDoneInOneArrival(m,u,X)
   IS = X
    TR = [0]
    i = 1
    S = grand(1,1, "exp", 1/u)
    while (IS > 0)
        A = grand(1,1, "exp", 1/m)
        TR(i+1) = TR(i) + A
        JC =0
        while TR(i+1) > S &IS >0
            JC = JC + 1
           IS =IS -1
            if IS == 0
                TR_busy = S
            else
                s = grand(1,1, "exp", 1/u)
                S= S+ s
            end
        end
        if IS > 0
           IS =IS+1
        end
        i = i+1
    end
    TR_total = TR(i)
    TR_idle = TR_total - TR_busy
endfunction
Busy_time =[]
Cycle_time=[]
Idle_time=[]
for k = 1:10000
    [a,b,c] = JobsDoneInOneArrival(0.1, 0.2,10)
    Busy_time =[Busy_time, a]
    Cycle_time =[Busy_time, b]
    Idle_time = [Idle_time,c]
end
disp("mean Cycle Time = " + string(mean(Cycle_time)));
disp("mean Busy Time = " + string(mean(Busy_time)));
disp("mean Idle Time = " + string(mean(Idle_time)));

//Discussed with Mtech Students
