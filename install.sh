#!/bin/sh

set -o nounset 
set -o errexit

installPacker() {
	git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
}

initConfig(){
   echo "Installing Packages"
   cd ~/.config/nvim
   nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

echo "Installing Afnan's Neovim Configuration"


if [ -e "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ]; then
	echo 'Packer already installed'
else
	rm -rf ~/.local/share/nvim/site/pack/packer
	installPacker
fi
initConfig
