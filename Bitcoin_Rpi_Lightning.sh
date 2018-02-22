#!/bin/sh

# Get dependencies
sudo apt-get install -y autoconf automake build-essential git libtool libgmp-dev libsqlite3-dev python python3 net-tools libsodium-dev

# For development or running tests, get additional dependencies:
sudo apt-get install -y asciidoc valgrind python3-pip
sudo pip3 install python-bitcoinlib

# Clone lightning
git clone https://github.com/ElementsProject/lightning.git
cd lightning

# Build lightning
make

# Running lightning
bitcoind &
./lightningd/lightningd &
./cli/lightning-cli help
