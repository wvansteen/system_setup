#!/usr/bin/fish

echo Setup Fonts
set font_location "/usr/share/fonts"
set font_family InconsolataGo

if not test -d {$font_location}/{$font_family}
	echo Installing $font_family Fonts...
	sudo curl -sLo /tmp/$font_family.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$font_family.zip
	unzip -qd /tmp/$font_family /tmp/$font_family.zip
	sudo mv /tmp/$font_family $font_location
	sudo chmod a+rx $font_location/$font_family
	echo font_family Fonts Installed
else
	echo $font_family Fonts Already Installed
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

sudo dnf install -yq starship
cp configs/starship.toml ~/.config
cp configs/config.fish ~/.config/fish

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
