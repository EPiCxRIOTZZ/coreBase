
#!/bin/bash

if [ "$(whoami)" == "root" ]
then
echo "Please run this script NOT under root because brew won't work. Stupid!"
exit
fi

read -sp '[*] Tell me Root Shell Password: ' rootpassvar

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

echo -e "$rootpassvar\n" | sudo -S echo "Lets install pip first..."
echo -e "$rootpassvar\n" | sudo -S  easy_install pip
echo -e "$rootpassvar\n" | sudo -S  rm -rf ~/OneMonkey
echo -e "$rootpassvar\n" | sudo -S  mkdir ~/OneMonkey
cd ~/OneMonkey

echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Installing ldid2...... for some stupid jb like ......."
echo -e "$rootpassvar\n" | sudo -S  wget https://github.com/Co2333/coreBase/blob/master/ldid2?raw=true ./
echo -e "$rootpassvar\n" | sudo -S  cp ./ldid2 /usr/local/bin/ldid2
echo -e "$rootpassvar\n" | sudo -S  chmod +x /usr/local/bin/ldid2
echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Installing THEOS..."
echo -e "$rootpassvar\n" | sudo -S  rm -rf /opt/THEOS
echo -e "$rootpassvar\n" | sudo -S  git clone --recursive https://github.com/theos/theos.git /opt/theos
echo -e "$rootpassvar\n" | sudo -S  chown $(id -u):$(id -g) /opt/theos
echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Adding some shit to your computer... export THEOS"
export THEOS=/opt/theos
export PATH=/opt/theos/bin/:$PATH
source ~/.bash_profile

echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Starting install this Monkey..."
echo -e "$rootpassvar\n" | sudo -S  git clone https://github.com/AloneMonkey/MonkeyDev.git
echo -e "$rootpassvar\n" | sudo -S  chmod +x ./MonkeyDev/bin/md-install
echo -e "$rootpassvar\n" | sudo -S  chmod +x ./MonkeyDev/bin/md-uninstall
echo -e "$rootpassvar\n" | sudo -S  rm -rf /opt/MonkeyDev
echo -e "$rootpassvar\n" | sudo -S  ./MonkeyDev/bin/md-uninstall
echo -e "$rootpassvar\n" | sudo -S  ./MonkeyDev/bin/md-install

echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Starting install frida..."
echo -e "$rootpassvar\n" | sudo -S  pip install frida-tools --ignore-installed six wcwidth
echo -e "$rootpassvar\n" | sudo -S  git clone https://github.com/AloneMonkey/frida-ios-dump.git
echo -e "$rootpassvar\n" | sudo -S  pip install -r ./frida-ios-dump/requirements.txt  --upgrade
echo -e "$rootpassvar\n" | sudo -S  echo "[!] dump.py will be install to /usr/local/bin and named fridaDP.py"
echo -e "$rootpassvar\n" | sudo -S  cp ./frida-ios-dump/process.sh /usr/local/bin/process.sh
echo -e "$rootpassvar\n" | sudo -S  cp ./frida-ios-dump/dump.js /usr/local/bin/dump.js
echo -e "$rootpassvar\n" | sudo -S  cp ./frida-ios-dump/dump.py /usr/local/bin/fridaDP.py

echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Starting install jtool and joker tool by additional..."
cd ~/OneMonkey
echo -e "$rootpassvar\n" | sudo -S  wget http://www.newosxbook.com/tools/jtool.tar
echo -e "$rootpassvar\n" | sudo -S  wget http://www.newosxbook.com/tools/joker.tar
echo -e "$rootpassvar\n" | sudo -S  tar -xvf jtool.tar
echo -e "$rootpassvar\n" | sudo -S  tar -xvf joker.tar
echo -e "$rootpassvar\n" | sudo -S  cp ./jtool /usr/local/bin/jtool
echo -e "$rootpassvar\n" | sudo -S  cp ./joker.universal /usr/local/bin/joker
echo -e "$rootpassvar\n" | sudo -S  chmod +x /usr/local/bin/jtool
echo -e "$rootpassvar\n" | sudo -S  chmod +x /usr/local/bin/joker

echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Install class-dump also by additional..."
echo -e "$rootpassvar\n" | sudo -S  wget http://stevenygard.com/download/class-dump-3.5.tar.gz
echo -e "$rootpassvar\n" | sudo -S  tar -xzf class-dump-3.5.tar.gz
echo -e "$rootpassvar\n" | sudo -S  cp ./class-dump-3.5/class-dump /usr/local/bin/class-dump
echo -e "$rootpassvar\n" | sudo -S  chmod +x /usr/local/bin/class-dump

echo -e "$rootpassvar\n" | sudo -S  echo "[Info] Install jtool2 for future use..."
echo -e "$rootpassvar\n" | sudo -S  wget https://github.com/Co2333/coreBase/raw/master/jtool2
echo -e "$rootpassvar\n" | sudo -S  cp ./jtool2 /usr/local/bin/jtool2
echo -e "$rootpassvar\n" | sudo -S  chmod +x /usr/local/bin/jtool2


# echo -e "$rootpassvar\n" | sudo -S  echo "[!] Tell me your iOS ssh password. I will insert it to this py."

# while true; do
# read -sp '[*] Password: ' passvar
# read -p "[*] Is this your password? $passvar  [Y(es)/N(o)]:" yn
# case $yn in
# [Yy]* ) break;;
# [Nn]* ) echo -e "$rootpassvar\n" | sudo -S  echo "[Error] Fine, stupid. Let's do it again.";;
# * ) echo "[Error] Fuck U! Please answer y or n. Let's do it again.";;
# esac
# done
# export SEDTMP=s/alpine/$passvar/g
# echo -e "$rootpassvar\n" | sudo -S  sed -i '' -e $SEDTMP /usr/local/bin/fridaDP.py

# echo -e "$rootpassvar\n" | sudo -S  echo "[!] Tell me your iOS ssh address. I will insert it to this py."
# while true; do
# read -sp '[*] iP Address: ' passvar
# read -p "[*] Is this your iP Address? $passvar  [Y(es)/N(o)]:" yn
# case $yn in
# [Yy]* ) break;;
# [Nn]* ) echo -e "$rootpassvar\n" | sudo -S  echo "[Error] Fine, stupid. Let's do it again.";;
# * ) echo "[Error] Fuck U! Please answer y or n. Let's do it again.";;
# esac
# done
# export SEDTMP=s/localhost/$passvar/g
# echo -e "$rootpassvar\n" | sudo -S  sed -i '' -e $SEDTMP /usr/local/bin/fridaDP.py

echo -e "$rootpassvar\n" | sudo -S  echo "[*] Done? Yes. Removing files we don't need anymore."
echo -e "$rootpassvar\n" | sudo -S  rm -rf ~/OneMonkey

echo "[Info] Compeleted install."
echo "MonkeyDev by AloneMonkey"
echo "OneMonkey installer by Lakr Sakura 2018.9.23"
