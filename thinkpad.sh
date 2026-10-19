#!/usr/bin/env bash
set -e
set -u

echo "░▀█▀░█░█░▀█▀░█▀█░█░█░█▀█░█▀█░█▀▄"
echo "░░█░░█▀█░░█░░█░█░█▀▄░█▀▀░█▀█░█░█"
echo "░░▀░░▀░▀░▀▀▀░▀░▀░▀░▀░▀░░░▀░▀░▀▀░"
echo ""

if [ "$EUID" -ne 0 ]; then 
    echo "This script must be run as root"
    exit 1
fi

echo "[Base packages and Setup]"
echo ""

echo "[*] Updating xbps package manager..."
xbps-install -Syu xbps

echo "[*] Updating system..."
xbps-install -Syu

echo "[*] Installing base packages..."
xbps-install -Sy \
    apparmor \
    fish-shell \
    fzy \
    gawk \
    git \
    lowdown \
    neovim \
    redshift \
    sed \
    stow \
    tzdata \
    ufetch \
    wget

select_video_driver() {
    local options=("xf86-video-nouveau" "xf86-video-amdgpu" "xf86-video-intel")
    local PS3="Select your GPU video driver (1-3): "
    
    COLUMNS=1
    
    select driver in "${options[@]}"
    do
        [ -n "$driver" ] && echo "$driver" && break
        echo "Invalid selection. Please try again."
    done
}

echo "Select your video driver:"
VIDEO_DRIVER=$(select_video_driver)
echo "✓ Selected: $VIDEO_DRIVER"
echo ""

echo "[*] Installing packages for X11 with $VIDEO_DRIVER..."
xbps-install -Syu \
    xorg-minimal \
    "$VIDEO_DRIVER" \
    bemenu \
    bspwm \
    picom \
    polybar \
    sxhkd \
    xfce4-terminal

echo "[*] Setting console font to \"Lat2-Terminus16\"..."
sed -i 's/^#*\s*FONT=.*/FONT="Lat2-Terminus16"/' /etc/rc.conf

echo "[*] Adding app armor to linux cmdline via grub..."
# see: https://docs.voidlinux.org/config/security/apparmor.html
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="\(.*\)"/GRUB_CMDLINE_LINUX_DEFAULT="\1 apparmor=1 security=apparmor"/' /etc/default/grub
# remove extra whitespace, if any
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="  /GRUB_CMDLINE_LINUX_DEFAULT=" /' /etc/default/grub

update-grub

echo "[Customization]"
echo ""

echo "[*] Checking out .dotfiles repo and stowing..."

cd $HOME

DIRECTORY="${HOME}/.dotfiles"
if [ ! -d "$DIRECTORY" ]; then
	echo "$DIRECTORY does not exist. Cloning..."
	git clone git@github.com:staydecent/.dotfiles.git
	cd $DIRECTORY
else
	echo "$DIRECTORY exists. Pulling latest..."
	cd $DIRECTORY
	git pull
fi

stow bash
stow bin
stow bspwm
stow fish
stow nvim
stow picom
stow polybar
stow redshift
stow sxhkd
stow tty
stow wget
stow x11
stow xfce4