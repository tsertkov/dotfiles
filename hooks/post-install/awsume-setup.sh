#!/usr/bin/env bash

set -e

AWSUME_SRC_SCRIPT=~/.awsume/zsh-autocomplete/_awsume

[ -f "$AWSUME_SRC_SCRIPT" ] && exit

echo "awsume-setup: Setting up awsume autocomplete"
awsume-configure --shell zsh --alias-file /dev/null --autocomplete-file /dev/null 
