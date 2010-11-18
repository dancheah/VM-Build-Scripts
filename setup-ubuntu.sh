#!/bin/bash -xv
# This needs to be run as root. Tested on Ubuntu 10.04 but should
# also work 10.10
# Prerequisite: git-core is already installed

# Make sure I get all updates
apt-get update -y
apt-get upgrade -y

# Install the package I like
apt-get install -y openssh-server vim ack-grep curl htop gcc 

# A bunch of stuff uses these so install them too
apt-get install -y zlib1g-dev libssl-dev

# Figure out what kernel headers need to be installed. Need
# this for VMWare Tools.
headers=$(dpkg -l | grep linux-image-2 | perl -lane '$F[1] =~ s/image/headers/; print $F[1]')
apt-get install -y $headers

# Setup ack-grep command the way I like it
mkdir -p /usr/local/bin
ln -s /usr/bin/ack-grep /usr/local/bin/ack
