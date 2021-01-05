printf "OPAL VMACHINE  " >&2
#! /bin/bash
printf "Installing... " >&2
{
sudo useradd -m OPAL
sudo adduser OPAL sudo
echo 'OPAL:0000' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes kde-full
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt install --assume-yes xscreensaver
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo apt install nano
sudo nano /etc/apt/sources.list
deb http://security.ubuntu.com/ubuntu focal-security restricted main
# deb-src http://security.ubuntu.com/ubuntu focal-security restricted main
deb http://security.ubuntu.com/ubuntu focal-security universe
# deb-src http://security.ubuntu.com/ubuntu focal-security universe
deb http://security.ubuntu.com/ubuntu focal-security multiverse
# deb-src http://security.ubuntu.com/ubuntu focal-security multiverse
deb http://archive.ubuntu.com/ubuntu focal restricted main multiverse universe
# deb-src http://archive.ubuntu.com/ubuntu focal restricted main multiverse universe
deb http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ focal-security main restricted universe multiverse
deb http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
# deb-src http://archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse
deb http://mirrors.lug.mtu.edu/ubuntu focal main
# deb-src http://mirrors.lug.mtu.edu/ubuntu focal main
deb http://mirrors.edge.kernel.org/ubuntu focal main
# deb-src http://mirrors.edge.kernel.org/ubuntu focal main
deb http://ubuntu.mirrors.tds.net/ubuntu focal main
# deb-src http://ubuntu.mirrors.tds.net/ubuntu focal main



sudo adduser OPAL chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - OPAL -c """$CRP"""
printf 'Check https://remotedesktop.google.com/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi