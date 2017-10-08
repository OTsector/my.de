#!/bin/bash
# ^>_<^	 _
#	07	[|] 0ffensive 7ester
clear
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
username=$USER
os="$(lsb_release -si)"
bit="$(uname -m)"
o=`tput setaf 65`
otext=`tput setaf 66`
t=`tput setaf 62`
ttext=`tput setaf 61`
ear=`tput setaf 8`
eye=`tput setaf 65`
mouth=`tput setaf 132`
reset=`tput sgr0`
bold=$(tput bold)
normal=$(tput sgr0)
banner="\t\t\t${green}My DE configuration${reset}\n ${ear}^${reset}${eye}>${reset}${mouth}_${reset}${eye}<${reset}${ear}^${reset}\t\t ${bold}${t}_${reset}\n\t${bold}${o}0${reset}${normal}${bold}${t}7${reset}${normal}\t${o}[${reset}${t}|${reset}${o}]${reset}${normal} ${bold}${o}0${reset}${normal}${otext}ffensive${reset} ${bold}${t}7${reset}${normal}${ttext}ester${reset}\n"
echo -e ${banner}
echo -e "${red}Warning!!!${reset}\nIf your D.E's user is not ${green}root${reset}:\nDon't use root privilegies.\nLike this: ${red}sudo su${reset} or ${red}sudo ./configure${reset}\n\n"
echo "Do you whant to continue?"
read -p "Yes "'"Y"'" / No "'"N"'": " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
if ! [[ $username = "root" ]]; then
echo -e "\n\n${green}U need to use super user as${reset} ${red}root${reset}\ntype your normal user's passwd to use "'"'sudo su'"'""
sudo echo -e "${red}root${reset} is ${green}activated${reset}"
fi
if [ "$EUID" -ne 0 ]
  then echo "Please run as ${green}root${reset} user"
fi
echo -e "\n"
echo "Configure repositories and apps from..."
{
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
gpg --keyserver keys.gnupg.net --recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
gpg --homedir "$HOME/.local/share/torbrowser/gnupg_homedir/" --refresh-keys --keyserver pgp.mit.edu
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
rm -rf *.asc --force
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get upgrade -y -q -f
sudo apt-get install linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,')
sudo apt-get install -t jessie-backports  openjdk-8-jre-headless ca-certificates-java -y -f
sudo apt-get install autoconf -y -f -q
sudo apt-get install automake -y -f -q
sudo apt-get install pkg-config -y -f -q
sudo apt-get install libgtk-3-dev -y -f -q
sudo apt-get install git -y -f -q
sudo apt-get install openjdk-8-jre-headless -y -f -q
sudo apt-get install openjdk-8-jdk -y -f -q
sudo apt-get install xserver-xorg -y -f -q
sudo apt-get install libpam-systemd -y -f -q
sudo apt-get install gnome -y -f -q
sudo apt-get install gnome-shell -y -f -q
sudo apt-get install gnome-panel -y -f -q
sudo apt-get install gnome-system-tools -y -f -q
sudo apt-get install gnome-tweak-tool -y -f -q
sudo apt-get install dconf-editor -y -f -q
sudo apt-get install cmatrix -y -f -q
sudo apt-get install htop -y -f -q
sudo apt-get install irssi -y -f -q
sudo apt-get install rcconf -y -f -q
sudo apt-get install sublime-text -y -f -q
sudo apt-get install vlc -y -f -q
sudo sed -i 's/geteuid/getppid/' /usr/bin/vlc
sudo apt-get install filezilla -y -f -q
sudo apt-get install openssh-server -y -f -q
sudo apt-get install proftpd -y -f -q
sudo apt-get install apache2 -y -f -q
sudo apt-get install mysql-server -y -f -q
sudo apt-get install phpmyadmin -y -f -q
sudo apt-get install tor -y -f -q
sudo apt-get install torbrowser-launcher -y -f -q
sudo apt-get install steam -y -f -q
sudo apt-get install dkms -y -f -q
sudo apt-get install gparted -y -f -q
sudo apt-get install recordmydesktop -y -f -q
sudo apt-get install gtk-recordmydesktop -y -f -q
sudo apt-get install python-setuptools -y -f -q
sudo chown -R $username: $HOME/.local/share/torbrowser/tbb
sudo easy_install pip
} &>/dev/null
echo -e "Installing wget, perl..."
{
sudo apt-get install wget perl -y -f
} &>/dev/null
echo "Please wait... Downloading#: ot.de.files.tar.gz file size is 60.18M"
#{
perl <(curl -s https://raw.githubusercontent.com/OTsector/perl/master/gdown.pl) "https://drive.google.com/file/d/0B9fmEQRWPMLQTHRfNkFQRmRST1k/view?usp=sharing" "ot.de.files.tar.gz"
#} &>/dev/null
echo "Extract and configure archive..."
{
tar xvf ot.de.files.tar.gz
mkdir -p files/plugins
if [ ! -d ""$HOME"/./mozzila/plugins" ]; then
mkdir -p $HOME/./mozzila/plugins
fi
wget "https://fpdownload.adobe.com/get/flashplayer/pdc/26.0.0.151/flash_player_npapi_linux.x86_64.tar.gz" -P files/plugins/
tar xvf *.tar.gz
cd flash_player_npapi_linux.x86_64 && sudo cp -R usr / && cp libflashplayer.so $HOME/./mozzila/plugins/
git clone https://github.com/horst3180/arc-theme --depth 1 && cd arc-theme

mkdir -p "files/themes/arc-theme"
git clone https://github.com/horst3180/arc-theme --depth 1 files/themes/arc-theme && ./files/themes/arc-theme/autogen.sh --prefix=/usr --disable-transparency

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
sudo cp files/scripts/gtk.css /usr/share/themes/Arc-Dark-solid/gtk-3.0/ -f
username
if [ username == "root" ]; then
if [ ! -d "/root/.config" ]; then
sudo mkdir -p "/root/.config"
cp -R files/home/ /root/ -f
fi
fi
if [ username != "root" ]; then
if [ ! -d "/home/"$username"/.config" ]; then
sudo mkdir -p "/home/"$username"/.config"
cp -R files/home/ /home/$username/ -f
fi
fi
if [ username == "root" ]; then
if [ ! -d "/root/Pictures/Wallpapers" ]; then
mkdir -p "/root/Pictures/Wallpapers"
sudo cp files/images/IFcqIOS.jpg /home/$username/Pictures/Wallpapers/ -f
fi
fi
if [ username != "root" ]; then
if [ ! -d "/home/"$username"/Pictures/Wallpapers" ]; then
mkdir -p "/home/"$username"/Pictures/Wallpapers"
sudo cp files/images/IFcqIOS.jpg /home/$username/Pictures/Wallpapers/ -f
fi
fi
if [ username == "root" ]; then
cp files/scripts/File /home/$username/Templates/ -f
fi
if [ username != "root" ]; then
cp files/scripts/File /root/Templates/ -f
fi
cp files/scripts/gtk.css /usr/share/themes/Arc-Dark-solid/gtk-3.0/ -f
} &>/dev/null
echo "Configure dconf settings..."
{
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'
gsettings set org.gnome.settings-daemon.plugins.xsettings rgba-order 'rgb'
gsettings set org.gnome.settings-daemon.plugins.power button-power 'shutdown'
gsettings set org.gnome.settings-daemon.plugins.power idle-dim 'false'
gsettings set org.gnome.desktop.session idle-delay '0'
if [ username == "root" ]; then
gsettings set org.gnome.desktop.background picture-uri 'file:///root/Pictures/Wallpapers/IFcqIOS.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///root/Pictures/Wallpapers/IFcqIOS.jpg'
fi
if [ username != "root" ]; then
gsettings set org.gnome.desktop.background picture-uri 'file:///home/'$username'/Pictures/Wallpapers/IFcqIOS.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///home/'$username'/Pictures/Wallpapers/IFcqIOS.jpg'
fi
gsettings set org.gnome.desktop.interface document-font-name 'Ubuntu Medium 11'
gsettings set org.gnome.desktop.interface font-name 'Ubuntu Medium 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Ubuntu Bold 11'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark-solid'
gsettings set org.gnome.desktop.interface icon-theme 'Vibrancy-Kali-Full-Dark'
gsettings set org.gnome.desktop.wm.preferences theme 'Arc-Dark-solid'
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
echo -e "—– BEGIN LICENSE —–\nTwitterInc\n200 User License\nEA7E-890007\n1D77F72E 390CDD93 4DCBA022 FAF60790\n61AA12C0 A37081C5 D0316412 4584D136\n94D7F7D4 95BC8C1C 527DA828 560BB037\nD1EDDD8C\nAE7B379F 50C9D69D B35179EF\n2FE898C4 8E4277A8 555CE714 E1FB0E43\nD5D52613\nC3D12E98 BC49967F 7652EED2\n9D2D2E61 67610860 6D338B72 5CF95C69\nE36B85CC 84991F19 7575D828 470A92AB\n—— END LICENSE ——" > ~/Desktop/Sublime-Text_License.txt
echo -e "Firefox tor configuration:\n\n1) go to url: about:config and searh "'"proxy"'".\n\n2) finde "'"network.proxy.autoconfig_url"'" Copy this text and paste to this field: "'"data:text;base64,ZnVuY3Rpb24gRmluZFByb3h5Rm9yVVJMKHVybCwgaG9zdCkgew0KCWlzcCA9ICJQUk9YWSBpcF9hZGRyZXNzOnBvcnQ7IERJUkVDVCI7DQoJdG9yID0gIlNPQ0tTIDEyNy4wLjAuMTo5MDUwIjsNCgkvL2lmIChzaEV4cE1hdGNoKGhvc3QsIioub25pb24iKSkgew0KCQlyZXR1cm4gdG9yOw0KCS8vfQ0KCS8vcmV0dXJuICJESVJFQ1QiOw0KCWlmIChzaEV4cE1hdGNoKCJvay5ydSIpKSB7DQoJCXJldHVybiAiRElSRUNUIg0KCX0NCglpZiAoc2hFeHBNYXRjaChob3N0LCJsb2NhbGhvc3QiKSkNCgl7DQoJCXJldHVybiAiSFRUUCAxMjcuMC4wLjE6ODA4MCI7DQoJfQ0KCXJldHVybiAiRElSRUNUIjsNCn0="'"\n\n3) finde "'"network.proxy.socs_remote_dns"'" and set value "'"true"'".\n\n4) finde "'"network.proxy.type"'" and set value "'"2"'".\n\n5) search "'"dns"'" finde "'"network.dns.block.DotOnion"'" and set value "'"false"'"" > ~/Desktop/torproxy_for_firefox.txt
} &>/dev/null
echo "Configure from gits..."
{
sudo apt-get install git -y -f && git clone https://github.com/OTsector/ncupp.git /opt/ncupp/ && sudo echo -e '#!/bin/bash\ncd /opt/ncupp/\npython ncupp.py $*\nexit 0' > /usr/bin/ncupp && sudo chmod +x /opt/ncupp/ncupp.py && sudo chmod +x /usr/bin/ncupp
git clone https://github.com/OTsector/torload.git && cd torload && sudo chmod +x configure.sh && ./configure.sh && rm -rf ../torload && cd ..
git clone https://github.com/k4m4/kickthemout.git /opt/kickthemout && pip install scapy && pip install python-nmap && echo -e '#!/bin/bash\npython /opt/kickthemout/kickthemout.py "$@"\nexit 0' > /usr/bin/kickthemout && chmod +x /usr/bin/kickthemout
} &>/dev/null
sudo dpkg-reconfigure gdm
sudo dpkg-reconfigure gdm3
echo -e "Do you want to ${red}restart${reset} your ${green}system${reset} right now? recommended to ${green}press Y${reset} button"
read -p "Yes "'"Y"'" / No "'"N"'": " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
sudo reboot
fi

clear
echo "Done! -Now? ... Nobody's win!"
else
echo -e "\n-${red}OK if you don't${reset} :("
fi
exit 0
