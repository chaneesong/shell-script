#!/bin/bash

set -e

DERECTORY="setup"
CONFFILE="/.tmux.conf"
CONFLOCAL="/.tmux.conf.local"

if [ -f "$HOME$CONFFILE" ]; then
  TMUXCONFDIFF=$(diff $HOME$CONFFILE $HOME/$DERECTORY$CONFFILE)
  if [ -n "$TMUXCONFDIFF" ]; then
    cat "$HOME$CONFFILE" >"$HOME/$DERECTORY$CONFFILE"
    echo ".tmux.conf file backup success"
  else
    echo "No change .tmux.conf"
  fi

  TMUXCONFLOCALDIFF=$(diff $HOME$CONFLOCAL $HOME/$DERECTORY$CONFLOCAL)

  if [ -n "$TMUXCONFLOCALDIFF" ]; then
    cat "$HOME$CONFFILE" >"$HOME/$DERECTORY$CONFFILE"
    echo ".tmux.conf.local file backup success"
  else
    echo "No change .tmux.conf.local"
  fi

fi
