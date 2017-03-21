#!/bin/bash

clear

echo "Checking Bluetooth devices"

bluetoothctl
expect "[bluetooth]"
send "list\n"
expect "[bluetooth]"
send "quit\n"
