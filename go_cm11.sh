#!/bin/bash

sudo update-alternatives --set java /usr/lib/jvm/java-6-oracle/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-6-oracle/bin/javac
sudo update-alternatives --set javap /usr/lib/jvm/java-6-oracle/bin/javap

# Directory that contains CM build scripts
BUILD_SCRIPT_DIR=~/android

## END EDIT ##

cd $BUILD_SCRIPT_DIR

if [ ! -e ./repo_sync_cm11 ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./start_build_cm11 ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_cm11 ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_cm11 ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Creating Changelog."
echo ""
./make_changelog_cm11
echo ""
echo "Building ROM."
echo ""
./start_build_cm11
echo ""
echo "Updating Web Server."
echo ""
./update_web_cm11

sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-8-openjdk-amd64/bin/javac
sudo update-alternatives --set javap /usr/lib/jvm/java-8-openjdk-amd64/bin/javap
