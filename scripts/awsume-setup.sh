#!/usr/bin/env bash

set -e

AWSUME_SRC_SCRIPT=~/.awsume/zsh-autocomplete/_awsume
AWSUME_DEST_SCRIPT=~/dotfiles/zsh-site-functions/_awsume

[ ! -f "$AWSUME_SRC_SCRIPT" -o -s "$AWSUME_DEST_SCRIPT" ] && exit

echo "awsume-setup: Setting up awsume autocomplete"
ln -sf "$AWSUME_SRC_SCRIPT" "$AWSUME_DEST_SCRIPT"
