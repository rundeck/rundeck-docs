#!/bin/bash

set -e

JAR=$1
VERS=$2
SKIPBRANCH=$3
 
if [ -z "$JAR" -o -z "$VERS" ] ; then
  echo "Usage: load.sh <path to docs.zip> <version>"
  exit 2
fi
if [ "--skip" != "${SKIPBRANCH}" ] ; then
    git checkout -b docs$VERS
fi


mkdir temp
cd temp
echo unzip $JAR html
unzip $JAR
cd -
cp -r temp/html/* .
rm -rf temp
git add .
cat <<END
Now run:
    git commit -m 'Added docs version $VERS'
    git push origin docs$VERS
END
