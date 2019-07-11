# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

config.vm.box = "centos/7"

config.vm.define "nginx" do |nginx|
    nginx.vm.hostname = "nginx"
    nginx.vm.network :private_network, ip: "192.168.20.10"
	nginx.vm.synced_folder "nginx", "/vagrant"

    nginx.vm.synced_folder "./nginx", "/vagrant", type: "smb",
	   smb_password: "Matrix852456Zc", smb_username: "Evgen",
	   mount_options: ["username=Evgen","password=Matrix852456Zc"]
   
    nginx.vm.provider :virtualbox do |vb|
        vb.memory = "2048"
        vb.name = "nginx"

    nginx.vm.provision "shell", inline: "sudo yum -y update"
    nginx.vm.provision "shell", inline: "sudo yum -y install epel-release"
    nginx.vm.provision "shell", inline: "sudo yum -y install nginx"
	nginx.vm.provision :shell, path: "./nginx/nginx.sh" 
	nginx.vm.provision "shell", inline: "sudo cp /vagrant/config /etc/selinux/config"
	nginx.vm.provision "shell", inline: "sudo setenforce 0"
    nginx.vm.provision "shell", inline: "sudo systemctl start nginx"
  end
end

  config.vm.define "tomcat" do |tomcat|
    tomcat.vm.hostname = "tomcat"
    tomcat.vm.network :private_network, ip: "192.168.20.20"
	
	tomcat.vm.synced_folder "./tomcat", "/vagrant", type: "smb",
	   smb_password: "Matrix852456Zc", smb_username: "Evgen",
	   mount_options: ["username=Evgen","password=Matrix852456Zc"]
	
	tomcat.vm.provider :virtualbox do |vb|
        vb.memory = "4096"
        vb.name = "tomcat"
	
    tomcat.vm.provision "shell", inline: "sudo yum -y update && sudo yum -y install wget"
    tomcat.vm.provision "shell", inline: "sudo yum -y install java-1.8.0-openjdk-devel"
	tomcat.vm.provision "shell", inline: "sudo wget http://archive.apache.org/dist/tomcat/tomcat-9/v9.0.19/bin/apache-tomcat-9.0.19.tar.gz"
	tomcat.vm.provision "shell", inline: "sudo tar -xvf apache-tomcat-9.0.19.tar.gz"
	tomcat.vm.provision "shell", inline: "sudo cp /vagrant/context.xml /home/vagrant/apache-tomcat-9.0.19/webapps/manager/META-INF/context.xml"
    tomcat.vm.provision "shell", inline: "sudo cp /vagrant/server.xml /home/vagrant/apache-tomcat-9.0.19/conf/server.xml"
	tomcat.vm.provision "shell", inline: "sudo cp /vagrant/tomcat-users.xml /home/vagrant/apache-tomcat-9.0.19/conf/tomcat-users.xml"
	tomcat.vm.provision "shell", inline: "sudo cp /vagrant/tomcat.service /etc/systemd/system/tomcat.service"
	tomcat.vm.provision "shell", inline: "sudo chmod ugo+x /etc/systemd/system/tomcat.service"
	tomcat.vm.provision "shell", inline: "sudo chown -R vagrant:vagrant apache-tomcat-9.0.19"
	tomcat.vm.provision "shell", inline: "sudo systemctl enable tomcat"
	tomcat.vm.provision "shell", inline: "sudo systemctl daemon-reload"
    tomcat.vm.provision "shell", inline: "sudo systemctl start tomcat"	
    end
  end
end
