#all commands have to be entered without ""

#How to start vm
-open commandline tool (like cmd, powershell, git bash, etc)
-change directoy to working directory with Vagrantfile (e.g. cd C:\vagranttest)
-start vm with "vagrant up --provision"

#How to connect to vm
you can connect to vm via ssh (client with openssl2 support necessary, e.g. git bash for windows)  with "vagrant ssh"

#How to stop vm
-if you are connected to the vm via ssh you have to quit the session first with "logout"
-if you want to keep the vm enter "vagrant halt"
 - start an halted vm with "vagrant reload --provision"
-if you want to delete the vm after shutdown enter "vagrant destroy"
 - afterwards you have to boot a new vm with "vagrant up --provision"

#How to check if apache2 and php are working
on the host system open a browser
-apache: enter 127.0.0.1:8080 in the adress bar to open the default website of apache2
-php: enter 127.0.0.1:8080/info.php in the adress bar to get all informations about the installed php version

#Known issue
unfortunately i can not configure mySQL to add a database at start up automatically. the problem is that I have no access right to mySQL
": Access denied for user 'root'@'localhost' (using password: YES)"
if I enter "mysql -u root -p" after the vm start and I am logged in via ssh, I am asked for the password 1234. i can login to mySQL and add a database with

"
  create database test;

  #add user pinguin with password 1234
  create user 'pinguin'@'localhost' identified by '1234';
  grant usage on *.* to 'pinguin'@'localhost' identified by '1234'; 
  grant all privileges on test.* to 'pinguin'@'localhost';
  flush privileges;
  quit; 
"
