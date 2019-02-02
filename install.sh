sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y install git
sudo apt-get -y remove openssh-server

#########################################

sudo apt-get -y install autoconf
apt-get -y install openssl
sudo apt-get -y install zlib1g-dev
sudo apt-get -y install libpam-dev
sudo apt-get -y install libssl-dev

cd ~
git clone http://192.168.1.200:7990/scm/hon/openssh-portable.git
cd ~/openssh-portable

sudo autoconf
sudo autoreconf --install
sudo ./configure --with-pam --prefix=/usr
sudo make
sudo make install

########################################

sudo apt-get -y install libsqlite3-dev
sudo apt-get -y install libpam0g-dev
sudo apt-get -y install sqlite3

cd ~
git clone http://192.168.1.200:7990/scm/hon/ssh-pam-login-logger.git
cd ssh-pam-login-logger

sudo mv /etc/pam.d/sshd /etc/pam.d/sshdbackup
sudo mv ./configurations/sshd /etc/pam.d/sshd
sudo chown root /etc/pam.d/sshd
sudo chmod 644 /etc/pam.d/sshd

chmod +x compile.sh
sudo ./compile

sudo chmod 777 /var/log

#########################################

cd ~
git clone http://192.168.1.200:7990/scm/hon/ssh-login-attempts-logger.git

//todo add to crontab automatically
// */5 * * * * python3 /home/pi/ssh-login-attempts-logger/src/LoginExtractor.py