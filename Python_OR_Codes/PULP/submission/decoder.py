#decoder.py

import numpy as np
import pulp as p

import argparse

#import warnings
#warnings.filterwarnings("ignore")

parser = argparse.ArgumentParser(description='PLANNER')

parser.add_argument('--grid', type=str, required=True, 
                    help='path to the grid file')

parser.add_argument('--value_policy', 
                    help='path to the solution file')

arguments = parser.parse_args()

value_policy = np.loadtxt(arguments.value_policy, delimiter=' ')

maze = arguments.grid
maze_array = np.loadtxt(maze, delimiter=' ', dtype=int)
V = value_policy[:,0]
pi = value_policy[:,1]


#States be like N = 0, W = 1, S = 2, E = 3
num_of_states = 0
num_of_actions = 4 # always for maze
states = np.empty(maze_array.shape)
for i in range(maze_array.shape[0]):
    for j in range(maze_array.shape[1]):
        if maze_array[i,j] != 1:
            states[i,j] = num_of_states
            if maze_array[i,j] == 2:
                start_state = num_of_states
            elif maze_array[i,j] == 3:
                end_state = num_of_states
            num_of_states += 1


#Let us refine two matrix for transition probabilitites and reward functions
reward = np.zeros([num_of_states ,num_of_actions ,num_of_states])
tr_prob = np.zeros([num_of_states ,num_of_actions ,num_of_states])


for i in range(maze_array.shape[0]):
    for j in range(maze_array.shape[1]):
        if maze_array[i,j] != 1 and maze_array[i,j] != 3:
            #For Action W
            if maze_array[i,j-1] != 1 and maze_array[i+1,j] != 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(1)+' '+str(int(states[i,j-1]))+' '+str(-1)+' '+str(1))
                tr_prob[int(states[i,j]), 1, int(states[i,j-1])] = 1
                reward[int(states[i,j]), 1, int(states[i,j-1])] = -1
            elif maze_array[i,j-1] == 1:
#                 print('transition '+str(int(states[i,j]))+' '+str(1)+' '+str(int(states[i,j]))+' '+str(-2)+' '+str(1))
                tr_prob[int(states[i,j]), 1, int(states[i,j])] = 1
                reward[int(states[i,j]), 1, int(states[i,j])] = -5
            elif maze_array[i,j-1] == 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(1)+' '+str(int(states[i,j-1]))+' '+str(10)+' '+str(1))
                tr_prob[int(states[i,j]), 1, int(states[i,j-1])] = 1
                reward[int(states[i,j]), 1, int(states[i,j-1])] = 100
            #For Action E
            if maze_array[i,j+1] != 1 and maze_array[i+1,j] != 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(3)+' '+str(int(states[i,j+1]))+' '+str(-1)+' '+str(1))
                tr_prob[int(states[i,j]), 3, int(states[i,j+1])] = 1
                reward[int(states[i,j]), 3, int(states[i,j+1])] = -1
            elif maze_array[i,j+1] == 1:
#                 print('transition '+str(int(states[i,j]))+' '+str(3)+' '+str(int(states[i,j]))+' '+str(-2)+' '+str(1))       
                tr_prob[int(states[i,j]), 3, int(states[i,j])] = 1
                reward[int(states[i,j]), 3, int(states[i,j])] = -5
            if maze_array[i,j+1] == 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(3)+' '+str(int(states[i,j+1]))+' '+str(10)+' '+str(1))
                tr_prob[int(states[i,j]), 3, int(states[i,j+1])] = 1
                reward[int(states[i,j]), 3, int(states[i,j+1])] = 100
            #For Action N
            if maze_array[i-1,j] != 1 and maze_array[i+1,j] != 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(0)+' '+str(int(states[i-1,j]))+' '+str(-1)+' '+str(1))
                tr_prob[int(states[i,j]), 0, int(states[i-1,j])] = 1
                reward[int(states[i,j]), 0, int(states[i-1,j])] = -1
            elif maze_array[i-1,j] == 1:
#                 print('transition '+str(int(states[i,j]))+' '+str(0)+' '+str(int(states[i,j]))+' '+str(-2)+' '+str(1))
                tr_prob[int(states[i,j]), 0, int(states[i,j])] = 1
                reward[int(states[i,j]), 0, int(states[i,j])] = -5
            if maze_array[i-1,j] == 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(0)+' '+str(int(states[i-1,j]))+' '+str(10)+' '+str(1))
                tr_prob[int(states[i,j]), 0, int(states[i-1,j])] = 1
                reward[int(states[i,j]), 0, int(states[i-1,j])] = 100
            #For Action S
            if maze_array[i+1,j] != 1 and maze_array[i+1,j] != 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(2)+' '+str(int(states[i+1,j]))+' '+str(-1)+' '+str(1))
                tr_prob[int(states[i,j]), 2, int(states[i+1,j])] = 1
                reward[int(states[i,j]), 2, int(states[i+1,j])] = -1
            elif maze_array[i+1,j] == 1:
#                 print('transition '+str(int(states[i,j]))+' '+str(2)+' '+str(int(states[i,j]))+' '+str(-2)+' '+str(1))
                tr_prob[int(states[i,j]), 2, int(states[i,j])] = 1
                reward[int(states[i,j]), 2, int(states[i,j])] = -5
            elif maze_array[i+1,j] == 3:
#                 print('transition '+str(int(states[i,j]))+' '+str(2)+' '+str(int(states[i+1,j]))+' '+str(10)+' '+str(1))
                tr_prob[int(states[i,j]), 2, int(states[i+1,j])] = 1
                reward[int(states[i,j]), 2, int(states[i+1,j])] = 100

for action in range(num_of_actions):
    tr_prob[end_state, action, end_state] = 1
mdptype = 'episodic'
gamma = 0.9


st_dict = {0:'N', 1:'W', 2:'S', 3:'E'}
def solve(pi, V, start, end):
    en_st = start
    while en_st != end:
        print(st_dict[int(pi[en_st])], end =" ")
        en_st = np.where(tr_prob[en_st,int(pi[en_st])] == 1.)[0][0]
        
solve(pi, V, start_state, end_state)