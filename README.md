1. Burn Hyperbian (https://docs.hyperion-project.org/en/user/HyperBian.html)
2. Enable SSH 
```bash
SD_CARD_MOUNT_POINT="<the_path_to_your_SD_Card>"

# for OSMC/LIBREELEC images
cp "$SD_CARD_MOUNT_POINT/cmdline.txt" "$SD_CARD_MOUNT_POINT/cmdline.txt.bk"
sed -i 's/$/ ssh/' "$SD_CARD_MOUNT_POINT/cmdline.txt"

#for raspbian and hyperbian
export SD_CARD_MOUNT_POINT="/Volumes/boot/"
touch "$SD_CARD_MOUNT_POINT/ssh" 
```
3. Upload [arduino code](adalight-apa102-arduino-uno/arduino-apa102-leds-controller/arduino-apa101-leds-controller.ino) with [Arduino IDE](https://www.arduino.cc/en/main/software)

4. Setup [Hyperion](https://docs.hyperion-project.org/en/user/Configuration.html)

5. Configure Arduino: Load [Hyperion Config](adalight-apa102-arduino-uno/hyperion.config.json)

6. Configure Rapsberry

You need to create your `.env` file like `.env.sample`.

```bash
source .env
./install.sh
```