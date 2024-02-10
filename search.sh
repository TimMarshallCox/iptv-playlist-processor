#!/bin/bash

install_location=""

# Check that a search string has been given
if [ -z "$1" ];
then
  echo "Please specify a search string"
  exit 1
fi

# Check that at least one playlist has been given
if [ -z "$2" ];
then
  echo "Please specify a playlist to search"
  exit 1
fi

# Check which playlists to search
if [ "$2" == "all" ];
then
  echo "Searching all"
  cd "$install_location/processed"
  provider_array=(*)
else
  provider_array=( "${@:2}" )
fi

for provider in "${provider_array[@]}";
do
  echo "Searching $provider"
  if [ -f "$install_location/processed/$2" ];
  then
    # Search for matches in current playlist
    grep -i -A1 "$1" "$install_location/processed/$provider" --no-group-separator
  else
    echo "\"$2\" playlist does not exist"
  fi
done
