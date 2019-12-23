#!/bin/sh
LC_ALL=C 
#cat CHANGELOG.md
working(){
FORMAT=" %s - $COMMITREF "
git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
git log  --format="$FORMAT <br>" --since="$DATE 00:00:00:" --until="$DATE 24:00:00" | sort -r | less  | awk  '
prev!=$1  { prev=$1 ; printf "%s%s <br>", NR==$1? "" : ORS, $1 $2 $3, ORS }
prev==$1 { for (i=4;i<=NF; i++){ printf "%s%s", $i, i==NF ? ORS : OFS} }
'  
done > final.md
}

testing(){
FORMAT=" %s - $COMMITREF "

git log --no-merges --format="%cd" --date=short | sort -u -r | while read DATE ; do
git log  --format="$FORMAT <br>" --since="$DATE 00:00:00:" --until="$DATE 24:00:00"  | sort -k2 -n  | less  | 
awk -F"\t" '/[NEW|IMPROVE|FIX|RELEASE|DOC|TEST]/ ' |  awk  '
prev!=$1  { prev=$1 ; printf "%s%s <br>", NR==$1? "" : ORS, $1 $2 , ORS }
prev==$1 { for (i=3;i<=NF; i++){
   printf "%s%s", $i, i==NF ? ORS : OFS
   
   } 
   
   }
' 
done > final.md
}

#str = '📦 NEW:  Updating message depending of hour'

testing

del(){
'
BEGIN { regex="^([A-Z0-9]+|[A-Z]+ [0-9]+)" }     # set regex to match "first field"
{ match($0, regex, a); f1=a[0] }                 # set "first field" as f1
prev!=f1 {
  prev=f1                                        # use f1 instead of $1 as previous field
  printf "%s%s :%s", NR==1 ? "" : ORS, prev, ORS # copy & paste from script above
}
prev==f1 { 
  sub(regex" ", "") # remove "first field" and the following space character from $0
  print             # print the line (now without "first field")
}'

}