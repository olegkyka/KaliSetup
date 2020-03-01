#!/usr/bin/bash

echo -e "[START] Setting up firejail\n"

set -e

echo "firecfg"
sudo firecfg

echo "Copying firejail profiles"
sudo cp ./profiles/* /etc/firejail/

echo -e "[START] Setting up firejail\n"
