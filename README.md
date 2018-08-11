# Installation d'un serveur web Apache2/PHP7.1

Installing Apache2/PHP7.1/MySQL for a development web server on a ubuntu server 16.04.

Script tested on linux distribution Raspbian Stretch Lite.
[Ubuntu 16.04.5 LTS](https://www.ubuntu.com/download/alternative-downloads)

The script installs the following components:

* Apache2
* MySQL
* PHP7.1
* xdebug
* Composer
* PHP-CS-FIXER
* PHP code sniffer
* PHP md
* PHP Copy/Paste Detector
* samba

## Requirements

* GIT: The script requires GIT. [https://git-scm.com/](https://git-scm.com/)

        sudo apt-get install git

## Installation

If you want to change your raspberrypi hostname, change the name of the MY_HOSTNAME variable.
Otherwise comment there with a #.

### Git Clone

You can also download the script source directly from the Git clone:

    git clone https://github.com/zohac/ubuntu-server-16.04-server-web.git

### Run the script

    sudo bash ubuntu-server-16.04-server-web/install.sh

## Issues

Bug reports and feature requests can be submitted on the [Github Issue Tracker](https://github.com/zohac/ubuntu-server-16.04-server-web/issues)

## Author

Simon JOUAN
[https://jouan.ovh](https://jouan.ovh)