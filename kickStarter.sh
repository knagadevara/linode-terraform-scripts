

curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.repo | sudo tee /etc/yum.repos.d/salt.repo
sudo dnf clean expire-cache
sudo dnf update -y && dnf upgrade -y
sudo dnf install salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api
sudo dnf versionlock add salt
sudo dnf versionlock add salt-master
sudo dnf versionlock add salt-minion
sudo dnf versionlock add salt-ssh
sudo dnf versionlock add salt-syndic
sudo dnf versionlock add salt-cloud
sudo dnf versionlock add salt-api

sudo systemctl enable salt-master && sudo systemctl start salt-master
sudo systemctl enable salt-minion && sudo systemctl start salt-minion
sudo systemctl enable salt-syndic && sudo systemctl start salt-syndic
sudo systemctl enable salt-api && sudo systemctl start salt-api


## install the below
/usr/bin/bash
/usr/bin/sh
config(salt) = 3005.1-2.el9
dmidecode
libc.so.6
libdl.so.2
libpthread.so.0
libz.so.1
openssl
pciutils
rpmlib
rtld
systemd-units
which
