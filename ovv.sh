#!/bin/bash

cd ~/Downloads && { curl -L -O https://download.virtualbox.org/virtualbox/6.1.32/VirtualBox-6.1.32-149290-Linux_amd64.run; }
sudo chmod +x *.run
sudo ./*.run

#!/bin/bash

for VALUE in $(cat /etc/os-release) 
    do export $VALUE 
done 1> /dev/null 2>&1;

# source /etc/os-release 

x=$(vagrant -v | awk '{print $1}') 

if [[ "$ID" == 'ubuntu' ]] && [[ "$x" == 'Vagrant' ]]
    then 
    echo -e "Vagrant is availablefor ubuntu......"

else
    echo -e "Vagrant doesn't exist......Downloading\n"   
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install vagrant

    if [[ "$ID" == 'fedora' ]] && [[ "$x" == 'Vagrant' ]]
        then
        echo -e "Vagrant is available for fedora......"
    else
        echo -e "Vagrant doesn't exist......Downloading\n"
        sudo dnf install -y dnf-plugins-core
        sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
        sudo dnf -y install vagrant
  

    if [[ "$ID" == 'redhat' ]] && [[ "$x" == 'Vagrant' ]] 
        then
        echo -e "Vagrant is available for fedora......"
    else
        echo -e "Vagrant doesn't exist......Downloading\n"
        sudo yum install -y yum-utils
        sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
        sudo yum -y install vagrant

    fi 
    fi
fi