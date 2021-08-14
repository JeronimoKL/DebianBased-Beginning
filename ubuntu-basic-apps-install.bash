#! /bin/bash

# Installation of many packages in a fresh Ubuntu

###################################
# Add repositories
###################################
echo
echo "Installing repositories..."
echo
sudo apt-add-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner"

###################################
# Update and Upgrade
###################################
echo
echo "Updating and upgrading..."
echo
sudo apt-get update && sudo apt-get upgrade -y

###################################
# Remove programs not used
###################################
echo
echo "Removing programs not used..."
echo
sudo apt-get remove firefox kwrite kdeconnect kwalletmanager libpam-kwallet-common kaccounts-intergration libpam-kwallet5 signon-kwallet-extension hexchat hexchat-common thunderbird thunderbird-gnome-support thunderbird-locale-en  thunderbird-locale-en-us  banshee tomboy pidgin pidgin-libnotify -y

###################################
# Installations
###################################
echo
echo "Installing programs..."
echo

## system
### important
sudo apt-get install ark tasksel gparted p7zip-rar ntfs-config usbmount curl htop nano neofetch git cmake -y
### browsers
sudo apt-get install chromium-browser chromium-chromedriver chromium-codecs-ffmpeg-extra chromium-ublock-origin webext-ublock-origin
### pdf tools
sudo apt-get install  acroread cups-pdf -y
## audio, image and video
sudo apt-get install inkscape
### tools
sudo apt-get install mencoder audacious -y
### Docker
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
### Portainer
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

## developing
### compilers and IDEs
sudo apt-get install build-essential gcc-avr avr-libc doxygen doxygen-latex cmake cmake-curses-gui gfortran libgtk2.0-dev pkg-config -y
### libraries
sudo apt-get install libboost-all-dev libeigen3-dev libblas-dev liblapack-dev ant -y
### python
sudo apt-get install spyder3
### repositories
sudo apt-get install git ssh openssh-server -y
###################################
# Cleaning
###################################
echo
echo "Cleaning..."
sudo apt-get autoclean
sudo apt-get autoremove -y


###################################
# Finish!
###################################
echo
echo "Finish! All done!"
echo