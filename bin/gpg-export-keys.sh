#!/usr/bin/env bash
set -e
key=$1
if [ gpg2 --list-keys "$key" >/dev/null 2>&1 ]; then
  echo Key \"$key\" was not found
  exit 1
fi
gpg2 --armor --export "$key" > ./public.key
gpg2 --armor --export-secret-key "$key" > ./private.key
chmod 600 ./private.key
