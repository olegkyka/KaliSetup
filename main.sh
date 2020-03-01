#!/usr/bin/bash

set -e
source var.sh

##############################
# Declare functions
##############################

echo -e "Setting up functions\n"

pre_install(){
	echo -e "[START] Preprocessing\n"

	mkdir -p $path_to_tools $HOME/.config

	echo -e "[DONE] Preprocessing\n"
}

install_pkg(){
	echo -e "[START] Installing with standard package manager\n"

	echo -e "Updating stuff\n"
	sudo apt update
	sudo apt -y dist-upgrade

	echo -e "Installing general tools\n"
	sudo apt -y install $(cat pkglist/general.txt | tr '\n' ' ')

	echo -e "[DONE] Installing with standard package manager\n"
}

install_python(){
	echo -e "[START] Installing python modules\n"

	pip install -r $path_to_pkgs/python.txt --user

	echo -e "[DONE] Installing python modules\n"
}

install_manual(){
	echo -e "[START] Installing some general tools semi-manually\n"

	# Loop through manual_install/general and run every script
	for dir in ./manual_install/*; do
		sh $dir/install.sh
	done

	echo -e "[START] Installing some general tools semi-manually\n"
}

copy_dotfiles(){
	echo -e "[START] Copying dot files\n"

	#cp -rf ./dotfiles/home/* $HOME 2>&1
	cp -rf ./dotfiles/home/.* $HOME 2>&1
	cp -rf ./dotfiles/config/* $HOME/.config 2>&1
	cp -rf ./dotfiles/config/.* $HOME/.config 2>&1

	echo -e "[DONE] Copying dot files\n"
}

cron(){
	echo -e "[START] Copying cron jobs\n"

#	cp ./cron/user/* $path_to_cron_user
#	cp ./cron/root/* $path_to_cron_root

	echo -e "[DONE] Copying cron jobs\n"
}

setup(){
	echo -e "[START] Setting up general tools\n"

	# Loop through setup/general and run every script
	for dir in ./setup/*; do
		bash $dir/setup.sh
	done

	echo -e "[DONE] Setting up general tools\n"
}

post_install(){
	echo -e "[START] Post-installtion\n"

	cp ./custom $HOME

	echo "updatedb"
	sudo updatedb

	echo -e "[DONE] Post-installtion\n"
}



##############################
# main() - Run all the stuff
##############################

echo -e "Running install and setup\n"

pre_install
install_pkg
install_python
install_manual
#copy_dotfiles
cron
setup
post_install

echo -e "Done with everything!\n"
