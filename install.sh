#!/bin/bash

set -eu

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade

source scripts/install_apps.sh
source scripts/links.sh
