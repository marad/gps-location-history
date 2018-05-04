#!/bin/bash

stack build

cat $@ | jq --compact-output '. + {"tid": "generic", "tst": .timestamp}' | stack exec gps-location-history -- -r regions.json