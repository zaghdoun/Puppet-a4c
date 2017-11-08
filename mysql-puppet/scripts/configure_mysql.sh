#!/bin/bash

sudo -s
# start mysql

cd /etc/puppet/manifests

sudo -E puppet apply configure.pp