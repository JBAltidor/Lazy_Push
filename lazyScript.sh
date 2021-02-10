#!/bin/bash
echo "Lazy Pull/Pusher"
echo "Enter the update interval (in minutes) between each push (15 => 15 mins between updates)"
# read scale

until [[ "$scale" =~ ^[0-9]+$ ]];
do
read -p "Interval Time: " scale
if ![[ "$scale" =~ ^[0-9]+$ ]]; then
    echo "Sorry integers only"
fi
done
# echo "Is number!"

# while:
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
