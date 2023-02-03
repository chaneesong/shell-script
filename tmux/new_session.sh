#!/bin/bash

echo -n "name: "
read session_name
tmux new -s $session_name
