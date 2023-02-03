#!/bin/bash

echo -n "name: "
read session_name
tmux a -t $session_name
