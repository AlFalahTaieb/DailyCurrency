#!/bin/bash
# Generates changelog day by day
RED="\033[1;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
PURPLE="\033[1;35m"
CYAN="\033[1;36m"
WHITE="\033[1;37m"
RESET="\033[0m"



CHANGELOG_FILE=CHANGELOG.md
FORMAT=" %s - $COMMITREF "
COMMITREF="[%h](../../commit/%h)"
if [ "$CHANGELOG_FILE"  != "" ]; then
  rm -rf $CHANGELOG_FILE
  touch $CHANGELOG_FILE
fi

    BASE_STRING=`cat VERSION`
    BASE_LIST=(`echo $BASE_STRING | tr '.' ' '`)
    V_MAJOR=${BASE_LIST[0]}
    V_MINOR=${BASE_LIST[1]}
    V_PATCH=${BASE_LIST[2]}
    echo -e "${NOTICE_FLAG} Current version: ${WHITE}$BASE_STRING"
    echo -e "${NOTICE_FLAG} Latest commit hash: ${WHITE}$LATEST_HASH"
    V_MINOR=$((V_MINOR + 1))
    V_PATCH=0
    SUGGESTED_VERSION="$V_MAJOR.$V_MINOR.$V_PATCH"
    echo -ne "${QUESTION_FLAG} ${CYAN}Enter a version number [${WHITE}$SUGGESTED_VERSION${CYAN}]: "
    read INPUT_STRING
    if [ "$INPUT_STRING" = "" ]; then
        INPUT_STRING=$SUGGESTED_VERSION
    fi
    echo -e "${NOTICE_FLAG} Will set new version to be ${WHITE}$INPUT_STRING"
    echo $INPUT_STRING > VERSION
echo "# CHANGELOG" >> $CHANGELOG_FILE
NEXT=$(date +%F)
echo "CHANGELOG"
echo ----------------------
git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
    echo
    #echo "<h3> :shipit: [$DATE] :shipit: </h3>"
    echo "## [$DATE] : $INPUT_STRING "
    GIT_PAGER=cat git log --no-merges --format=">$FORMAT - v$BASE_STRING <br>" --since=$DATE --until=$NEXT 
    NEXT=$DATE 
    
done > CHANGELOG.md 
