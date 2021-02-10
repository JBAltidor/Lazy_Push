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


# do
#     if [ -d .git ]; then
#         git status
#         git pull
#         git add .;
#         git commit -m " Lazy Push "
#         git push
#         echo "Commit $n Made"
#         n=$(($n + 1));
#     else
#         echo "Sorry,no Git Repo here"
#     fi
#     d=$(($scale * 60));
#     sleep $d;
# done

while :

do 
    if [ -d .git ]; then
        echo "This is the current Repo Status"
        git status
        git add .;
        git commit -m " Lazy Push "
        git push
        echo "Commit $n Made"
        n=$(($n + 1));
    else
        echo "Fatal! This is Not a Git Repo"
        git rev-parse --git-dir 2> /dev/null;
    fi;
    d=$(($scale * 60));
    sleep $d;
done