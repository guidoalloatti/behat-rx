#! /bin/bash

##############################
# Variables Declaration area #
##############################
selenium_server="selenium-server-standalone-2.53.0.jar"
selenium_server_original="IHP6Qw"
chromedriver_zipped="chromedriver_linux64.zip"
chromedriver_unzipped="chromedriver"

##############################
# Functions Declaration area #
##############################
function uncompress_file {
	unzip_installed=$(dpkg -s unzip | grep "Installed-Size")
	if [[ ! $unzip_installed == *"Installed-Size"* ]]; then
		echo " . Installing unzip package..." 
		sudo apt-get -y install unzip
	fi
	echo " . Unzipping the driver in linux..."
	unzip chromedriver_linux64.zip
	echo " . Changing file permissions..."
	chmod 777 $chromedriver_unzipped
	echo " . Removing compressed file..."
	rm $chromedriver_zipped
}

function download_chromedriver {
	if [[ $1 == *"linux"* ]]; then
		wget "http://chromedriver.storage.googleapis.com/2.21/chromedriver_linux64.zip"
	else
		wget "http://chromedriver.storage.googleapis.com/2.21/chromedriver_mac32.zip"
	fi
}

function download_selenium_server {
	wget http://goo.gl/$selenium_server_original
}

function move_selenium_server {
	mv $selenium_server_original selenium-server-standalone-2.53.0.jar
	chmod 777 selenium-server-standalone-2.53.0.jar
}


#################
# Script starts #
#################
if [ "$1" != "linux" ] && [ "$1" != "mac" ]; then
	echo "*****************************************************************"
	echo "* PARAMETER MISSING: You need to pass the os as parameter, e.g: *"
	echo "*   => install.sh linux                                         *"
	echo "*   => install.sh mac                                           *"
	echo "*****************************************************************"
	exit 0
fi

echo "Step 1. Downloading the universal selenium server if needed"
echo " . Checking if the selenium server is present: $selenium_server or $selenium_server_original"
if [ -f "$selenium_server" ]; then
	echo " . The selenium server is already Installed-Size, no need to download."
else
	if [ -f "$selenium_server_original" ]; then
		echo " . $selenium_server found but with original name: $selenium_server_original - Renaming..."
		move_selenium_server
		echo " . $selenium_server renaming complete."
	else
		echo " . $selenium_server not found. Downloading..."
		download_selenium_server
		move_selenium_server
		echo " . $selenium_server download complete."
	fi
fi

echo "Step 2. Download and uncompress the chrome driver if needed for $1"
echo " . Checking if the chrome driver is present: $chromedriver_unzipped or $chromedriver_zipped"
if [[ $1 == *"linux"* ]]; then
	if [ -f "$chromedriver_unzipped" ]; then
		echo " . The chromedriver is already installed, no need to download."
	else
		echo " . $chromedriver_unzipped file was not found, checking for the compressed file..."
		if [[ -f "$chromedriver_zipped" ]]; then 
			echo " . $chromedriver_zipped was found, needs to uncompress..."
			uncompress_file $chromedriver_zipped
		else
		  	echo " . The driver was not found, nor compressed or uncompressed, downloading the chrome drivers for linux"
			download_chromedriver "linux"
			uncompress_file $chromedriver_zipped

		fi
	fi
else
  	echo "TODO: ... Download the chrome drivers for mac ..."
fi
echo "All done!"