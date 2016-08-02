# Craftbox
### A Vagrant "Craft Box" for Craft CMS
Craftbox is a simple Vagrant box running Ubuntu 14.04 and targeted for Craft development. Craftbox is intended for Craft developers (like me) that would love to have a simple Vagrant box that installs Craft and all their favorite development tools.

Do you use Wordpress? Check out [Workpress](https://github.com/jalenconner/workpress), my Vagrant box for Wordpress development.

### Installation

1. Install VirtualBox - https://www.virtualbox.org/
1. Install Vagrant - http://www.vagrantup.com/
    * Verify Vagrant is installed by running `vagrant -v` in your terminal.
1. Download Craftbox (choose one of the following ways):
    * Download and extract the GitHub repository - https://github.com/jalenconner/craftbox/archive/master.zip
    * Clone the GitHub repository - `git clone https://github.com/jalenconner/craftbox.git`
1. Navigate to the folder you just downloaded and run `vagrant up` in your terminal. Please be patient; it always take a little time to download and boot up the VM the first time.
1. Visit http://192.168.33.10 in your browser and you should see your Craft site.
1. That's it! Were you expecting more?

### Usage
##### Basic Vagrant Commands
Start or resume your server - `vagrant up`

Pause your server - `vagrant suspend`

Turn off your server - `vagrant halt`

SSH into your server - `vagrant ssh`

##### Provisioning
I am currently using [Ansible](https://www.ansible.com) to provision the box. You can find all the provisioning files in the provisioning folder. Vagrant uses the Vagrantfile to run a shell script on the VM that installs Ansible and starts the Ansible playbook. That way you don't have to install Ansible on your host machine.

##### Changing the IP
Craftbox is setup to use the IP address of 192.168.33.10. If this IP is conflicting with something on your network, you may change it in the Vagrantfile to the IP address of your choosing and then run `vagrant reload` in your terminal.

##### Development URL
So who would want to visit http://192.168.33.10 when instead they could just browse to http://craftbox.dev?
1. `$ vagrant plugin install vagrant-hostsupdater`
1. `$ sudo visudo`
1. Add the following to the end of the file:
```
# Allow passwordless startup of Vagrant with vagrant-hostsupdater.
Cmnd_Alias VAGRANT_HOSTS_ADD = /bin/sh -c echo "*" >> /etc/hosts
Cmnd_Alias VAGRANT_HOSTS_REMOVE = /usr/bin/sed -i -e /*/ d /etc/hosts
%admin ALL=(root) NOPASSWD: VAGRANT_HOSTS_ADD, VAGRANT_HOSTS_REMOVE
```
1. Visit http://craftbox.dev
1. You can configure this url in the Vagrantfile.
1. That's it! Were you expecting more?

A big thanks to the wonderful [Vagrant::Hostsupdater](https://github.com/cogitatio/vagrant-hostsupdater) plugin.

### What's Installed

* [Ubuntu Server 14.04.3 LTS (64-bit; Trusty Tahr)](http://www.ubuntu.com/server)
* [Apache](https://httpd.apache.org)
* [PHP](https://www.php.net/)
* [MYSQL](https://www.mysql.com)
* [Craft](https://craftcms.com/)
* [Ansible](https://www.ansible.com)

View the [full list of packages](https://github.com/jalenconner/craftbox/blob/master/PACKAGES.md).   
Is there something that you think ought to be included here? Open an issue and let me know!

### Credentials
##### SSH Users
Username | Password
---------|---------
vagrant | vagrant
##### MYSQL Details
Property | Value
---------|------
database name | craftbox
database user | craftbox_user
database password | craftbox_pass
database host | localhost

### Additional Links
* [Vagrant Docs](https://www.vagrantup.com/docs/)
* [Craft Docs](https://craftcms.com/docs/introduction)
* [Ansible Docs](http://docs.ansible.com/ansible/)
* [jalenconner/trusty64_base](https://github.com/jalenconner/trusty64_base)

### Contributing
I know Craftbox definitely could use some help and I'm sure it probably has its share of bugs too... So I'd love for anyone to help assist me develop this box further. Just open an issue and let me know what it is; be it a bug, tip, feature idea, question, or anything! Or if you are feeling code-savvy, fork my repo, make your changes, and create a pull-request.

### Change Log
Current Version : 1.1.0 - Updated to PHP7

View the full [changelog](https://github.com/jalenconner/craftbox/blob/master/CHANGELOG.md).

### Roadmap
Nothing currently...

### License
© 2016 Jalen Davenport

Apache 2.0; view [license](https://github.com/jalenconner/craftbox/blob/master/LICENSE)

### Thanks
I'd like to give my thanks to [Jake Dohm](https://github.com/jakedohm) for giving me the idea to build a Vagrant box for Craft based on [Workpress](https://github.com/jalenconner/workpress).
