#!/usr/bin/env bash
source /home/pi/scripts/sonoff/credentials.ignore.sh
/home/pi/scripts/sonoff/getLampState.sh
lampState=$?
if ([ $1 == "ON" ] &&  [ $lampState == 0 ]) || \
([ $1 == "OFF" ] && [ $lampState == 1 ]); then \
    echo "Turning $1"
    /home/pi/scripts/sonoff/lamp-connector.sh $SONOFF_HOST/ay?o=1
    code=$?
    date +%s > lampAction.last
else
    /home/pi/scripts/sonoff/lamp-connector.sh $SONOFF_HOST/ay
    code=$?
fi

exit $code 