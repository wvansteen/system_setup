#!/usr/bin/fish

echo Setup Fonts
set font_location "/usr/share/fonts"
set meslo_family "MesloLGS NF" mesloLGS_NF
set meslo_font_location $font_location/$meslo_family[2]
set meslo_fonts regular bold italic bold_italic

if not test -d $meslo_font_location
	echo Installing $meslo_family[1] Fonts...
	set font_files (printf $meslo_family[2]"_%s," $meslo_fonts | sed 's/,$//')
	sudo curl --create-dirs --output-dir $meslo_font_location -sL "https://github.com/IlanCosman/tide/blob/assets/fonts/{$font_files}.ttf?raw=true" -o "#1.tff"
	sudo chmod a+rx $meslo_font_location
	echo $meslo_family[1] Fonts Installed
else
	echo $meslo_family[1] Fonts Already Installed
end

echo Setup up Fisher

function install_fisher_package
	set name $argv[1]
	set package $argv[2]
	if not fisher list $package >> /dev/null	
		echo Installing $name...
		fisher install $package >> /dev/null
		echo $name installed
	else
		echo $name is already installed.
	end
end

if not fisher list fisher >> /dev/null
	echo Installing Fisher...
	curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher >> /dev/null
	echo Fisher installed
else
	echo Fisher is already installed.
end

echo Setup theme

install_fisher_package Tide IlanCosman/tide
install_fisher_package Dracula dracula/fish

echo Setup Alacritty
if not which alacritty >> /dev/null
	echo Installing Alacritty...
	sudo dnf -y install alacritty
	echo Alacritty installed
else
	echo Alacritty already installed
end

set fish_alacritty_completions $__fish_config_dir/conf.d/alacritty.fish
if not test -e $fish_alacritty_completions
	echo Installing fish terminal completions...
	curl -s https://raw.githubusercontent.com/alacritty/alacritty/master/extra/completions/alacritty.fish -o $fish_alacritty_completions
	echo Fish terminal completions installed
else	
	echo Fish terminal completions already installed
end

if not test -d ~/.config/alacritty
	echo Making alacritty config...
	mkdir ~/.config/alacritty
end

set alacritty_config ~/.config/alacritty/alacritty.yml
if not test -e $alacritty_config
	echo Downloading default Alacritty config...
	curl -s https://raw.githubusercontent.com/alacritty/alacritty/v0.7.2/alacritty.yml -o $alacritty_config
end

set alacritty_dracula_theme_config ~/.config/alacritty/dracula.yml

if not test -e $alacritty_dracula_theme_config
	echo Downloading dracula alacritty theme...
	curl -s https://raw.githubusercontent.com/dracula/alacritty/master/dracula.yml -o $alacritty_dracula_theme_config
end

echo Default Alacritty setup complete
