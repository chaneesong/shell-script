#!/bin/zsh

if [ $# -eq 0 ];
  then
    echo "error: expected only 1 parameter(file name)"
    sleep 0.1
    return 1
fi

j $1

git checkout main && git pull origin main

for branch in $(echo $(git branch) | tr " " "\n")
do
  if [ $branch != "*" ] && [ $branch != "main" ];
    then
      git checkout $branch && git pull origin main
  fi
done
