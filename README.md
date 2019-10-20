# Installing an Apache2/PHP7.3/MySQL web server

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/1fa2c6abe7a14379b144a1a026a5b426)](https://www.codacy.com/app/zohac/ubuntu-server-16.04-server-web?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=zohac/ubuntu-server-16.04-server-web&amp;utm_campaign=Badge_Grade)
[![Build Status](https://travis-ci.org/zohac/ubuntu-server-16.04-server-web.svg?branch=master)](https://travis-ci.org/zohac/ubuntu-server-16.04-server-web)

Installing Apache2/PHP7.3/MySQL for a development web server on a ubuntu server.

Script tested on linux distribution [Ubuntu 16.04 LTS](https://www.ubuntu.com/download/alternative-downloads) and [Ubuntu 18.04 LTS](https://www.ubuntu.com/download/alternative-downloads).

The script installs the following components:

* Apache2
* MySQL
* PHP7.3
* xdebug
* Composer
* PHP-CS-FIXER
* PHP code sniffer
* PHP mess detector
* PHP Copy/Paste Detector
* BlackFire
* samba
* zsh

## Requirements

* GIT: The script requires GIT. [https://git-scm.com/](https://git-scm.com/)

```bash
sudo apt-get install git
```

## Installation

### Git Clone

You can also download the script source directly from the Git clone:

```bash
git clone https://github.com/zohac/ubuntu-server-16.04-server-web.git
```

### Run the script

```bash
bash ubuntu-server-16.04-server-web/install.sh
```

## After Reboot - Configure BlackFire

### Installing the Agent

[BlackFire.io](https://blackfire.io/docs/up-and-running/installation)

1. Configure your Blackfire credentials:

```bash
sudo blackfire-agent -register
```

2. After registering the agent, and whenever you modify its configuration, you have to restart its service:

```bash
sudo /etc/init.d/blackfire-agent restart
```

### Installing the Blackfire CLI tool

* Run the config command to initialize the client:

```bash
blackfire config
```

## Issues

Bug reports and feature requests can be submitted on the [Github Issue Tracker](https://github.com/zohac/ubuntu-server-16.04-server-web/issues)

## Author

Simon JOUAN
[https://jouan.ovh](https://jouan.ovh)