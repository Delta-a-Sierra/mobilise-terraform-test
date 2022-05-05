#!/bin/bash
sudo apt --yes --force-yes update
sudo apt --yes --force-yes upgrade
sudo apt --yes --force-yes install nginx wget
sudo systemctl start nginx --force
cd ~
sudo wget https://github.com/Delta-a-Sierra/WeatherApp/archive/main.tar.gz
sudo tar -xf main.tar.gz -v
sudo mv -v ./WeatherApp-main/dist/* /var/www/html
sudo systemctl restart nginx -force