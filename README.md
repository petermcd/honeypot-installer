# SSH Honeypot Installer

This repository brings together 3 seperate repositories
to enable a customised Open SSH server be installed capturing
login details. The package should stop the ability to log into
SSH but capture the attempts.

## Warning

Use this at your own risk. The packages contain minimal testing
and running a honeypot could attract negative consequences.

## Usage

The package is intended to work on a RaspberryPi and has not
been tested on any other distribution however this should work
on Debian distributions.

To install the various packages run the following:

```python
cd ~
sudo apt-get -y install git
git clone https://github.com/PeterMcD/honeypot-installer.git
cd honeypot-installer
chmod +x install.sh
sudo ./install.sh
```
