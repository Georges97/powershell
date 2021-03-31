import os.path
import os
import subprocess

def poweroff():
    os.system('powershell.exe [Stop-Computer -Confirm]')

poweroff()
