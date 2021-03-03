#encoder.py
import numpy as np
import argparse


parser = argparse.ArgumentParser(description='ENCODER')

parser.add_argument('--grid', type=str, required=True, 
                    help='Path to the grid file')

arguments = parser.parse_args()

maze = arguments.grid
maze_array = np.loadtxt(maze, delimiter=' ', dtype=int)

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

print('numStates '+str(num_of_states))
print('numActions '+str(num_of_actions))
print('start '+str(start_state))
print('end '+str(end_state))
for i in range(maze_array.shape[0]):
    for j in range(maze_array.shape[1]):
        if maze_array[i,j] != 1 and maze_array[i,j] != 3:
            #For Action W
            if maze_array[i,j-1] != 1 and maze_array[i,j-1] != 3:
                print('transition '+str(int(states[i,j]))+' '+str(1)+' '+str(int(states[i,j-1]))+' '+str(-1)+' '+str(1))
            elif maze_array[i,j-1] == 1:
                print('transition '+str(int(states[i,j]))+' '+str(1)+' '+str(int(states[i,j]))+' '+str(-5)+' '+str(1))
            elif maze_array[i,j-1] == 3:
                print('transition '+str(int(states[i,j]))+' '+str(1)+' '+str(int(states[i,j-1]))+' '+str(100)+' '+str(1))
            #For Action E
            if maze_array[i,j+1] != 1 and maze_array[i,j+1] != 3:
                print('transition '+str(int(states[i,j]))+' '+str(3)+' '+str(int(states[i,j+1]))+' '+str(-1)+' '+str(1))
            elif maze_array[i,j+1] == 1:
                print('transition '+str(int(states[i,j]))+' '+str(3)+' '+str(int(states[i,j]))+' '+str(-5)+' '+str(1))       
            if maze_array[i,j+1] == 3:
                print('transition '+str(int(states[i,j]))+' '+str(3)+' '+str(int(states[i,j+1]))+' '+str(100)+' '+str(1))
            #For Action N
            if maze_array[i-1,j] != 1 and maze_array[i-1,j] != 3:
                print('transition '+str(int(states[i,j]))+' '+str(0)+' '+str(int(states[i-1,j]))+' '+str(-1)+' '+str(1))
            elif maze_array[i-1,j] == 1:
                print('transition '+str(int(states[i,j]))+' '+str(0)+' '+str(int(states[i,j]))+' '+str(-5)+' '+str(1))
            if maze_array[i-1,j] == 3:
                print('transition '+str(int(states[i,j]))+' '+str(0)+' '+str(int(states[i-1,j]))+' '+str(100)+' '+str(1))
            #For Action S
            if maze_array[i+1,j] != 1 and maze_array[i+1,j] != 3:
                print('transition '+str(int(states[i,j]))+' '+str(2)+' '+str(int(states[i+1,j]))+' '+str(-1)+' '+str(1))
            elif maze_array[i+1,j] == 1:
                print('transition '+str(int(states[i,j]))+' '+str(2)+' '+str(int(states[i,j]))+' '+str(-5)+' '+str(1))
            elif maze_array[i+1,j] == 3:
                print('transition '+str(int(states[i,j]))+' '+str(2)+' '+str(int(states[i+1,j]))+' '+str(100)+' '+str(1))
print('mdptype episodic')
print('discount '+str(0.9))