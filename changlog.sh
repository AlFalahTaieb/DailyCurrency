#!/bin/sh

CHANGELOG_FILE=CHANGELOG.md
FORMAT=" * [%h](../../commit/%h) - %s"

if [ "$CHANGELOG_FILE"  != "" ]; then
  rm -rf $CHANGELOG_FILE
  touch $CHANGELOG_FILE
fi

echo "# ChangeLog" >> $CHANGELOG_FILE
git for-each-ref --sort='*authordate' --format='%(tag)' refs/tags  |grep -v '^$' | while read TAG ; do
    TAG_DATE=$(git log -1 --pretty=tformat:%cd --date=short $TAG)
    if [ $NEXT ];then
        TAG_DATE=$(git log -1 --pretty=tformat:%cd --date=short $NEXT)
        echo "\n\n#### $NEXT / $TAG_DATE" >> $CHANGELOG_FILE
    else
        echo "#### [Current] / $TAG_DATE" >> $CHANGELOG_FILE
    fi
    GIT_PAGER=cat git log --pretty=format:"$FORMAT" $TAG..$NEXT >> $CHANGELOG_FILE
    NEXT=$TAG
done

FIRST=$(git tag -l | head -1)
TAG_DATE=$(git log -1 --pretty=tformat:%cd --date=short $FIRST)
echo "## $FIRST / $TAG_DATE" >> $CHANGELOG_FILE
GIT_PAGER=cat git log --pretty=format:"$FORMAT" $FIRST >> $CHANGELOG_FILE


#git log --pretty=format:"%h%x09%an%x09%ad%x09%s"
