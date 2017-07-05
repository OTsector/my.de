#!/bin/bash
clear
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
username=$USER
os="$(lsb_release -si)"
bit="$(uname -m)"
echo -e "By -=OT=- from Fluge\n\n"
echo -e "${red}Warning!!!${reset}\nIf your D.E's user is not ${green}root${reset}:\nDon't use root privilegies.\nLike this: ${red}sudo su${reset} or ${red}sudo ./configure${reset}\n\n${red}Warning!!!${reset}\nWhen the installation is complete,\nyou will be logged out of the system.\n\n"
echo "Do you whant to continue?"
read -p "Yes "'"Y"'" / No "'"N"'": " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
echo -e "\n"
sudo apt-get install wget perl -y -f
sudo chmod +x gdown.pl
perl gdown.pl "https://drive.google.com/file/d/0B9fmEQRWPMLQSkdTT3RzYjhiUlE/view?usp=sharing" "ot.de.files.tar.gz"
tar xvf ot.de.files.tar.gz
mkdir -p files/plugins
if [ ! -d ""$HOME"/./mozzila/plugins" ]; then
mkdir -p $HOME/./mozzila/plugins
fi
wget "https://fpdownload.adobe.com/pub/flashplayer/pdc/26.0.0.131/flash_player_ppapi_linux.x86_64.tar.gz" -P files/plugins/
tar xvf *.tar.gz
cd flash_player_npapi_linux.x86_64 && sudo cp -R usr / && cp libflashplayer.so $HOME/./mozzila/plugins/
echo -e "${green}U need to use super user as${reset} ${red}root${reset}\ntype your normal user's passwd to use "'"'sudo su'"'""
sudo echo -e "${red}root${reset} is ${green}activated${reset}"
if [ "$EUID" -ne 0 ]
  then echo "Please run as ${green}root${reset} user"
fi
if [ "${os}" == "Debian" ]; then
sudo cp files/scripts/Debian/sources.list /etc/apt/ -f
fi
if [ "${os}" == "Ubuntu" ]; then
sudo cp files/scripts/Ubuntu/sources.list /etc/apt/ -f
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo add-apt-repository ppa:gnome3-team/gnome3
fi
sudo apt-get install apt-transport-https -y -q -f
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
dpkg -s apt-transport-https > /dev/null || bash -c "sudo apt-get update; sudo apt-get install apt-transport-https -y"
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
echo "deb [arch=amd64] https://repo.skype.com/deb stable main" | sudo tee /etc/apt/sources.list.d/skype-stable.list
gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
gpg --homedir "$HOME/.local/share/torbrowser/gnupg_homedir/" --refresh-keys --keyserver pgp.mit.edu
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
rm -rf *.asc --force
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get upgrade -y -q -f
sudo apt-get dist-upgrade -y -q -f
sudo apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
apps="autoconf automake pkg-config libgtk-3-dev git openjdk-8-jre-headless openjdk-8-jdk xserver-xorg libpam-systemd gdm3 gnome gnome-shell gnome-panel gnome-system-tools gnome-tweak-tool dconf-editor cmatrix htop sublime-text skypeforlinux vlc filezilla openssh-server proftpd apache2 mysql-server phpmyadmin tor torbrowser-launcher steam dkms gparted recordmydesktop gtk-recordmydesktop python-setuptools"
sudo apt-get install $apps -y -f -q
sudo easy_install pip
if [ "${os}" == "x86_64" ]; then
sudo dpkg --force-all -i files/dpkg/x86_64/*.deb
sudo dpkg --force-all -i files/dpkg/x86_64/*.deb
fi
if [ "${os}" == "x86" ]; then
sudo dpkg --force-all -i files/dpkg/x86/*.deb
sudo dpkg --force-all -i files/dpkg/x86/*.deb
fi
sudo apt-get -f install -y
mv files/scripts/gnome-settings/* files/scripts/gnome-settings/$username
sudo cp -R files/scripts/gnome-settings/$username /var/lib/AccountsService/users/ -f
sudo cp -R files/themes/ /usr/share/ -f
sudo cp -R files/icons/ /usr/share/ -f
sudo cp -R files/fonts/ /usr/share/ -f
sudo cp files/scripts/rc.local /etc/ -f
username
if [ username == "root" ]; then
if [ ! -d "/root/.config" ]; then
mkdir -p "/root/.config"
cp -R files/home/ /root/ -f
fi
fi
if [ ! -d "/home/"$username"/.config" ]; then
mkdir -p "/home/"$username"/.config"
cp -R files/home/ /home/$username/ -f
fi
if [ ! -d "/home/"$username"/Pictures/Wallpapers" ]; then
mkdir -p "/home/"$username"/Pictures/Wallpapers"
sudo cp files/images/IFcqIOS.jpg /home/$username/Pictures/Wallpapers/ -f
fi
cp files/scripts/File /home/$username/Templates/ -f
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'rgb'
gsettings set org.gnome.settings-daemon.plugins.power button-power 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim 'false'
gsettings set org.gnome.desktop.session idle-delay '0'
gsettings set org.gnome.desktop.background picture-uri 'file:///home/'$username'/Pictures/Wallpapers/IFcqIOS.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/'$username'/Pictures/Wallpapers/IFcqIOS.jpg'
gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu Medium 11'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu Medium 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Vibrancy-Kali-Full-Dark'
gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Dark'
gsettings set org.gnome.desktop.wm.preferences title-font 'Ubuntu Bold 11'
gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar 'false'
sudo gsettings set org.gnome.Terminal.Legacy.Settings default-show-menubar 'false'
gsettings set org.gnome.gedit.preferences.editor display-line-numbers 'true'
gsettings set org.gnome.gedit.preferences.editor warp-last-split-mode 'word'
gsettings set org.gnome.gedit.preferences.editor warp-mode 'word'
gsettings set org.gnome.desktop.background show-desktop-icons 'true'
gsettings set org.gnome.nautilus.desktop home-icons-visable 'false'
gsettings set org.gnome.nautilus.desktop trash-icon-visable 'false'
gsettings set org.gnome.nautilus.desktop volumes-visable 'false'
gsettings set org.gnome.settings-daemon.plugins.cursor active 'false'
echo -e "—– BEGIN LICENSE —–\nRyan Clark\nSingle User License\nEA7E-812479\n2158A7DE B690A7A3 8EC04710 006A5EEB\n34E77CA3 9C82C81F 0DB6371B 79704E6F\n93F36655 B031503A 03257CCC 01B20F60\nD304FA8D B1B4F0AF 8A76C7BA 0FA94D55\n56D46BCE 5237A341 CD837F30 4D60772D\n349B1179 A996F826 90CDB73C 24D41245\nFD032C30 AD5E7241 4EAA66ED 167D91FB\n55896B16 EA125C81 F550AF6B A6820916\n—— END LICENSE ——" > ~/Desktop/Sublime-Text_License.txt
sudo dpkg-reconfigure gdm
sudo dpkg-reconfigure gdm3
sudo service lightdm restart
sudo service gdm restart
clear
else
echo -e "\n"
fi
exit
