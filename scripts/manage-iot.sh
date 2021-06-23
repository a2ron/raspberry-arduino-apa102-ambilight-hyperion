#!/bin/bash

COMMAND_FILE="/home/pi/iot.command"
COMMAND_MANAGED_FILE="/home/pi/iot.command.managed"
for i in $(seq 1 119); do
    date_command=$(cat $COMMAND_FILE | head -1)
    date_managed=$(cat $COMMAND_MANAGED_FILE | head -1)
    if [[ $date_managed -lt $date_command || $1 == "--force" ]]; then
        date +%s >$COMMAND_MANAGED_FILE

        endpointId=$(cat iot.command | tail -1 | awk -F% '{print $2}')
        powerState=$(cat iot.command | tail -1 | awk -F% '{print $3}')
        scene=$(cat iot.command | tail -1 | awk -F% '{print $4}')
        brightness=$(cat iot.command | tail -1 | awk -F% '{print $5}')
        h=$(cat iot.command | tail -1 | awk -F% '{print $6}')
        s=$(cat iot.command | tail -1 | awk -F% '{print $7}')
        l=$(cat iot.command | tail -1 | awk -F% '{print $8}')

        if [[ $endpointId == "a2-raspi-hdmi-panasonic" ]]; then

            if [[ $powerState == "OFF" ]]; then
                echo 'standby 0' | cec-client -s -d 1
            elif [[ $powerState == "ON" ]]; then
                echo 'on 0' | cec-client -s -d 1
            fi

        elif [[ $endpointId == "a2-emulator" ]]; then

            if [[ $powerState == "OFF" ]]; then
                sudo reboot
            elif [[ $powerState == "ON" ]]; then
                screen -d -m emulationstation
            fi
        elif [[ $endpointId == "a2-light-v3-lamparita" ]]; then
            /home/pi/scripts/sonoff/turnLamp.sh $powerState
        elif [[ $endpointId == "a2-light-v3" ]]; then

            sudo service hyperion status | grep "(running)" >>/dev/null
            status=$?
            echo "status $status"

            if [[ $powerState == "OFF" ]]; then
                if [ $status == 0 ]; then
                    sudo service hyperion stop
                fi
            elif [[ $powerState == "ON" ]]; then
                if [ $status != 0 ]; then
                    /home/pi/scripts/hyperion/init.sh start
                fi
                if [ "$brightness" != "" ]; then
                    b=$(awk -v b=$brightness 'BEGIN { print b }')
                    hyperion-remote -L $b
                fi
                if [ "$scene" == "SetColor" ]; then
                    l=$(awk -v l=$l 'BEGIN { print l / 2 }')
                    rgbHex=$(/home/pi/scripts/hyperion/hsl2rgb.py $h $s $l)
                    hyperion-remote -c $rgbHex
                elif [ "$scene" != "" ]; then
                    hyperion-remote -e "$scene"
                fi
            fi
        fi
    fi
    sleep 0.5
done
