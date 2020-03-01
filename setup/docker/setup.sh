#!/usr/bin/bash

set -e

sudo groupadd docker
sudo gpasswd -a $USER docker
sudo usermod -aG docker $USER
newgrp docker
