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
STARTING_DATE="2019-12-16 00:00:00"
getVersion(){
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
}

#cat temp.md | awk '$2!=prev{print (prev=$2 ":") }  {print $s}'   > test.md
CHANGELOG_FILE=CHANGELOG.md

deploy(){
COMMITREF="[%h](../../commit/%h)"
FORMAT=" %s - $COMMITREF "

echo "# CHANGELOG" >> $CHANGELOG_FILE
NEXT=$(date +%F)
echo "CHANGELOG"
echo "$DATE"
echo ----------------------
git log --no-merges --format="%cd" --date=short --since="2019-12-13 00:00:00:" --until="$DATE 24:00:00"  | sort -u -r | while read DATE ; do
    echo
    #echo "<h3> :shipit: [$DATE] :shipit: </h3>"
    echo "## [$DATE]"
       # GIT_PAGER=cat git log --no-merges --format=">$FORMAT <br>" --after="$DATE 00:00:00" --until="$DATE 24:00:00"  |   sort -g |  sed -n -e '/📦/{p;n;}' -e '/🐛/{p;n;}' -e '/🚀/{p;n;}' -e '/📦/{p;n;}' -e '/✅/{p;n;}' 
    GIT_PAGER=cat git log  --format="$FORMAT <br>" --since="2019-12-13 00:00:00:" --until="$DATE 24:00:00"  | sed  '
s/🐛Fix:/:bug: FIX: /g ; 
s/👌IMPROVE:/:ok_hand: IMPROVE: /g;
s/:book:IMPROVE:Improve/:book: IMPROVE: /g;
s/📦NEW/:package: NEW:/g;
s/🚀RELEASE:/:rocket: RELEASE: /g;
s/✅TEST/:white_check_mark: TEST: /g;
s/📖DOC:/:book: DOC: /g' |   sort -k2 -n  | less  | awk -F"\t" '/[NEW|IMPROVE|FIX|RELEASE|DOC|TEST]/ ' |  awk  '
prev!=$1  { prev=$1 ; printf "%s>%s <br>", NR==$1? ":" : ORS, $1 $2 , ORS }
prev==$1 { for (i=3;i<=NF; i++){
   printf "%s%s", $i, i==NF ? ORS : OFS
   
   } 
   
   }
'  

#    NEXT=$DATE 

done >  CHANGELOG.md 

#cat diff temp.md CHANGELOG.md

}


if [ "$CHANGELOG_FILE"  != "" ]; then
  rm -rf $CHANGELOG_FILE
  touch $CHANGELOG_FILE
fi
: '
echo "### Select the Operation you want to perform ###"
echo "  1)Versioning & Deploy "
echo "  2)Deploy"

read n
case $n in
  1) getVersion; deploy;;
  2) deploy;;
esac
'

#getVersion
deploy