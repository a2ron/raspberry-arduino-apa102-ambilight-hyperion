# Installing a newer GCC Version
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install gcc-4.9 g++-4.9
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.6 40 --slave /usr/bin/g++ g++ /usr/bin/g++-4.6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 60 --slave /usr/bin/g++ g++ /usr/bin/g++-4.9
sudo update-alternatives --config gcc
sudo apt-get -y update
# Install additional dependencies
sudo apt-get install -y cmake libssl-dev
# Starting with the platform
git clone https://github.com/thinger-io/Linux-Client.git
cd Linux-Client
# Installing the client as daemon
cd install/raspberry/
chmod +x install.sh
./install.sh 
sudo service thinger start