#!/usr/bin/env bash
if [ $# -ne 1 ]
  then
    echo "usage:"
    echo "$0 <open_api_http_url>"
    exit 1
fi

URL=$1

echo "# API"

if [[ $URL == *"yaml"* ]]; then
curl -s "$URL" | yq e '.paths ' - | grep -A 1 -E "^/api" | 
	sed 's/^\s*//' | grep -v "\-\-" | sed 'N;s/\n/ /' | sed 's/:$//' | 
 	sed 's/\(.*\) \(.*\)/{% swagger src=".\/ds_openapi.yaml" path=\"\1\" method=\"\2\" %} [ds_openapi.yaml](.\/ds_openapi.yaml) {% endswagger %}/'
else
curl -s "$URL" |
  jq '.paths | to_entries | map("path=" + (.key | tojson)  + " method=" + (.value | keys[] | tojson)) ' |
  sed '1d' | # remove first line
  sed '$d' | # remove last line
  sed 's/,$//' | # remove end line comas
  sed 's/^\s*//' | # remove trailing spaces
  sed 's/^"\(.*\)"$/\1/' | # remove double quotes
  sed 's/\\\"/"/g' | # remove escaped json double quotes
  sed 's/\(.*\)/{% swagger src=".\/ds_openapi.json" \1 %} [ds_openapi.json](.\/ds_openapi.json) {% endswagger %}/' # finally generate proper gitbook lines
fi
