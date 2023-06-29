#!/usr/bin/env bash

set -e

GITCONFIG=~/.gitconfig.local

# check if config file already exits
test -f "$GITCONFIG" && exit 0

# create new config file
cat > "$GITCONFIG" <<- EOT
[user]
  name = $(whoami)
  email = $(whoami)@example.com
EOT

echo "git-setup: Created dummy $GITCONFIG file."
