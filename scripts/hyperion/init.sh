#!/bin/bash
date
if [ "$1" == "start" ]; then
    sudo service hyperion start
    sleep 3
else
    sleep 15
    hyperion-remote -L 70
    hyperion-remote -e "Full color mood blobs"
fi
