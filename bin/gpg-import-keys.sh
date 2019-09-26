#!/usr/bin/env bash
set -e
path=$1
gpg --import "${path}/public.key"
gpg --allow-secret-key-import --import "${path}/private.key"
