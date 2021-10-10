#!/usr/bin/fish

# Configure Fish
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Instal Meslo Fonts

set meslo_fonts regular bold italic "Bold Italic"

function download_meslo_font
	set fontName mesloLGS_NF_$argv[1]
	sudo curl "https://github.com/IlanCosman/tide/blob/assets/fonts/$fontName.ttf?raw=true" --output /usr/share/fonts/$fontName
end

for font in $meslo_fonts
	download_meslo_font font
end
#fisher install IlanCosman/tide
#fisher install dracula/fish

#echo "Install and setup Alacritty"

#sudo dnf -y install alacritty
#mkdir ~/.config/alacritty
#curl https://raw.githubusercontent.com/alacritty/alacritty/master/extra/completions/alacritty.fish > $__fish_config_dir/conf.d/alacritty.fish
#curl https://raw.githubusercontent.com/dracula/alacritty/master/dracula.yml > ~/.config/alacritty/dracula.yml
#curl https://raw.githubusercontent.com/alacritty/alacritty/v0.7.2/alacritty.yml > ~/.config/alacritty/alacritty.yml

#sudo dnf install -y neovim
