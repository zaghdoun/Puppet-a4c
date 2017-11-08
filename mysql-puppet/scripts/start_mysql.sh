#!/bin/bash
sudo -s
cd /etc/puppet/manifests

sudo -E puppet apply start.pp