#!/bin/bash
# AUTHOR: Dan Klopp
# DESCRIPTION: auto install Chef on Mac, Linux and Windows for my
# home computers, then run chef.
WORKDIR=$PWD

if [ `uname` == "Darwin" ]; then
  # Mac, use SHA1
  CHEFDK="chefdk.dmg"
  CHEFDK_URL="https://packages.chef.io/stable/mac_os_x/10.12/chefdk-1.0.3-1.dmg"
  CHEFDK_CHECKSUM="0b2e1574a0d29dd91e00b685e50dff4c0e690b34"
  CHECKSUM_TOOL="shasum"
fi

function install_chef_mac {
  which chef-client &> /dev/null

  if [ $? -eq 0 ]; then
    version=`chef-client -v|awk -F: '{print $2}'|tr -d ' '`
    if [ "$version" == '12.16.42' ]; then
      echo Chef $version already installed
      return
    else
      echo Another chef version $version found, reinstalling
    fi
  fi
  echo Installing Chef
  cd /tmp/
  wget $CHEFDK_URL -O $CHEFDK
  sudo hdiutil attach $CHEFDK
  cd /Volumes/Chef\ Development\ Kit/
  sudo installer -package *.pkg -target /
}

if [ `uname` == "Darwin" ]; then
  install_chef_mac
  cd $WORKDIR
  sudo -E berks vendor cookbooks
  cat <<EOF > $WORKDIR/knife.rb
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
ssl_verify_mode         :verify_none
cookbook_path            ["$WORKDIR/cookbooks"]
EOF
  sudo -E chef-client -z -o recipe['home-compute']
fi

