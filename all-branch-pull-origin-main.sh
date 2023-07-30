#!/bin/zsh

set -e

if [ $# -ne 1 ]; then
  echo "error: expected only 1 parameter(file name)"
  sleep 0.1
  return 0
fi

j $1

PWD=$(pwd -P)

if [ ${#1} -gt ${#PWD} ] || [ ${PWD: -${#1}} != $1 ]; then
  echo "error: Enter a valid path"
  sleep 0.1
  return 0
fi

git checkout main && git pull origin main

for branch in $(echo $(git branch) | tr " " "\n"); do
  if [ $branch != "*" ] && [ $branch != "main" ]; then
    git checkout $branch && git pull origin main
  fi
done
