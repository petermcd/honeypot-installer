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
git clone https://github.com/PeterMcD/honeypot-installer.git
cd honeypot-installer
chmod + x install.sh
./install.sh
```

Once completed there are a couple of steps to carry out.

run

```python
sudo crontab -e
```

and add the following to the  (remembering to change the path to match the user)

```python
*/5 * * * * python3 /home/pi/ssh-login-attempts-logger/src/LoginExtractor.py
```

We now need to create the config file

```python
cd ~
git clone https://github.com/PeterMcD/SSH-Login-Attempts-Logger.git
cd SSH-Login-Attempts-Logger
nano config.py
```

Add the following contents for AWS. You will need to create a dynamoDB instance. lambda instance and lastly an API. A tutorial for this will come later.

```python
# Unique URL for the AWS API.
URL = ""

# AWS API key.
API_Key = ""

# Path and filename for the database.
DatabasePath = "/var/log/login-attempts.db"
```