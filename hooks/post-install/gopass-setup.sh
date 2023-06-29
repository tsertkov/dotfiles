#!/usr/bin/env bash

set -e

GOPASS_DEST_SCRIPT=$(/bin/cat ${HOME}/.dotfiles-dir)/var/zsh-site-functions/_gopass

# exit if autocomplete script is already installed
[ -f "$GOPASS_DEST_SCRIPT" ] && exit

# exit if gopass is not available
[ ! command -v gopass &> /dev/null ] && exit

# get autocomplete script source
GOPASS_SRC="$(gopass completion zsh 2>/dev/null)"
if [ -z "$GOPASS_SRC" ]; then
  echo "gopass-setup: Installed gopass does not support zsh completion."
fi

echo "gopass-setup: Setting up gopass autocomplete."
echo "$GOPASS_SRC" > "$GOPASS_DEST_SCRIPT"
