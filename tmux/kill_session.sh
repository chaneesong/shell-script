#!/bin/bash

echo -n "name: "
read session_name
tmux kill-session -t $session_name
