#!/usr/bin/env

import sys
from git import Repo
import os
import subprocess

cwd = os.getcwd()
repo = Repo(cwd)
git = repo.git
origin = repo.remotes.origin
print('checking out master branch')
git.checkout('master')
origin.pull()
print('deploying...')
subprocess.call(["eb","use", "socialproject-prod"])
subprocess.call(["eb", "deploy"])
