#!/bin/bash

sudo locale-gen UTF-8
sudo apt-get update -y
sudo apt-get install -y python-software-properties

#Adding repositories
sudo add-apt-repository -y ppa:ondrej/php5
sudo apt-get update

#Install MySQL 5.6
echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y --force-yes install mysql-server-5.6 mysql-client-5.6
mysql -u root -proot -e "SET PASSWORD = PASSWORD('');"
cd /vagrant/config/sql && mysql -u root -e "source users.sql";

#Install php
sudo apt-get install -y imagemagick zip unzip git
sudo apt-get install -y --force php5 libapache2-mod-php5
sudo apt-get install -y --force-yes php5-common php5-xmlrpc php5-curl php5-gd php5-cli php5-fpm php-pear php5-dev php5-imap php5-mcrypt php5-imagick php5-xdebug php5-sqlite php5-mysql
sudo apt-get install -y --force-yes php5-memcached memcached
sudo cp /vagrant/config/php/php_dev.ini /etc/php5/fpm/php.ini
sudo cp /vagrant/config/php/php_dev.ini /etc/php5/cli/php.ini

#Install apache
sudo apt-get install apache2 -y
sudo sed -i 's/html//g' /etc/apache2/sites-available/000-default.conf

#Install Composer
cd /tmp && curl -sS https://getcomposer.org/installer | php && sudo mv composer.phar /usr/local/bin/composer

#Install NodeJS via NVM
sudo apt-get install g++ curl libssl-dev apache2-utils build-essential git-core -y
sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | PROFILE=~/.bashrc bash
source ~/.profile
source ~/.bashrc

#Install npm and use without sudo
sudo apt-get install npm -y
npm list -g --depth=0
npm config set prefix ~/npm
echo 'export PATH="$PATH:$HOME/npm/bin"' >> ~/.bashrc
echo 'export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"' >> ~/.bashrc

#Install pip and virtualenv
sudo apt-get install python-pip python-dev build-essential python-virtualenv -y

#Finishing the installation
sudo usermod -a -G www-data vagrant;
sudo restart php5-fpm
sudo service apache2 restart
sudo apt-get autoremove
