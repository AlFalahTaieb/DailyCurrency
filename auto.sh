#!/bin/sh


. /home/taieb/Bureau/Bash/autobotnews/secret
changeEmojiDependingtohour(){
    a=5
    b=10
    c=15
    d=23
    messageEmoji=""
    if [ $(date +%H) -le "$a" ]
    then
       echo ':package: NEW: '
         # echo $messageEmoji
    elif [ $(date +%H) -le "$b" ]
    then
        echo ':bug: FIX: '
    elif [ $(date +%H) -le "$c" ]
    then
     echo ':rocket: RELEASE: '

    elif [ $(date +%H) -le "$d" ]
    then echo ':white_check_mark: TEST: '
    fi
    }



getInfo(){
    
    result= curl -s  "http://data.fixer.io/api/latest?access_key=$APIKEY&format=1/" | jq '.timestamp,.base,.rates.TND,.rates.USD,.rates.BTC'
    echo $result
    
}
# getTime(){
#     now=$(date '+%F à %H:%M:%S')
#     echo $now
# }
extract(){
    now=$(date '+%F à %H:%M:%S')
    
    timeupdate=$(head -n 1 currency.json)
    base=$(sed '2q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    tnd=$(sed '3q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    usd=$(sed '4q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    btc=$(sed '5q;d' /home/taieb/Bureau/Bash/autobotnews/currency.json)
    # echo $base
    
 echo  "## Getting daily currency, This automated script is using [jq](https://stedolan.github.io/jq/)\n""## Last Update: " $now</br>"# Monaie de base : 1" $base 💶 </br> "# Equivaut en 🇹🇳 à : " $tnd </br> "# Equivaut en 💵 à :" $usd</br> "# Equivaut en 🐱‍💻 à : " $btc > /home/taieb/Bureau/Bash/autobotnews/README.md    
}

push(){
    
    cd "/home/taieb/Bureau/Bash/autobotnews/"
    git add .
    git commit -m   " $(changeEmojiDependingtohour) Currency updated @ $now"
    git push
}


changeEmojiDependingtohour
getInfo > /home/taieb/Bureau/Bash/autobotnews/currency.json
# getTime > /home/taieb/Bureau/Bash/autobotnews/time.txt
extract
push
