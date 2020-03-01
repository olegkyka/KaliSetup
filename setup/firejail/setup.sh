#!/usr/bin/sh

echo -e "[START] Setting up firejail\n"

set -e
source ../../var.sh

echo "firecfg"
sudo firecfg

echo "Copying firejail profiles"
sudo cp ./profiles/* /etc/firejail/

echo -e "[START] Setting up firejail\n"
