
#!/bin/bash

if [ "$(whoami)" == "root" ]
then
echo "Please run this script NOT under root because brew won't work. Stupid!"
exit
fi


echo "[*] Starting install MonkeyDev"
echo "[!] Network is required. Considering connect to a vpn."
echo "[Info] Please make sure Xcode was selected for this stupid Monkey..."
read -p "[Controller] Press enter to continue."

echo "[Info] Checking requirements..."


if [ -e /usr/local/bin/brew ]
then
    echo "[Info] Brew installed!"
else
    echo "[*] Starting install Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "[Info] Brew updating... This will fix problems if you have it."
brew update

if [ -e /usr/local/bin/wget ]
then
echo "[Info] wget installed!"
else
echo "[*] Starting install wget..."
brew install wget
fi

if [ -e /usr/local/bin/ldid ]
then
echo "[Info] ldid installed!"
else
echo "[*] Starting install ldid..."
brew install ldid
fi

if [ -e /usr/local/bin/dpkg ]
then
echo "[Info] dpkg installed!"
else
echo "[*] Starting install dpkg..."
brew install dpkg
fi

if [ -e /usr/local/bin/iproxy ]
then
echo "[Info] libimobiledevice installed!"
else
echo "[*] Starting install libimobiledevice..."
brew install libimobiledevice
brew install ideviceinstaller
fi

if [ -e /usr/local/bin/iproxy ]
then
echo "[Info] Python installed!"
else
echo "[*] Starting install Python2 also Python3 because I am lazy..."
brew install python
fi

echo "[!] Homebrew has compeleted. Now, let's have it in root."

sudo echo "Lets install pip first..."
sudo easy_install pip
sudo mkdir ~/OneMonkey
cd ~/OneMonkey

sudo echo "[Info] Installing ldid2...... for some stupid jb like ......."
sudo wget https://github.com/Co2333/coreBase/blob/master/ldid2 ./
sudo cp ./ldid2 /usr/local/bin/ldid2
sudo chmod +x /usr/local/bin/ldid2
sudo echo "[Info] Installing THEOS..."
sudo git clone --recursive https://github.com/theos/theos.git /opt/theos
sudo chown $(id -u):$(id -g) /opt/theos
sudo echo "[Info] Adding some shit to your computer... export THEOS"
export THEOS=/opt/theos
export PATH=/opt/theos/bin/:$PATH
sudo source ~/.bash_profile

sudo echo "[Info] Starting install this Monkey..."
sudo git clone https://github.com/AloneMonkey/MonkeyDev.git
sudo chmod +x ./MonkeyDev/bin/md-install
sudo sudo ./MonkeyDev/bin/md-install

sudo echo "[Info] Starting install frida..."
sudo pip install frida-tools --ignore-installed six wcwidth
sudo git clone https://github.com/AloneMonkey/frida-ios-dump.git
sudo pip install -r ./frida-ios-dump/requirements.txt  --upgrade
sudo echo "[!] dump.py will be install to /usr/local/bin and named fridaDP.py"
sudo cp ./frida-ios-dump/process.sh /usr/local/bin/process.sh
sudo cp ./frida-ios-dump/dump.js ./frida-ios-dump/fridaDP.js
sudo cp ./frida-ios-dump/fridaDP.js /usr/local/bin/fridaDP.js
sudo cp ./frida-ios-dump/dump.py ./frida-ios-dump/fridaDP.py
sudo sed -i '' -e 's/dump.js/fridaDP.js/g' ./frida-ios-dump/fridaDP.py
sudo cp ./frida-ios-dump/fridaDP.py /usr/local/bin/fridaDP.py
sudo echo "[!] Tell me your iOS ssh password. I will insert it to this py."

while true; do
read -sp '[*] Password: ' passvar
read -p "[*] Is this your password? $passvar  [Y(es)/N(o)]:" yn
case $yn in
[Yy]* ) break;;
[Nn]* ) sudo echo "[Error] Fine, stupid. Let's do it again.";;
* ) echo "[Error] Fuck U! Please answer y or n. Let's do it again.";;
esac
done
export SEDTMP=s/alpine/$passvar/g
sudo sed -i '' -e $SEDTMP /usr/local/bin/fridaDP.py

sudo echo "[!] Tell me your iOS ssh address. I will insert it to this py."
while true; do
read -sp '[*] iP Address: ' passvar
read -p "[*] Is this your iP Address? $passvar  [Y(es)/N(o)]:" yn
case $yn in
[Yy]* ) break;;
[Nn]* ) sudo echo "[Error] Fine, stupid. Let's do it again.";;
* ) echo "[Error] Fuck U! Please answer y or n. Let's do it again.";;
esac
done
export SEDTMP=s/localhost/$passvar/g
sudo sed -i '' -e $SEDTMP /usr/local/bin/fridaDP.py

sudo echo "[*] Done? Yes. Removing files we don't need anymore."
sudo rm -rf ~/OneMonkey

echo "[Info] Compeleted install."
echo "MonkeyDev by AloneMonkey"
echo "OneMonkey installer by Lakr Sakura 2018.9.23"
