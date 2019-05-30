# raspberrypi-hostname-mods

## Purpose

Just like raspberrypi-net-mods, but for setting up hostname.

## One Time Setup

1. Burn Raspbian disk image to SD card.
2. DO NOT BOOT THE SD CARD YET!
3. Copy the following directory and files to /boot.
- raspberrypi-hostname-mods
- cmdline.txt
- cmdline.txt.resize
- hostname
4. Edit /boot/hostname file with the hostname you want to set.
5. Boot the SD card on your Raspberry Pi.

## Usage

Everytime you want to change hostname, just create a hostname file containing the hostname you want to set in /boot. 
