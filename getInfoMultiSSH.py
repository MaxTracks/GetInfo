#!/usr/bin/python
import subprocess

def getInfoMultiSSH(username,password,hosts,command):
    res = ""
    for host in hosts:
        multicommand = ["sshpass","-p",password,"ssh","-o","StrictHostKeyChecking=no","-l",username,host,command]
        p = subprocess.Popen(multicommand, stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        out, err = p.communicate()
        res += out
    return res;
