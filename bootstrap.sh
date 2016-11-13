#!/usr/bin/env bash
# https://www.vagrantup.com/docs/getting-started/provisioning.html

# if root permissions are needed
# sudo passwd root

# update catalogs
  apt-get update

# install apache web server
  apt-get install -y apache2

# install PHP 5
  apt-get install -y php5

# install mySQL without password prompt
# User: root Password: 1234
# http://serverfault.com/questions/19367/scripted-install-of-mysql-on-ubuntu
  debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password 1234'
  debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password 1234'
  apt-get install -y mysql-server

# copy php test page template to webserver
  cp /vagrant/info.php /var/www/html

# restarting server
  /etc/init.d/apache2 restart

# login to mySQL and add a database
# https://wiki.ubuntuusers.de/MySQL/#Datenbank-erstellen
  mysql -u root -p
  1234
  create database test;

# add user pinguin with password 1234
  create user 'pinguin'@'localhost' identified by '1234';
  grant usage on *.* to 'pinguin'@'localhost' identified by '1234'; 
  grant all privileges on test.* to 'pinguin'@'localhost';
  flush privileges; 
  quit;