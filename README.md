Base Virtual Machine
--

This repository contains the base structure a virtual machine using [Vagrant](https://www.vagrantup.com/).

It includes, among others:

* Ubuntu 14.04 (trusty x64) as server, running as VirtualBox VM.
* Apache
* PHP 5.5.16
* MySQL 5.6
* Python 3.4 and 2.7

**Requirements**:

To execute the VM you must have installed [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).

Note: For more information see the [vagrant documentation](https://docs.vagrantup.com/v2/)

**Shared Folders**:

By default the entire folder specified on `synced_folder` property on the configuration file is available on the guest machine,

**Configuration**:

Rename the `config-sample.yaml` file to `config.yaml`. On this file you can set some properties to customize the virtual machine.

```yaml
#Virtual machine's IP
ip: 192.168.44.10

#Ram quantity intended to the VM
memory: 2048

#Puts your code in this directory
synced_folder: '~/code'

#Virtual machine hostname
hostname: 'basemachine'

```

**Provision**:

The `provision.sh` file contains all scripts to be executed after lifting the VM. An example of this file is create a empty file on the home directory or install apache server.

```bash
#Example:
mkdir ~/empty_dir
sudo apt-get install apache2
```

**MySQL client**:

Using MySQLWorkbench setup a new Connection, using the connection method called Standard TCP/IP over SSH then fill the inputs with this information

* SSH Hostname: 192.168.44.10:22 (check in your vagrant file)
* SSH Username: vagrant
* SSH Password: vagrant
* MySQL Hostname: 127.0.0.1 (by default)
* MySQL Server Port: 3306 (by default)
* Username: root (by default)
* Password: (blank by default)

You can connect directly to the database using the guess IP (192.168.44.10), but you must configure MySQL to do that.

**Installation**:

1. Clone this repo in some path: 
`git clone git@gitlab.com:mfuentesg/vagrant_base_machine.git`

2. Up VM: `vagrant up`
