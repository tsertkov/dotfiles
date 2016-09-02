#!/usr/bin/env sh

brew install \
  git \
  trash \
  watch \
  lesspipe \
  htop \
  wget \
  fasd \
  ssh-copy-id \
  exiftool \
  pass \
  terminal-notifier \
  the_silver_searcher \
  p7zip \
  jsonpp \
  jq \
  lnav \
  pinentry-mac \
  homebrew/versions/gnupg21

# Should be installed last to make sure user will read messages
# about manual postinstall actions required to use zsh
brew install zsh