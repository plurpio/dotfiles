#
#  IMPORTS
#

import os

#
#  UI CODE
# 

def menu(pkgsInstalled, aurInstalled, dotsInstalled):
  print("""
   ▄▄▄▄▄▄▄ ▄▄▄     ▄▄   ▄▄ ▄▄▄▄▄▄   ▄▄▄▄▄▄▄ ▄▄▄ ▄▄▄▄▄▄▄ 
  █       █   █   █  █ █  █   ▄  █ █       █   █       █
  █    ▄  █   █   █  █ █  █  █ █ █ █    ▄  █   █   ▄   █
  █   █▄█ █   █   █  █▄█  █   █▄▄█▄█   █▄█ █   █  █ █  █
  █    ▄▄▄█   █▄▄▄█       █    ▄▄  █    ▄▄▄█   █  █▄█  █
  █   █   █       █       █   █  █ █   █   █   █       █
  █▄▄▄█   █▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█▄▄▄█   █▄▄▄█▄▄▄▄▄▄▄█
  --- Install Script ---
  """)

  if pkgsInstalled == True: pkgsInstalledUI = "[X]"
  else: pkgsInstalledUI = "[ ]"

  if dotsInstalled == True: dotsInstalledUI = "[X]"
  else: dotsInstalledUI = "[ ]"

  if aurInstalled == True: aurInstalledUI = "[X]"
  else: aurInstalledUI = "[ ]"

  print("\n", pkgsInstalledUI, "Installed packages")
  print("\n", aurInstalledUI, "Installed AUR pkgs")
  print("\n", dotsInstalledUI, "Installed dotfiles")

onlyDots = False
menu(False, False, False)
command = input("Do you want to continue? [Y/N] Type 'dots' to only install dotfiles \n> ")
if command.upper() == "DOTS": onlyDots = True
elif command.upper() != "Y": exit()

#
# Installation of apps.
#

def pkgInstallation():
  os.system("sudo pacman -Syu --noconfirm flatpak")
  os.system("sudo flatpak update -y")
  apps = open("pkgList")
  
  for i in apps:
    if "#" in i:
      continue
    elif "." in i:
      installApp = installApp = i.strip()
      if installApp == "": continue
      print("Installing flatpak:", installApp)
      cmd = "sudo flatpak install -y "+installApp
      os.system(cmd)
    else:
      installApp = installApp = i.strip()
      if installApp == "": continue
      print("Installing pacman app:", installApp)
      cmd = "sudo pacman -S --needed --noconfirm "+installApp
      os.system(cmd)

  apps.close()

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
          print("Installing package", i)
          cmd = "paru -S "+i
          os.system(cmd)
  aur.close()

  menu(True, True, False)

#
# Installation of dotfiles
#

def dotfileInstallation():
    for i in os.listdir("config/"):
        if i == "home":
            for x in os.listdir("config/home"):
                cmd = "ln -sf "+os.getcwd()+"/config/home/"+x+" ~/"+x
                os.system(cmd)
                print("Symlinked "+x+" to the home directory")
                continue
        cmd = "ln -sf "+os.getcwd()+"/config/"+i+" ~/.config/"
        os.system(cmd)
        print("Symlinked", i, "to the config directory.")

#
# Enabling services
#

def serviceEnable():
    services = open("services")
    for i in services:
        cmd = "sudo systemctl enable --now "+i
        os.system(cmd)
        print("Successfully enabled service:", i)

    services.close()

if onlyDots == True:
    dotfileInstallation()
    menu(False, False, True)
    print("\n Installation complete.")
else:
    pkgInstallation()
    dotfileInstallation()
    serviceEnable()
    menu(True, True, True)
    print("\n Installation complete.")
