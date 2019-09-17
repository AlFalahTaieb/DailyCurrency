#!/bin/sh


. /home/taieb/Bureau/Bash/autobotnews/secret


getInfo(){
    
    result= curl -s  "http://data.fixer.io/api/latest?access_key=$APIKEY&format=1/" | jq '.timestamp,.base,.rates.TND,.rates.USD,.rates.BTC'
    echo $result
    
}

extract(){
    now=$(date '+%F à %H:%M:%S')

    timeupdate=$(head -n 1 currency.json)
    base=$(sed '2q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    tnd=$(sed '3q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    usd=$(sed '4q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    btc=$(sed '5q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    # echo $base
    
    echo  "## Getting daily currency, This automated script is using [jq](https://stedolan.github.io/jq/)\n""## Last Update: " $now"\n ""# Monaie de base : 1" $base 💶 "\n" "# Equivaut en 🇹🇳 à : " $tnd "\n" "# Equivaut en 💵 à :" $usd"\n" "# Equivaut en 🐱‍💻 à : " $btc > README.md

}

push(){
git add "/home/taieb/Bureau/Bash/autobotnews/" .
git commit -m "Currency updated @ $now" "/home/taieb/Bureau/Bash/autobotnews/" 
git push "/home/taieb/Bureau/Bash/autobotnews/"
}

getInfo > /home/taieb/Bureau/Bash/autobotnews/currency.json
extract
push
