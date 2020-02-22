# Repeatedly plays the XP startup sound at a
# random time between 45 and 83 minutes.

from subprocess import Popen, PIPE
import time
import os
import signal
import sys
import random

bashcmd = "lollypop msstart.mp3"
while(True):
    random_time = random.randint(2700,5000)
    time.sleep(random_time)
    p = Popen(bashcmd.split(),
            stderr=PIPE,
            stdout=PIPE,
            preexec_fn=os.setsid,
            shell=False)
    pid = p.pid
    time.sleep(5)
    os.killpg(os.getpgid(pid), signal.SIGTERM)
    try:
        os.killpg(os.getpgpid(pid), signal.SIGKILL)
    except:
        sys.stdout.write("Termed Gracefully")
