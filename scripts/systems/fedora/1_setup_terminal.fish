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

echo Setup Kitty
if not which kitty >> /dev/null
	echo Installing Kitty...
	sudo dnf -y install kitty
	echo Kitty installed
else
	echo Kitty already installed
end

install_fisher_package "Kitty Completions" jomik/kitty-completions

set kitty_config_location ~/.config/kitty
set kitty_dracula_theme_zip {$kitty_config_location}/master.zip
set kitty_dracula_theme_config {$kitty_config_location}/dracula.conf
set kitty_dracula_theme_unzip {$kitty_config_location}/kitty-master

if not test -e $kitty_dracula_theme_config
	echo Downloading dracula kitty theme...
  curl -Ls https://github.com/dracula/kitty/archive/master.zip -o $kitty_dracula_theme_zip 
	unzip $kitty_dracula_theme_zip -d $kitty_config_location
	cp {$kitty_dracula_theme_unzip}/*.conf $kitty_config_location
	rm -r $kitty_dracula_theme_unzip
	rm $kitty_dracula_theme_zip
end

cp -f configs/kitty.conf $kitty_config_location

echo Default Kitty setup complete
