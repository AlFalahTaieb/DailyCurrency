#!/bin/bash
# Generates changelog day by day

CHANGELOG_FILE=CHANGELOG.md
FORMAT=" %s - $COMMITREF "
COMMITREF="[%h](../../commit/%h)"
if [ "$CHANGELOG_FILE"  != "" ]; then
  rm -rf $CHANGELOG_FILE
  touch $CHANGELOG_FILE
fi

echo "# CHANGELOG" >> $CHANGELOG_FILE
NEXT=$(date +%F)
echo "CHANGELOG"
echo ----------------------
git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
    echo
    #echo "<h3> :shipit: [$DATE] :shipit: </h3>"
    echo "## [$DATE]"
    GIT_PAGER=cat git log --no-merges --format=">$FORMAT<br>" --since=$DATE --until=$NEXT 
    NEXT=$DATE 
    
done > CHANGELOG.md 

