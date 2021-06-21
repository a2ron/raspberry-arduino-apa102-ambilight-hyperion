#!/usr/bin/env bash
response=$(curl -s $1)
state_on=$(echo "$response" | /bin/grep "ON" | wc -c)
if [ "$state_on" ==  "0" ]; then
    state_on=0;
else 
    state_on=1;
fi
exit $state_on