#! /bin/sh
# create stored variables
if [ ! -f /tmp/notif-triggered ];
then
	echo "0" > /tmp/notif-triggered
fi

# variables
battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
low_capacity=20
battery_status=$(cat /sys/class/power_supply/BAT0/status)
notif_sent=$(cat /tmp/notif-triggered)

# the fun part
if [ $battery_capacity -le $low_capacity -a $notif_sent -eq 0 -a $battery_status = "Discharging" ];
then
	notify-send --urgency critical "Battery Low" "please charge your device"
	echo "1" > /tmp/notif-triggered
fi

if [ $notif_sent -eq 1  -a $battery_status = "Charging" ];
then
	echo "0" > /tmp/notif-triggered
fi
