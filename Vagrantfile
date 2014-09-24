# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	config.vm.provision :shell do |shell|
		shell.inline = "mkdir -p /etc/puppet/modules;
						puppet module install puppetlabs/apt --force
						puppet module install puppetlabs-stdlib --force
						puppet module install velaluqa-phpmyadmin --force
						puppet module install nodes/php --force"
	end
		
	# Enable the puppet provisioner, which will look in manifests
	config.vm.provision :puppet do |puppet|

		puppet.manifests_path = "manifests"
		puppet.manifest_file = "default.pp"
		puppet.module_path = "modules"
#		puppet.options = ['--verbose --debug']
	end
  
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

	# Forward guest port 80 to host port 8888 and name mapping
	config.vm.network :forwarded_port, guest: 80, host: 8888
	
	config.vm.synced_folder "./", "/vagrant", :owner => "www-data", group: "vagrant"
  
end
