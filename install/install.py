#
#  IMPORTS & SETUP
#

import os
#import archinstall
from rich.console import Console
from rich.theme import Theme

#
#  UI CODE
# 
ui = Theme({
    "command": "cyan",
    "field": "bold yellow",
    "label": "green"
})

console = Console(theme=ui)

username = ""
hostname = ""
encryption = ""
password = ""
swap = 0
timezone = ""

while True:
  console.clear()
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

  console.print("""
  To navigate the installer
  use the command represented
  to the left of each options.
  """, style="italic bright_black",  justify="center")

  console.print("[command][USER][label] USERNAME:[field]", username, justify="center")
  console.print("[command][HOST][label] HOSTNAME:[field]", hostname, justify="center")
  console.print("[command][ENCR][label] DISK ENCRYPTION:[field]", encryption, justify="center")
  console.print("[command][PASS][label] PASSWORD:[field]", password , justify="center")
  console.print("[command][SWAP][label] SWAP SIZE:[field]", swap, justify="center")
  console.print("[command][TIME][label] TIMEZONE:[field]", timezone, justify="center")
  console.print("\n Use [START] to begin installation.", justify="center", style="italic bright_black")
  console.print("Use [EXIT] to exit the installer.", justify="center", style="italic bright_black")

  command = input("> ")
  if command.upper() == "USER":
      username = input("\nEnter an username for the user.\n> ")
  elif command.upper() == "HOST":
      hostname = input("\nEnter an hostname for this computer.\n> ")
  elif command.upper() == "ENCR":
      encryption = input("\nEnter the disk encryption password (leave blank to disable).\n> ")
  elif command.upper() == "PASS":
      password = input("\nEnter a password for this computer.\n> ")
  elif command.upper() == "SWAP":
      swap = input("\nEnter the size of swap for this computer. (GBs)\n> ")
      try: swap = int(swap)
      except:
          swap = 0
          continue
  elif command.upper() == "TIME":
      timezone = input("\nEnter your timezone.\n> ")
  elif command.upper() == "EXIT":
      exit()
  elif command.upper() == "START":
      option = input("Type 'Start installation' to begin the installation or anything else will send you back to the main menu.\n> ")
      if option.upper() == "START INSTALLATION": break
      else: continue
  else: continue
