#!/bin/bash

set -e

DERECTORY="setup"
RCFILE="/.zshrc"

if [ -f "$HOME$RCFILE" ]; then
  ZSHRCDIFF=$(diff $HOME$RCFILE $HOME/$DERECTORY$RCFILE)
  if [ -n "$ZSHRCDIFF" ]; then
    cat "$HOME$RCFILE" >"$HOME/$DERECTORY$RCFILE"
    echo ".zshrc file backup success"
  else
    echo "No change .zshrc"
  fi
fi
