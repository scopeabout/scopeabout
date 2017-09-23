#!/usr/bin/env

# Creates an environment of current branch and deploys the code
#  e.g. python lib/scripts/create_environment.py [branch name]

import sys
from git import Repo
import os
import subprocess

cwd = os.getcwd()
repo = Repo(cwd)
git = repo.git
origin = repo.remotes.origin
print 'checking out master branch'
git.checkout('master')
origin.pull()
print 'deploying...'
subprocess.call(["eb","use", "socialproj-prod"])
subprocess.call(["eb", "deploy"])
