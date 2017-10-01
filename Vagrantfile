# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
$set_environment_variables = <<SCRIPT
    tee "/etc/profile.d/myvars.sh" > "/dev/null" <<EOF
    # Ansible environment variables.
    export ANSIBLE_STDOUT_CALLBACK=debug
    
    # AWS environment variables.
    export AWS_ACCESS_KEY_ID=#{ENV['SOCIALPROJ_AWS_ACCESS_KEY_ID']}
    export AWS_SECRET_ACCESS_KEY=#{ENV['SOCIALPROJ_AWS_SECRET_ACCESS_KEY']}
    EOF
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = 'joshfng/railsbox'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access

  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 3000, host: 8080, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 5432, host: 15432, host_ip: "127.0.0.1"
  # config.vm.forward_port 5432, 15432

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # config.vm.synced_folder ".", "/vagrant"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL

  config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
    sudo apt-get purge postgresql-9.5
    sudo apt-get install libpq-dev
    sudo apt-get install -y imagemagick
  SHELL

  # config.vm.provision "shell", env: {"AWS_ACCESS_ID" => ENV['SOCIALPROJ_AWS_ACCESS_KEY_ID'], "AWS_ACCESS_KEY" => ENV['SOCIALPROJ_AWS_SECRET_ACCESS_KEY']}, inline: <<-SHELL
  #   echo "export AWS_ACCESS_KEY_ID=$AWS_ACCESS_ID" >> ~/.profile
  #   echo "export AWS_SECRET_ACCESS_KEY=$AWS_ACCESS_KEY" >> ~/.profile
  #   echo "export S3_BUCKET=socialproject-staging" >> ~/.profile
  # SHELL

  config.vm.provision "shell", inline: $set_environment_variables, run: "always"
  config.vm.provision :shell, :path => "vagrant/database.sh"
end
