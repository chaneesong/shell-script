#!/bin/bash

set -e

echo -n "zshrc backup file location(ex: /User/sch/setup/.zshrc -> setup)"
read BACKUPRCFILE
RCFILE="/.zshrc"

if [ -f "$HOME$RCFILE" ]; then
  ZSHRCDIFF=$(diff $HOME$RCFILE $HOME/$BACKUPRCFILE$RCFILE)
  if [ -n "$ZSHRCDIFF" ]; then
    cat "$HOME$RCFILE" >"$HOME/$BACKUPRCFILE$RCFILE"
    echo ".zshrc file backup success"
  else
    echo "No change .zshrc"
  fi
fi
