#!/bin/bash

wd=$(pwd)

apt-get -y remove openssh-server
apt-get -y update
apt-get -y upgrade
apt-get -y install git

#########################################

apt-get -y install autoconf
apt-get -y install openssl
apt-get -y install zlib1g-dev
apt-get -y install libpam-dev
apt-get -y install libssl-dev
apt-get -y install make
apt-get -y install gcc

cd "$wd" || exit 1
git clone "https://github.com/PeterMcD/openssh-portable.git"
cd "$wd/openssh-portable" || exit 1

autoconf
autoreconf --install
./configure --with-pam --prefix=/usr
make
make install

systemctl unmask ssh.service
systemctl enable ssh
systemctl start ssh

########################################

apt-get -y install libsqlite3-dev
apt-get -y install libpam0g-dev
apt-get -y install sqlite3

cd "$wd" || exit 1
git clone "https://github.com/PeterMcD/ssh-pam-login-logger.git"
cd "$wd/ssh-pam-login-logger" || exit 1

rm -f "/etc/pam.d/sshd"
mv "$wd/configurations/sshd" "/etc/pam.d/sshd"
chown root:root "/etc/pam.d/sshd"
chmod 777 "/etc/pam.d/sshd"

rm -f "/usr/etc/sshd_config"
mv "$wd/configurations/sshd_config" "/usr/etc/sshd_config"
chown root:root "/usr/etc/sshd_config"
chmod 644 "/usr/etc/sshd_config"

make
make install

chmod 777 "/var/log"
