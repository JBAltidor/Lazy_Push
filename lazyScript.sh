#!/bin/bash
n=1  #To count commits
greenback="\0033[1;37;42m" #to change text color/background
resetvid="\0033[0m"

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

#Infinite loop to do the work
while :
do 
    if [ -d .git ]; then #if it's a git repo
        git status #get the status
        git pull #Pull changes 
        git add .; #Add all files
        git commit -m " Lazy Push "
        git push
        echo -e "$greenback Commit $n was made $resetvid"
        n=$(($n + 1));
    else
        echo "Sorry,no Git Repo here"
    fi;
    d=$(($scale * 60));
    sleep $d;
done