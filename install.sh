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

cd ..
git clone https://github.com/PeterMcD/openssh-portable.git
cd openssh-portable

autoconf
autoreconf --install
./configure --with-pam --prefix=/usr
make
make install

systemctl unmask ssh.service
systemctl ssh enable
systemctl ssh start

########################################

apt-get -y install libsqlite3-dev
apt-get -y install libpam0g-dev
apt-get -y install sqlite3

cd ..
git clone https://github.com/PeterMcD/ssh-pam-login-logger.git
cd ssh-pam-login-logger

mv /etc/pam.d/sshd /etc/pam.d/sshdbackup
mv ../configurations/sshd /etc/pam.d/sshd

make
make install

chmod 777 /var/log