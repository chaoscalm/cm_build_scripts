#!/bin/bash

sudo update-java-alternatives -s java-1.8.0-openjdk-amd64

# Directory that contains CM build scripts
BUILD_SCRIPT_DIR=~/android

## END EDIT ##

cd $BUILD_SCRIPT_DIR

if [ ! -e ./repo_sync_cm14 ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./start_build_cm14 ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_cm14 ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_cm14 ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Creating Changelog."
echo ""
./make_changelog_cm14
echo ""
echo "Building ROM."
echo ""
./start_build_cm14
echo ""
echo "Updating Web Server."
echo ""
./update_web_cm14

