import os
import re
import sys
from shutil import which

if len(sys.argv) != 1:
    path = sys.argv[1]
else:
    print("Include path in command.")
    exit()

flatpakList = os.popen("flatpak list").read()
x = re.findall("([a-zA-Z]*\.[a-zA-Z0-9]*\.[a-zA-Z0-9.]*).*\n", flatpakList)

for i in x:
    if which(i) != None:
        shortname = re.search("[a-zA-Z]*\.[a-zA-Z0-9]*\.([a-zA-Z0-9.]*)", i).group(1).lower()
        os.system("echo alias "+shortname+"="+i+" >> "+path)
