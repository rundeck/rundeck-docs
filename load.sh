#!/bin/bash

JAR=$1
VERS=$2
SKIPBRANCH=$3

if [ -z "$JAR" -o -z "$VERS" ] ; then
  echo "Usage: load.sh <path to launcher.jar> <version>"
  exit 2
fi
if [ "--skip" != "${SKIPBRANCH}" ] ; then
    git checkout -b docs$VERS
fi

mkdir temp
pushd temp
echo jar xvf $JAR docs
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
