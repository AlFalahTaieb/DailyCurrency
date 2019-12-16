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
    echo "<h3> :shipit: [$DATE] :shipit: </h3>"
    GIT_PAGER=cat git log --no-merges --format=">$FORMAT<br>" --since=$DATE --until=$NEXT 
    NEXT=$DATE 
done > CHANGELOG.md 
#
#git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags  |grep -v '^$' | while read TAG ; do
 #   TAG_DATE=$(git log -1 --pretty=tformat:%cd --date=short $TAG)
 #   if [ $NEXT ];then
 #       TAG_DATE=$(git log -1 --pretty=tformat:%cd --date=short $NEXT)
 #       echo "\n\n#### $NEXT / $TAG_DATE" >> $CHANGELOG_FILE
 #   else
 #       echo "#### [Current] / $TAG_DATE" >> $CHANGELOG_FILE
 #   fi
 #   GIT_PAGER=cat git log --pretty=format:"$FORMAT" $TAG..$NEXT >> $CHANGELOG_FILE
 #   NEXT=$TAG
#done

#FIRST=$(git tag -l | head -1)
#TAG_DATE=$(git log -1 --pretty=tformat:%cd --date=short $FIRST)
#echo "## $FIRST / $TAG_DATE" >> $CHANGELOG_FILE
#GIT_PAGER=cat git log --pretty=format:"$FORMAT" $FIRST >> $CHANGELOG_FILE