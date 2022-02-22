#!/usr/bin/fish

# Add RPMFusion Non Free
sudo dnf -yq install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-(rpm -E %fedora).noarch.rpm

# Install Discord

sudo dnf -yq install discord
