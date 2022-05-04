#!/bin/bash
sudo apt --yes --force-yes update
sudo apt --yes --force-yes upgrade
sudo apt --yes --force-yes install nginx
sudo systemctl start nginx --force