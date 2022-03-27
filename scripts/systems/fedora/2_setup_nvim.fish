#!/usr/bin/fish

# Move Vim Configs

set nvim_config_location $HOME/.config/nvim
if not test -d $nvim_config_location
  mkdir $nvim_config_location
else
	rm -r $nvim_config_location/*
end

cp -rf configs/vim_configs/* $nvim_config_location
