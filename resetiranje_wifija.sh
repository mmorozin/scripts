#!/bin/bash
sudo ifconfig wlx10bf485b8471 down
sudo ifconfig wlx10bf485b8471 up

sudo service network-manager stop
sudo service network-manager start
