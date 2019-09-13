#/usr/bin/env bash


. /home/taieb/Bureau/Bash/autobotnews/secret


getInfo(){
    curl https://newsapi.org/v2/sources?apiKey=$APIKEY
}

getInfo