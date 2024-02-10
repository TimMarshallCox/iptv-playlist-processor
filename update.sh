#!/bin/bash

install_location=""

# Check that at least one argument has been given
if [ -z "$1" ];
then
  echo "Please specify a playlist to update"
  exit 1
fi

# Check which playlists to update
if [ "$1" == "all" ];
then
  echo "Updating all"
  cd "$install_location/providers"
  provider_array=(*)
else
  provider_array=( "$@" )
fi

for provider in "${provider_array[@]}";
do
  echo "Updating $provider"

  # Check that the specified providers exist
  if [ -f "$install_location/providers/$1" ];
  then
    # Get playlist URL from providers file
    url=$(head -n1 "$install_location/providers/$provider")
    
    # Download playlist
    curl -o "$install_location/downloads/$provider" -A "Mozilla/5.0" -L "$url"
  else
    echo "\"$provider\" providers do not exist"
  fi
done
