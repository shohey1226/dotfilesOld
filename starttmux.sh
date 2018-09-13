#!/bin/bash

session="work"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n vim #"vim -S ~/.vim/sessions/kittybusiness"

# Select pane 1, set dir to api, run vim
tmux selectp -t 1 
tmux send-keys "cd ~/git/Gauss; rails s" C-m 

# Split pane 1 horizontal by 65%, start redis-server
tmux splitw -v -p 50 
tmux send-keys "cd ~/git/Gauss; rails c" C-m 

# create a new windows
tmux new-window -t $session:1 
tmux send-keys -t $session:1 "cd ~/git/Gauss; vim" C-m

tmux new-window -t $session:2 
tmux send-keys -t $session:2 "cd ~/git/Gauss" C-m

## Select pane 2 
#tmux selectp -t 2
## Split pane 2 vertiacally by 25%
#tmux splitw -v -p 75
#
## select pane 3, set to api root
#tmux selectp -t 3
#tmux send-keys "api" C-m 
#
## Select pane 1
#tmux selectp -t 1

# return to main vim window
tmux select-window -t $session:2

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
