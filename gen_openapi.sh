#!/usr/bin/env bash

echo "# API"

curl -s localhost:8080/api/openapi |
  jq  '.paths | to_entries | map("path=" + (.key | tojson)  + " method=" + (.value | keys[] | tojson)) ' |
  sed '1d' | # remove first line
  sed '$d' | # remove last line
  sed 's/,$//' | # remove end line comas
  sed 's/^\s*//' | # remove trailing spaces
  sed 's/^"\(.*\)"$/\1/' | # remove double quotes
  sed 's/\\\"/"/g' | # remove escaped json double quotes
  sed 's/\(.*\)/{% swagger src=".\/ds_openapi.json" \1 %} [ds_openapi.json](.\/ds_openapi.json) {% endswagger %}/' # finally generate proper gitbook lines