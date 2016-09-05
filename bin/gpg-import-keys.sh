#!/usr/bin/env bash
set -e
path=$1
gpg2 --import "${path}/public.key"
gpg2 --allow-secret-key-import --import "${path}/public.key"
