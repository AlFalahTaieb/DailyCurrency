#!/bin/sh

cat Test.md | awk  '
prev!=$1 { prev=$1; printf "%s%s <br>%s", NR==1 ? "" : ORS, $1, ORS }
prev==$1 { for (i=2;i<=NF; i++){ printf "%s%s", $i, i==NF ? ORS : OFS} }
'  > final.md

