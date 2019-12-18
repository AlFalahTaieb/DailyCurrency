#!/bin/sh

cat CHANGELOG.md | awk  '
prev!=$1  { prev=$1 ; printf "%s%s <br>", NR==$1? "" : ORS, $1 $2 $3, ORS }
prev==$1 { for (i=2;i<=NF; i++){ printf "%s%s", $i, i==NF ? ORS : OFS} }
'  > final.md


#str = '📦 NEW:  Updating message depending of hour'
