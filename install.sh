#!/bin/bash

# Ensure that the script is run from the project directory
if [ "$0" != "./install.sh" ];
then
  echo "Please run ./install.sh from within the project directory"
fi

# Create necessary directories and set permissions
mkdir .tmp credentials downloads processed
chmod 700 .tmp credentials downloads processed

# Set permissions and install location for scripts
chmod 744 process.sh search.sh update.sh
sed -i -E "s,install_location=(.*),install_location=\"$(pwd)\"," "process.sh"
sed -i -E "s,install_location=(.*),install_location=\"$(pwd)\"," "search.sh"
sed -i -E "s,install_location=(.*),install_location=\"$(pwd)\"," "update.sh"

# Clear up git and install files
rm -f install.sh README.md
rm -rf .git
