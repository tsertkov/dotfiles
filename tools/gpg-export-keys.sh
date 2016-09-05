#!/usr/bin/env bash
set -e
key=$1
gpg2 --list-keys "$key" >/dev/null 2>&1 || echo Key \"$key\" was not found && exit 1
gpg2 --export --armor "$key" > ./public.key
gpg2 --export-secret-key --armon "$key" > ./private.key
