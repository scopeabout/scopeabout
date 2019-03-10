# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
$set_environment_variables = <<SCRIPT
    tee "/home/vagrant/.bashrc" > "/dev/null" << EOF
# Ansible environment variables.
export ANSIBLE_STDOUT_CALLBACK=debug

# AWS environment variables.
export AWS_ACCESS_KEY_ID=#{ENV['SOCIALPROJ_AWS_ACCESS_KEY_ID']}
export AWS_SECRET_ACCESS_KEY=#{ENV['SOCIALPROJ_AWS_SECRET_ACCESS_KEY']}
export LC_CTYPE=en_US.UTF-8
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = 'bento/ubuntu-17.10'

  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 5432, host: 5432, host_ip: "127.0.0.1"

  config.vm.provision :shell, inline: $set_environment_variables, run: 'always'
  config.vm.provision :shell, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get install -y imagemagick
    sudo apt-get install -y postgresql postgresql-contrib libpq-dev
    sudo apt-get install -y build-essential nodejs ruby ruby-dev libgmp3-dev
    sudo gem install rake
    sudo gem install bundler
    sudo gem install rubocop

    # run bundler on the project directory
    cd /vagrant
    bundler install
  SHELL

  config.vm.provision :shell, inline: <<-SHELL
    sudo cat - > /etc/default/locale <<EOF
     LANG=en_US.UTF-8
     LANGUAGE=
     LC_CTYPE="en_US.UTF-8"
     LC_NUMERIC="en_US.UTF-8"
     LC_TIME="en_US.UTF-8"
     LC_COLLATE="en_US.UTF-8"
     LC_MONETARY="en_US.UTF-8"
     LC_MESSAGES="en_US.UTF-8"
     LC_PAPER="en_US.UTF-8"
     LC_NAME="en_US.UTF-8"
     LC_ADDRESS="en_US.UTF-8"
     LC_TELEPHONE="en_US.UTF-8"
     LC_MEASUREMENT="en_US.UTF-8"
     LC_IDENTIFICATION="en_US.UTF-8"
     LC_ALL=en_US.UTF-8
     EOF
  SHELL

  config.vm.provision :shell, :path => "vagrant/database_ubuntu.sh"
end
