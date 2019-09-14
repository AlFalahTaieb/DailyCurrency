#!/bin/bash


. /home/taieb/Bureau/Bash/autobotnews/secret


getInfo(){

    result= curl -s  "http://data.fixer.io/api/latest?access_key=$APIKEY&format=1/" | jq '.timestamp,.base,.rates.TND,.rates.USD'
    # echo "$id"
    # echo $result | jq -r '.rates.TND' 

    echo $result

}

extract(){
    now=`date`
    # file= test.json
    # test= cat test.json | jq '.timestamp,.base,.rates.TND, .rates.USD' 
    timeupdate=$(head -n 1 test.json)
    base=$(sed '2q;d' test.json)
    tnd=$(sed '3q;d' test.json)
    usd=$(sed '4q;d' test.json)
    # echo $base

   echo  "## Current date: $now\n "  "# Monaie de base : "$base "\n" "# Equivaut en 🇹🇳 à : "$tnd > test.md
#     base= cat test.json |  jq '.base'
#     tnd= cat test.json |  jq '.rates.TND'
#     usd= cat test.json |  jq '.rates.USD'
# bash 
    # echo $base
    # echo $timeupdate
    # echo $base
}

# getInfo
# getInfo > test.json

extract