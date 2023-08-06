#!/bin/bash

brew install --cask visual-studio-code
cp -r $HOME/setup/settings.json ~/Library/Application\ Support/code/User
cp -r $HOME/setup/keybindings.json ~/Library/Application\ Support/code/User
cat $HOME/setup/extensions.list | xargs -L 1 code --install-extension
