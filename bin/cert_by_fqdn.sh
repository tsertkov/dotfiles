#!/usr/bin/env bash

FQDN="$1"

[ -z "$FQDN" ] && echo "Usage: `basename $0` <fqdn>" && exit 1

echo -n \
  | openssl s_client -connect "${FQDN}:443" \
  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
  | openssl x509 -text -noout
