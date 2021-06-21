#!/usr/bin/env bash
source /home/pi/scripts/sonoff/credentials.ignore.sh
/home/pi/scripts/sonoff/lamp-connector.sh $SONOFF_HOST/ay
state="$?"
exit $state