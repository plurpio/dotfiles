#
#  IMPORTS
#

import os
from rich.console import Console
from rich.theme import Theme

#
#  UI CODE
# 

ui = Theme({
    "status": "green",
    "name": "bold yellow",
})

console = Console(theme=ui)

def menu(pkgsInstalled, aurInstalled, dotsInstalled):
  console.print("""
   ▄▄▄▄▄▄▄ ▄▄▄     ▄▄   ▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄ 
  █       █   █   █  █ █  █   ▄  █ █       █   █       █
  █    ▄  █   █   █  █ █  █  █ █ █ █    ▄  █   █   ▄   █
  █   █▄█ █   █   █  █▄█  █   █▄▄█▄█   █▄█ █   █  █ █  █
  █    ▄▄▄█   █▄▄▄█       █    ▄▄  █    ▄▄▄█   █  █▄█  █
  █   █   █       █       █   █  █ █   █   █   █       █
  █▄▄▄█   █▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█▄▄▄█   █▄▄▄█▄▄▄▄▄▄▄█
  --- Install Script ---
  """, style="bold #9447ca", justify="center")

  if pkgsInstalled == True: pkgsInstalledUI = "[X]"
  else: pkgsInstalledUI = "[ ]"

  if dotsInstalled == True: dotsInstalledUI = "[X]"
  else: dotsInstalledUI = "[ ]"

  if aurInstalled == True: aurInstalledUI = "[X]"
  else: aurInstalledUI = "[ ]"

  console.print("\n [status]", pkgsInstalledUI, "[name] Installed packages", style="Medium_Purple1",  justify="center")
  console.print("\n [status]", aurInstalledUI, "[name] Installed AUR pkgs", style="Medium_Purple1",  justify="center")
  console.print("\n [status]", dotsInstalledUI, "[name] Installed dotfiles", style="Medium_Purple1",  justify="center")


console.clear()
menu(False, False, False)
command = input("Do you want to continue? [Y/N] \n> ")
if command.upper() != "Y": exit()

#
# Installation of apps.
#

os.system("sudo pacman -Syu --noconfirm flatpak")
os.system("sudo flatpak update -y")
apps = open("pkgList")

for i in apps:
  if "#" in i:
    continue
  elif "." in i:
    installApp = installApp = i.strip()
    if installApp == "": continue
    console.log("Installing flatpak:", installApp)
    cmd = "sudo flatpak install -y "+installApp
    os.system(cmd)
  else:
    installApp = installApp = i.strip()
    if installApp == "": continue
    console.log("Installing pacman app:", installApp)
    cmd = "sudo pacman -S --needed --noconfirm "+installApp
    os.system(cmd)

apps.close()

console.clear()
menu(True, False, False)

#
# AUR
#

aur = open("aur")
os.system("mkdir $HOME/repos/")
os.system("cd ~/repos && git clone https://aur.archlinux.org/paru && cd paru && makepkg -si")

for i in aur:
    if "#" in i: continue
    else:
        console.log("Installing package", i)
        cmd = "paru -S "+i
        os.system(cmd)
aur.close()

console.clear()
menu(True, True, False)
#
# Installation of dotfiles
#

for i in os.listdir("../config/"):
    if i == "zsh":
        os.system("cp -r ../config/zsh/.zshrc $HOME/") # it works
        console.log("Copied ZSH files to the home directory")
        continue
    cmd = "cp -r ../config/"+i+" $HOME/.config/"
    os.system(cmd)
    console.log("Copied", i, "to the config directory.")

os.system("chsh -s /bin/zsh")

#
# Enabling services
#

services = open("services")
for i in services:
    cmd = "sudo systemctl enable --now "+i
    os.system(cmd)
    console.log("Successfully enabled service:", i)

services.close()

console.clear()
menu(True, True, True)
console.print("\n Installation complete.", style="bright_green", justify="center")
