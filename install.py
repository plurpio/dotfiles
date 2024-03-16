#
#  IMPORTS
#

import os

#
#  UI CODE
# 

def menu(pkgsInstalled, dotsInstalled):
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

  print("\n", pkgsInstalledUI, "Installed packages")
  print("\n", dotsInstalledUI, "Installed dotfiles")

onlyDots = False
menu(False, False)
command = input("Do you want to continue? [Y/N] Type 'dots' to only install dotfiles \n> ")
if command.upper() == "DOTS": onlyDots = True
elif command.upper() != "Y": exit()

#
# Installation of apps.
#

def pkgInstallation():
  flatpakList = ""
  apps = open("pkgList")
  
  for i in apps:
    if "#" in i:
      continue
    else:
      installApp = i.strip()
      if installApp == "": continue
      flatpakList = flatpakList+" "+i.strip()

  apps.close()
  os.system("sudo flatpak update -y")
  print("sudo flatpak install -y "+flatpakList)
  os.system("sudo flatpak install -y "+flatpakList)

  menu(True, False)

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

if onlyDots == True:
    dotfileInstallation()
    menu(False, True)
    print("\n Installation complete.")
else:
    pkgInstallation()
    dotfileInstallation()
    menu(True, True)
    print("\n Installation complete.")
