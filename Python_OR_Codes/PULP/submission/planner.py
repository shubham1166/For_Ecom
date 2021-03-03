#planner .py

# Importning Libraries
import argparse
import numpy as np
import pulp as p 

#import warnings
#warnings.filterwarnings("ignore")

parser = argparse.ArgumentParser(description='PLANNER')

parser.add_argument('--mdp', type=str, required=True, 
                    help='a path to the input MDP file')

parser.add_argument('--algorithm', 
                    help='one of vi, hpi, and lp')

arguments = parser.parse_args()


f = open(arguments.mdp, "r")
MDP = []
while True:
    line = f.readline()
    splitLine = line.rstrip().split()
    if splitLine == []:
        break
    MDP.append(splitLine)

##################################
for line in MDP:
    if 'numStates' in line:
        num_of_states = int(line[1])
    elif 'numActions' in line:
        num_of_actions = int(line[1])
    elif 'start' in line:
        starting_states = line[1:]
        starting_states = [int(i) for i in starting_states]
    elif 'end' in line:
        end_states = line[1:]
        end_states = [int(i) for i in end_states]
        break

#Let us refine two matrix for transition probabilitites and reward functions
reward = np.zeros([num_of_states ,num_of_actions ,num_of_states])
tr_prob = np.zeros([num_of_states ,num_of_actions ,num_of_states])

for line in MDP:
    if 'transition' in line:
        reward[int(line[1]), int(line[2]), int(line[3])] = float(line[4])
        tr_prob[int(line[1]), int(line[2]), int(line[3])] = float(line[5])
    elif 'mdptype' in line:
        mdptype = line[1]
    elif 'discount' in line:
        gamma = float(line[1])

# For episodic tasks the transition probability for the ending states should be 1
if mdptype == 'episodic':
    for e in end_states:
        for action in range(num_of_actions):
                tr_prob[e, action, e] = 1
            
            
# Value Iteration
# The expected output is the optimal value function, along with an optimal policy.

#To find Q(s,a) for a given state s and all the actions in the action set and a given V
def Q(s, num_of_states, num_of_actions, reward, tr_prob, V, gamma):
    q = []
    q = np.empty(num_of_actions)
    for a in range(num_of_actions):
        q[a] = np.dot(tr_prob[s,a,:], reward[s,a,:] + gamma*V)
    return q


def value_iteration(num_of_states, num_of_actions, reward, tr_prob, mdptype, gamma, tolerance = 1e-12):
    V = [0 for i in range(num_of_states)]
    V = np.zeros(num_of_states)
    difference = 10
    while np.linalg.norm(difference) > tolerance:
        V1 = np.empty(num_of_states)
        for s in range(num_of_states):
            V1[s] = np.max(Q(s, num_of_states, num_of_actions, reward, tr_prob, V, gamma))
        difference = V1 - V
        V = V1
    # Finding the optimal policy
    pi = np.empty(num_of_states)
    for s in range(num_of_states):
        pi[s] = np.argmax(Q(s, num_of_states, num_of_actions, reward, tr_prob, V, gamma))
    return pi, np.around(V, decimals = 6)
    
def policy_evaluation(pi, num_of_states, num_of_actions, reward, tr_prob, mdptype, end_states, gamma):
    y = [sum([tr_prob[s,pi[s],x]*reward[s,pi[s],x] for x in range(num_of_states)]) for s in range(num_of_states)]
    X = np.empty((num_of_states,num_of_states))
    for s in range(num_of_states):
        X[s] = [-tr_prob[s,pi[s],x]*gamma for x in range(num_of_states)]
        X[s][s] += 1
    
    if mdptype == 'episodic':
#             V = np.linalg.lstsq(X, y)[0]
            states = [i for i in range(num_of_states)]
            for end in end_states:
                states.remove(end)
            y = [sum([tr_prob[s,pi[s],x]*reward[s,pi[s],x] for x in range(num_of_states)]) for s in states]
            X = np.empty((len(states),len(states)))    
            c = 0
            for s in states:
                X[c] = [-tr_prob[s,pi[s],x]*gamma for x in states]
                X[c][c] += 1
                c+=1
            V = np.linalg.solve(X,y) 
#             X_i = np.linalg.inv(X)
#             V = np.matmul(X_i, y) 
            V1 = np.zeros(num_of_states)
            V1[states] = V
            return V1
    else:
#         V = np.linalg.solve(X,y)
        X_i = np.linalg.inv(X)
        V = np.matmul(X_i, y) 
    return V

    
    
    
# Howard's Policy Iteration
def policy_improvement(num_of_states, num_of_actions, reward, tr_prob, mdptype, end_states, gamma):
    #Generating random policy
    pi = [0 for i in range(num_of_states)]
    while True:
        pi2 = pi.copy()
        V = policy_evaluation(pi, num_of_states, num_of_actions, reward, tr_prob, mdptype, end_states, gamma)
        Q_pi = np.empty((num_of_states, num_of_actions))
        for s in range(num_of_states):
            Q_pi[s] = Q(s, num_of_states, num_of_actions, reward, tr_prob, V, gamma)
            for a in range(num_of_actions):
                if Q_pi[s,a] > V[s]:
                    pi2[s] = a
                    break
        if pi == pi2:
            break
        pi = pi2.copy()
    
    return pi, V

def linear_programming(num_of_states, num_of_actions, reward, tr_prob, mdptype, end_states, gamma):
    # Create a LP Minimization problem 
    Lp_prob = p.LpProblem('Problem', p.LpMinimize)  
    # Create problem Variables
    decision_variables = []
    for s in range(num_of_states):
        variable = str('v' + str(s))
        variable = p.LpVariable(str(variable), lowBound = 0)
        decision_variables.append(variable)
    # Objective Function 
    Lp_prob += sum(decision_variables) 
    X = np.empty((num_of_states,num_of_actions,num_of_states))
    for s in range(num_of_states):
        for a in range(num_of_actions):
            X[s,a] = [-tr_prob[s,a,x]*gamma for x in range(num_of_states)]
            X[s,a,s] += 1
    # Constraints: 
    for state in range(num_of_states):
        for action in range(num_of_actions):
            Lp_prob += sum([X[state,action,h] * decision_variables[h] for h in range(num_of_states)])\
            >=sum([tr_prob[state,action,x]*reward[state,action,x] for x in range(num_of_states)])
    status = p.PULP_CBC_CMD(msg=0).solve(Lp_prob)   # Solver 
    V = []
    for i in range(num_of_states):
        V.append(p.value(decision_variables[i]))
    # Finding the optimal policy
    pi = []
    for s in range(num_of_states):
        pi.append(np.argmax(Q(s, num_of_states, num_of_actions, reward, tr_prob, np.array(V), gamma)))
    return pi, np.around(V, decimals = 6)
    
    
    
if arguments.algorithm == 'vi':
    pi, V = value_iteration(num_of_states, num_of_actions, reward, tr_prob, mdptype, gamma, tolerance = 1e-12)
elif arguments.algorithm == 'hpi':
    pi, V = policy_improvement(num_of_states, num_of_actions, reward, tr_prob, mdptype, end_states, gamma)
elif arguments.algorithm == 'lp':
    pi, V = linear_programming(num_of_states, num_of_actions, reward, tr_prob, mdptype, end_states, gamma)


for i in range(len(pi)):
    print(str(V[i])+" "+str(pi[i]))