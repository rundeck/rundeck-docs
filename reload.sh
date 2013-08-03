#!/bin/bash

set -e

JAR=$1
VERS=$2


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
    git commit -m 'Updated docs version $VERS'
    git push origin docs$VERS
END
