#!/bin/bash
echo "Lazy Pull/Pusher"
echo "Enter the update interval (in minutes) between each push (15 => 15 mins between updates)"
read scale

until ([[ "$scale" =~ ^[0-9]+$ ]]);
{
    
}
if ! [[ "$scale" =~ ^[0-9]+$ ]]
    then
        echo "Sorry integers only"
fi


n = 1