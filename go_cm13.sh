sudo update-java-alternatives -s java-1.7.0-openjdk-amd64

if [ ! -e ./repo_sync_cm13 ]; then
  echo "Repo sync script is not found"
  exit
fi

if [ ! -e ./start_build_cm13 ]; then
  echo "Start build script is not found"
  exit
fi

if [ ! -e ./make_changelog_cm13 ]; then
  echo "Make changelog script is not found"
  exit
fi

if [ ! -e ./update_web_cm13 ]; then
  echo "Update web script is not found"
  exit
fi

echo ""
echo "Syncing Repos."
echo ""
./repo_sync_cm13
echo ""
echo "Creating Changelog."
echo ""
./make_changelog_cm13
echo ""
echo "Building ROM."
echo ""
./start_build_cm13
echo ""
echo "Updating Web Server."
echo ""
./update_web_cm13
