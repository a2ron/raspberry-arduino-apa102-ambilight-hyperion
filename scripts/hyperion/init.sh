#!/bin/bash
date
if [ "$1" == "start" ]; then
    sudo service hyperion start
    sleep 3
else
    sleep 15
fi
hyperion-remote -m 0.7
echo "--------------------------------------"
