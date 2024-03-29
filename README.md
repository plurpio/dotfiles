<p align="center">
  <img src="https://github.com/plurpio/dotfiles/blob/34716df0516b351ed6be5bcfdcf0e78b7be3a15b/git/dotfilesBanners.png">
</p>

### Tools

🖥️ OS - NixOS <br />
🗔 WM - Hyprland <br />
$_ Shell - zsh <br /> 
🖮 Terminal - Kitty <br />
✏️ Editor - NeoVim <br /> 
🌏 Browser - Firefox  

### Installation
Execute the following commands to install my dotfiles on a NixOS installation. You will need to have **git** installed. <br />

`mkdir ~/repos
cd ~/repos
git clone https://github.com/plurpio/dotfiles
cd dotfiles/nixos/
sudo sh build.sh
mkdir ~/.config
mkdir ~/.config/ametrine
ln -s ../config.yaml ~/.config/ametrine/config.yaml
ametrine change default`
