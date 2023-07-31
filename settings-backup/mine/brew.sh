#!/bin/bash

directory="/setup"
formulalist="/brew.formula.list"
casklist="/brew.cask.list"

# formula
if [ ! -f "$HOME$directory$formulalist" ]; then
  touch $HOME$directory$formulalist
fi

brew list --formula >formula.tmp.list
formuladiff=$(diff formula.tmp.list "$HOME$directory$formulalist")

if [ -n "$formuladiff" ]; then
  cat formula.tmp.list >"$HOME$directory$formulalist"
  echo "brew formula list backup success!"
else
  echo "No change brew formula list"
fi

# cask
if [ ! -f "$HOME$directory$casklist" ]; then
  touch $HOME$directory$casklist
fi

brew list --cask >cask.tmp.list
caskdiff=$(diff cask.tmp.list "$HOME$directory$casklist")

if [ -n "$caskdiff" ]; then
  cat cask.tmp.list >"$HOME$directory$casklist"
  echo "brew cask list backup success!"
else
  echo "No change brew cask list"
fi

rm -rf formula.tmp.list cask.tmp.list
