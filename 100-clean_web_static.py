#!/usr/bin/python3
"""
Fabric script that deletes out-of-date archives,
using the function do_clean
"""

from fabric.api import env, run, local
from datetime import datetime
import os

env.hosts = ['18.208.189.254', '54.227.30.49']
env.user = '<username>'
env.key_filename = '~/.ssh/<ssh_key>'


def do_clean(number=0):
    """Deletes out-of-date archives"""
    number = int(number)

    if number < 1:
        number = 1

    files = local("ls -1t versions", capture=True).split("\n")
    for i in range(number, len(files)):
        path = "versions/{}".format(files[i])
        local("rm {}".format(path))

    with cd("/data/web_static/releases"):
        files = run("ls -1t").split("\n")
        for i in range(number, len(files)):
            path = "web_static_{}.tgz".format(files[i])
            if path != "" and path != "web_static_current.tgz":
                run("rm {}".format(path))


def deploy():
    """Creates and distributes an archive to the web servers"""
    archive_path = do_pack()
    if archive_path is None:
        return False
    result = do_deploy(archive_path)
    if not result:
        return False
    do_clean(2)
    return True
