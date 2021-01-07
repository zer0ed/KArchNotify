#!/bin/bash

# karchnotify install script
# By: Wes Brewer [nd3, Zer0] - Aug 28, 2006
# Last updated on Oct 13, 2006 (friday the 13th.. ooh spooky)

# Is user root? If no then exit
if ! [ "$UID" = "0" ]; then
  echo "You must be logged in as root to install this program"
  exit
fi

# copy program to paths
cp usr/sbin/karchnotify /usr/sbin/karchnotify
cp etc/karchnotify.conf /etc/karchnotify.conf

# add user group updatecheck
groupadd updatecheck

# make copy of sudoers before modification
cp /etc/sudoers /etc/sudoers.karchnotify

# append needed group to sudoers file (sudo permissions)
echo >> /etc/sudoers
echo "# Group added by karchnotify" >> /etc/sudoers
echo "%updatecheck	ALL=NOPASSWD: /usr/sbin/karchnotify" >> /etc/sudoers


# Notify user that they must add any users to the updatecheck group
# to use this program.
echo
echo " Please note that you must add any users who wish to use karchnotify"
echo "  to the updatecheck group, including your user account.  To do this"
echo "  simply type \"usermod -a -G updatecheck [username]\" where [username]"
echo "  is the user you wish to allow use of update notification."
echo
echo " You will also need to copy kde/karchnotify.desktop to ~/.kde/Autostart"
echo " so it will run once the user is logged in to kde."
echo
echo " You can read more in the README.TXT file if needed!"
echo
