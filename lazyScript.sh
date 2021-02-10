#!/bin/bash
n=1
echo "Lazy Pull/Pusher"
echo "Enter the update interval (in minutes) between each push (15 => 15 mins between updates)"
#Getting interval (integers only)
until [[ "$scale" =~ ^[0-9]+$ ]];
do
read -p "Interval : " scale
if ! [[ "$scale" =~ ^[0-9]+$ ]]
    then
        echo "Sorry integers only"
fi
done

greenback="\0033[1;37;42m"
resetvid="\0033[0m"

while :
do 
    if [ -d .git ]; then
        git status
        git pull
        git add .;
        git commit -m " Lazy Push "
        git push
        echo "$greenback Commit $n was made $resetvid"
        n=$(($n + 1));
    else
        echo "Sorry,no Git Repo here"
    fi;
    d=$(($scale * 60));
    sleep $d;
done