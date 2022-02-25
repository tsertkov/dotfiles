#!/usr/bin/env bash

set -e
echo "Flushing DNS cache for macOS"
sudo dscacheutil -flushcache \
  && sudo killall -HUP mDNSResponder
