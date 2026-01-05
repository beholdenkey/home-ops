#!/bin/bash

output="links_output.json"
echo "{" > "$output"
first=1

# Extract all addresses from nodes.yaml
addresses=$(grep 'address:' nodes.yaml | awk '{print $2}')

for addr in $addresses; do
  # Get the links for this address
  links=$(talosctl get links -n "$addr" --insecure | grep 'ens*' | awk '{print $6}' | jq -R . | jq -s .)

  if [ $first -eq 1 ]; then
    first=0
  else
    echo "," >> "$output"
  fi

  echo "  \"$addr\": $links" >> "$output"
done

echo "}" >> "$output"
echo "Results written to $output"
