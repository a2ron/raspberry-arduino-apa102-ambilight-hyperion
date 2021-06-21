for path in "Linux-Client scripts"; do
    rsync -r -e "ssh -i $ID_RSA" $path $PI_HOST:; 
done
SCRIPT="${1:-scripts/install.sh}"
echo ">"
ssh -i $ID_RSA $PI_HOST "/home/pi/$SCRIPT" 
