1.  Burn [2020-02-13-raspbian-buster-full.img](vendor/2020-02-13-raspbian-buster-full.img) to the SDCard using https://www.balena.io/etcher/

2. Enable SSH 
```bash
SD_CARD_MOUNT_POINT="<the_path_to_your_SD_Card>"

# for OSMC/LIBREELEC images
cp "$SD_CARD_MOUNT_POINT/cmdline.txt" "$SD_CARD_MOUNT_POINT/cmdline.txt.bk"
sed -i 's/$/ ssh/' "$SD_CARD_MOUNT_POINT/cmdline.txt"

#for raspbian
export SD_CARD_MOUNT_POINT="/Volumes/boot/"
touch "$SD_CARD_MOUNT_POINT/ssh" 
```
3. Upload [arduino code](adalight-apa102-arduino-uno/arduino-apa102-leds-controller/arduino-apa101-leds-controller.ino) with [Arduino IDE](https://www.arduino.cc/en/main/software)

4. Setup [Hyperion](https://hyperion-project.org/) with [HyperCon.jar](vendor/HyperCon.jar)
    - Install
    - Send [Hyperion Config](adalight-apa102-arduino-uno/hyperion.config.json)
5. Configure Rapsberry

You need to create your `.env` file like `.env.sample`.

To upload scripts and install them:
```bash
./provision.sh 
```
If you want to execute a script you can run:
```bash
./provision.sh scripts/<the-script.sh> 
```