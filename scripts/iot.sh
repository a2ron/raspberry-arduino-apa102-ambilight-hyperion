#!/bin/bash
COMMAND_FILE="/home/pi/iot.command"
date +%s > $COMMAND_FILE 
echo "$@" >> $COMMAND_FILE 



