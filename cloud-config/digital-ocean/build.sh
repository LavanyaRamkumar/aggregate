#!/usr/bin/env bash

pubKeyPath=$1;
domain=$2;
pubKeyEscaped=$(cat ${pubKeyPath} | sed -e 's/\//\\\//g')

cat ./cloud-config.yml.tpl | \
  sed -e 's/{{pubKey}}/'"${pubKeyEscaped}"'/g' | \
  sed -e 's/{{forceHttps}}/true/g' | \
  sed -e 's/{{domain}}/'"${domain}"'/g' | \
  sed -e 's/{{httpPort}}/80/g' | \
  sed -e 's/{{aggregateWarUrl}}/https:\/\/s3.amazonaws.com\/odk\/aggregate.war/g' \
  > cloud-config.yml

echo "CloudConfig script generated at $(pwd)/cloud-init.yml"

