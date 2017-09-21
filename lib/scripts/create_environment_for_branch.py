#!/usr/bin/env

# Creates an environment of current branch and deploys the code
#  e.g. python lib/scripts/create_environment.py [branch name]

import sys
from git import Repo
import os
import subprocess

branch = sys.argv[1]

cwd = os.getcwd()
repo = Repo(cwd)
git = repo.git
origin = repo.remotes.origin
print('getting latest code from origin')
origin.pull()
print('checking out branch ' + branch)
git.checkout(branch)
origin.pull()

environment_name = branch.replace('_', '-')

print('creating environment ' + environment_name)
subprocess.call(["eb","create", environment_name, "--database.engine", "postgres", "--database.username", "ebroot", "--database.password", "dbpassword", "--timeout", "30"])

subprocess.call(["eb","use", environment_name])

SECRET_KEY_BASE = '1d7b0b67e3cb333da74f61d67d6bf7771e517f116a3f4a1cc83be5de2217799bb78fa80d08b6bd4e9627296d93e764f2f788bec00593aeddfd8b19dff7f97890'
AWS_ACCESS_KEY_ID = os.environ['SOCIALPROJ_AWS_ACCESS_KEY_ID']
AWS_SECRET_ACCESS_KEY = os.environ['SOCIALPROJ_AWS_SECRET_ACCESS_KEY']

print('setting environment variables')
subprocess.call(["eb", "setenv", "SECRET_KEY_BASE=" + SECRET_KEY_BASE,
                 "AWS_ACCESS_KEY_ID=" + AWS_ACCESS_KEY_ID,
                 "AWS_SECRET_ACCESS_KEY=" + AWS_SECRET_ACCESS_KEY,
                 "S3_BUCKET=socialproject-staging"])

print ('Environment is ready!')
print ('Environment name: ' + environment_name)

input('press enter to terminate environment...')
subprocess.call(["eb", "terminate", "--force", "--timeout", "30"])
