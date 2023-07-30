#!/bin/bash

set -e

echo -n "tmux backup file location(ex: /User/sch/setup/.tmux.conf -> setup)"
read BACKUPCONFFILE
CONFFILE="/.tmux.conf"
CONFFILELOCAL="/.tmux.conf.local"

if [ -f "$HOME$CONFFILE" ]; then
  TMUXCONFDIFF=$(diff $HOME$CONFFILE $HOME/$BACKUPCONFFILE$CONFFILE)
  if [ -n "$TMUXCONFDIFF" ]; then
    cat "$HOME$CONFFILE" >"$HOME/$BACKUPCONFFILE$CONFFILE"
    echo ".tmux.conf file backup success"
  else
    echo "No change .tmux.conf"
  fi

  echo -n "Are you using oh my tmux?(y/n)"
  read ANSWER
  LOWERCASE=$(echo "$ANSWER" | tr '[:upper:]' '[:lower:]')

  if [ "$LOWERCASE" = "y" ]; then
    TMUXCONFLOCALDIFF=$(diff $HOME$CONFFILELOCAL $HOME/$BACKUPCONFFILE$CONFFILELOCAL)

    if [ -n "$TMUXCONFLOCALDIFF" ]; then
      cat "$HOME$CONFFILELOCAL" >"$HOME/$BACKUPCONFFILE$CONFFILELOCAL"
      echo ".tmux.conf.local file backup success"
    else
      echo "No change .tmux.conf.local"
    fi

  fi
fi
