#!/bin/bash

sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac

# Directory that contains CM build scripts
BUILD_SCRIPT_DIR=~/android

## END EDIT ##

cd $BUILD_SCRIPT_DIR

if [ ! -e ./repo_sync_lineage15 ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./start_build_signed_lineage15 ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_lineage15 ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_lineage15 ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Creating Changelog."
echo ""
./make_changelog_lineage15
echo ""
echo "Building ROM."
echo ""
./start_build_signed_lineage15
echo ""
echo "Updating Web Server."
echo ""
./update_web_lineage15

