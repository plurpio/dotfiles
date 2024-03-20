#
#  IMPORTS
#

import os

#
#  UI CODE
# 

def menu(dotsInstalled):
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

  if dotsInstalled == True: dotsInstalledUI = "[X]"
  else: dotsInstalledUI = "[ ]"

  print("\n", dotsInstalledUI, "Installed dotfiles")

onlyDots = False
menu(False)
command = input("Do you want to continue? [Y/N]\n> ")
if command.upper() != "Y": exit()

#
# Installation of dotfiles
#

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
