RCFILE="/.zshrc"
GITRCFILE="/setup/.zshrc"

if [ -f "$HOME$RCFILE" ]
then
  ZSHRCDIFF=`diff $HOME$RCFILE $HOME$GITRCFILE`
  if [ -n "$ZSHRCDIFF" ]
  then
    cat "$HOME$RCFILE" > "$HOME$GITRCFILE"
    echo ".zshrc file backup success"
  fi
fi

