#!/bin/sh
echo "System Update"
sudo dnf update -y --refresh > /dev/null

echo "Setup Fish"

if [[ -z `which fish` ]]
then
  echo "Install Fish"
  sudo dnf install -y fish > /dev/null
fi

fish_location=$(which fish)
if [[ -z `cat /etc/shells | grep fish` ]]
then
  echo "Added fish to shells"
  echo $fish_location | sudo tee -a /etc/shells >> /dev/null
fi


if [[ $SHELL = "fish" ]]
then 
  echo "Set fish as default shell"
  sudo usermod -s $fish_location `whoami`
fi
