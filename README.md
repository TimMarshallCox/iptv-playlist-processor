# IPTV Playlist Processor


## Overview

This tool downloads, processes, and searches playlist files.


## Installation

To install, clone the repository and run the `install.sh` script from within the repository directory. This creates the necessary directories for the tool, sets file permissions, and removes the git and installation files.


## Usage

Create a file within the `providers/` directory. The name of this file will be how you refer to this playlist. Add the URL to download the playlist to the first line of this file. The remaining lines of the file are disregarded, so can be used to add notes about each playlist such as date of expiry.


### Update

Once at least one provider file is in place, the `update.sh` script can be run to download the latest version of the playlist. This script takes at least one argument to specify which playlist to update. Multiple playlists can be specified, separated by whitespace. If the first argument is `all`, then all credential files present in `providers/` will be updated; any further arguments will be disregarded.


### Process

Upon completion of the download, the `process.sh` script can be run. This strips out any unnecessary information for more relevant search results. This script also takes at least one argument to specify which playlist to process. Multiple playlists can be specified, separated by whitespace. If the first argument is `all`, then all playlist files present in `downloads/` will be updated; any further arguments will be disregarded.


### Search

Once the playlist has been processed, the `search.sh` script can be run. This simply uses the `grep` utility to locate occurences of the search string within the playlist. The search is case insensitive and uses `grep -E` for extended regular expression support. The first argument is the search string, and the remaining arguments are the playlists to search. If the first specified playlist is `all`, then all playlist files present in `complete/` will be searched; any further arguments will be disregarded.
