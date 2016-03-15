#!/usr/bin/python
from __future__ import print_function
from getInfoMultiSSH import getInfoMultiSSH
from getInfoStatistics import *
import os, time
from config import *

if __name__ == "__main__":
    #Create log directory if it does not exist
    if not os.path.exists(os.path.dirname(logdir)):
        try:
            os.makedirs(os.path.dirname(logdir))
        except OSError as exc: #Gaurd against race condition
            if exc.errno !- errno.EEXIST:
                raise
    while 1:
        #log ever so often
        currtime = time.strftime("%M-%H-%d-%m-%y",time.localtime())
        openfile_name = logdir+"w-"+currtime+".log"
        res = getInfoMultiSSH(username,password,hosts,command)
        openfile = open(openfile_name,"w")
        openfile.write("%s" % res)
        openfile.close()
        #do statistical things here
        time.sleep(delay)

