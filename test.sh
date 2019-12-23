#!/bin/sh

FORMAT=" %s - $COMMITREF "
COMMITREF="[%h](../../commit/%h)"
#echo "# CHANGELOG" >> $CHANGELOG_FILE
NEXT=$(date +%F)
echo "CHANGELOG"
echo "$DATE"
echo ----------------------
git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
    echo
    #echo "<h3> :shipit: [$DATE] :shipit: </h3>"
    echo "## [$DATE]"
git log  --format="$FORMAT <br>" --since="$DATE 00:00:00:" --until="$DATE 24:00:00"  | sort -k2 -n  | less  | awk -F"\t" '/[NEW|IMPROVE|FIX|RELEASE|DOC|TEST]/ ' |  awk  '
prev!=$1  { prev=$1 ; printf "%s>%s <br>", NR==$1? ":" : ORS, $1 $2 , ORS }
prev==$1 { for (i=3;i<=NF; i++){
   printf "%s%s", $i, i==NF ? ORS : OFS
   
   } 
   
   }
'  | awk -
NEXT=$DATE 
done > CHANGELOG.md

