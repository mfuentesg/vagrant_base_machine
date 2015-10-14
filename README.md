Base Virtual Machine
--

This repository contains the base structure a virtual machine using [Vagrant](https://www.vagrantup.com/).


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

**Installation**:

To execute the VM you must have installed [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
Note: For more information see the [vagrant documentation](https://docs.vagrantup.com/v2/)

1. Clone this repo in some path: 
`git clone git@gitlab.com:mfuentesg/vagrant_base_machine.git`

2. Up VM: `vagrant up`
