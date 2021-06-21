
rm screenshot.png;

export RASPI=192.168.1.143

# hyperion-v4l2 --screenshot -d /dev/video0 -v NTSC";
ssh pi@$RASPI "rm screenshot.png; sudo hyperion-v4l2 --screenshot" ;
scp pi@"$RASPI":screenshot.png .; 
pkill Preview
open screenshot.png
