#!/bin/bash -xv
# This needs to be run as root. Tested on Ubuntu 10.04 but should
# also work with 10.10
# Prerequisite: git-core is already installed

# Make sure I get all updates
apt-get update -y
apt-get upgrade -y

# Install various command line utilities
apt-get install -y git-core openssh-server vim ack-grep curl htop gcc tree tmux sqlite3 flex bison

# This is useful for discovering the new vm on the network
apt-get install -y avahi-daemon

# A bunch of dev stuff uses these so install them too
apt-get install -y zlib1g-dev libssl-dev libreadline6-dev libsqlite3-dev libxslt-dev libxml2-dev tcl-dev tk-dev

# Standard perl dependencies to help replace shell
# scripts
apt-get install -y libtemplate-perl perl-doc

# Figure out what kernel headers need to be installed. Need
# this for VMWare Tools.
headers=$(dpkg -l | grep linux-image-2 | perl -lane '$F[1] =~ s/image/headers/; print $F[1]')
apt-get install -y $headers

# Setup ack-grep command the way I like it
mkdir -p /usr/local/bin
ln -s /usr/bin/ack-grep /usr/local/bin/ack

echo "Modify /etc/hostname and /etc/hosts to name this VM"
