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
  cd "$install_location/credentials"
  provider_array=(*)
else
  provider_array=( "$@" )
fi

for provider in "${provider_array[@]}";
do
  echo "Updating $provider"

  # Check that the specified credentials exist
  if [ -f "$install_location/credentials/$1" ];
  then
    # Get playlist URL from credentials file
    url=$(head -n1 "$install_location/credentials/$provider")
    
    # Download playlist
    curl -o "$install_location/downloads/$provider" -A "Mozilla/5.0" -L "$url"
  else
    echo "\"$provider\" credentials do not exist"
  fi
done
