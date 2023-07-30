#!/bin/bash

directory="/setup"
settings="/settings.json"
keybindings="/keybindings.json"
vscode="/Library/Application Support/Code/User"
extensionlist="/extensions.list"

# settings.json
if [ -f "$HOME$vscode$settings" ]; then
  settingsdiff=$(diff "$HOME$vscode$settings" "$HOME$directory$settings")

  if [ -n "$settingsdiff" ]; then
    cat "$HOME$vscode$settings" >"$HOME$directory$settings"
    echo "vscode settings.json backup success!"
  else
    echo "No change vscode settings.json"
  fi
fi

# keybindings.json
if [ -f "$HOME$vscode$keybindings" ]; then
  keybindings_diff=$(diff "$HOME$vscode$keybindings" "$HOME$directory$keybindings")

  if [ -n "$keybindings_diff" ]; then
    cat "$HOME$vscode$keybindings" >"$HOME$directory$keybindings"
    echo "vscode keybindings.json backup success!"
  else
    echo "No change vscode keybindings.json"
  fi
fi

# extensions

code --list-extensions >temp.list

if [ ! -f "$HOME$directory$extensionlist" ]; then
  touch $HOME$directory$extensionslist
fi

extensionsdiff=$(diff temp.list "$HOME$directory$extensionlist")

if [ -n "$extensionsdiff" ]; then
  cat temp.list >"$HOME$directory$extensionlist"
  echo "vscode extensions backup success!"
else
  echo "No change vscode extensions.list"
fi

rm -rf temp.list
