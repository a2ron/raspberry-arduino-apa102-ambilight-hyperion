for path in "scripts"; do
    rsync -r -e "ssh " $path $PI_HOST:
done
ssh $PI_HOST "./scripts/install.sh"
ssh $PI_HOST "./scripts/install-thinger.io.1.sh"
for path in "Linux-Client"; do
    rsync -r -e "ssh " $path $PI_HOST:
done
ssh $PI_HOST "./scripts/install-thinger.io.2.sh"
ssh $PI_HOST "./scripts/install-screen.sh"
ssh $PI_HOST "sudo pkill -9 manage-iot.sh; crontab /home/pi/scripts/crontab.sh; sudo reboot"
