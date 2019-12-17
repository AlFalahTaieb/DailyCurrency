#cat temp.md | awk '$2!=prev{print (prev=$2 ":") }  {print $s}' | sort -g   > test.md

changeEmojiDependingtohour(){
    a=5
    b=10
    c=15
    d=20
    emojitoUse=''



    if [ $(date +%H) -lt "$a" ]
    then
        emojitoUse = '📦 NEW: '
         $emojitoUse
    elif [ $(date +%H) -lt "$b" ]
    then
        emojitoUse = '🐛 Fix: '
         $emojitoUse
    elif [ $(date +%H) -lt "$c" ]
    then
        emojitoUse -lt '🚀 RELEASE: '
         $emojitoUse
    elif [ $(date +%H) -lt "$d" ]
    then emojitoUse= '✅ TEST : '
        $emojitoUse
    fi

    }

    changeEmojiDependingtohour

    echo $emojitoUse