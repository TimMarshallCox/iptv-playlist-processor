#!/bin/bash

install_location=""

# Check that at least one argument has been given
if [ -z "$1" ];
then
  echo "Please specify a playlist to process"
  exit 1
fi

# Check which playlists to process
if [ "$1" == "all" ];
then
  echo "Processing all"
  cd "$install_location/downloads"
  playlist_array=(*)
else
  playlist_array=( "$@" )
fi

for playlist in "${playlist_array[@]}";
do
  echo "Processing $playlist"

  # Check that the specified playlist exists
  if [ -f "$install_location/downloads/$playlist" ];
  then
    # Copy raw file
    cp "$install_location/downloads/$playlist" "$install_location/.tmp/$playlist"
    
    # Remove first line
    sed -i '1d' "$install_location/.tmp/$playlist"

    # Reformat title line
    sed -i -E "s/#EXTINF(.*)\,(.*)/\2/g" "$install_location/.tmp/$playlist"

    # Move processed playlist
    mv "$install_location/.tmp/$playlist" "$install_location/processed/$playlist"
  else
    echo "\"$playlist\" playlist does not exist"
  fi
done
