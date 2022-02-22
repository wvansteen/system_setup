#!/usr/bin/fish

# Move Vim Configs

set nvim_config_location $HOME/.config/nvim
if not test -d $nvim_config_location
  mkdir $nvim_config_location
end

cp -rf vim_config/* $nvim_config_location

