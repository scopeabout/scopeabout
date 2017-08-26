#!/bin/bash

if [ -z "$1" ]
then
  echo "Test Branch is not specified!"
  exit
fi
BRANCH=$1
echo 'Test Branch: '$BRANCH
git checkout $BRANCH
git pull
export RAILS_ENV=test
rake db:reset db:migrate
rails s
