#!/bin/sh
# The page is rendered from base64 YAML in the URL.
set -e
H=http://web:5000
B=$(printf "yaml: probe%s" $$ | base64 | tr -d "\n")
curl -fsS "$H/information/$B" | grep -q "probe$$"
