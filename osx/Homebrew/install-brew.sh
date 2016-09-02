#!/usr/bin/env bash

if test ! $(which brew); then
  read -p "Confirm installing Homebrew (y/n): [n]" -n 1 -r; echo
  if [ "$REPLY" = "y" ]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    exit
  fi
fi