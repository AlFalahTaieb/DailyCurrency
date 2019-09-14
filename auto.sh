#!/bin/bash


. /home/taieb/Bureau/Bash/autobotnews/secret


getInfo(){

    result= curl -s  "http://data.fixer.io/api/latest?access_key=$APIKEY&format=1/" | jq '.timestamp,.base,.rates.TND'
    # echo "$id"
    # echo $result | jq -r '.rates.TND' 

    echo $result

}

extract(){
    # test= cat test.json | jq '.timestamp,.base,.rates.TND, .rates.USD' 
    timeupdate=  test.json |  jq '.timestamp'
    base= cat test.json |  jq '.base'
    tnd= cat test.json |  jq '.rates.TND'
    usd= cat test.json |  jq '.rates.USD'

    # echo $base
}
getInfo
# getInfo > test.json

# extract