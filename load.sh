#!/bin/bash

JAR=$1
VERS=$2

if [ -z "$JAR" -o -z "$VERS" ] ; then
  echo "Usage: load.sh <path to launcher.jar> <version>"
  exit 2
fi
git checkout -b docs$VERS

mkdir temp
pushd temp
jar xvf $JAR docs
popd
cp -r temp/docs/* .
rm -rf temp
git add .
cat <<END
Now run:
    git commit -m 'Added docs version $VERS'
    git push origin docs$VERS
END
