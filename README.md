# KArchNotify

An Arch Linux utility used to notify a user when package updates are available via KDE desktop.
This code is no longer maintained, hasn't been looked at for ages and most definitely no longer works without modification. I've included it here for archival and sharing purposes.

## WARNING

The readme below is heavily outdated, probably no longer works and asks the user to proceed with some questionable security practices. I know there are better methods for package installation and management now. Like I said this code is old, proceed at your own risk.

If you made it this far and are still interested, you probably know what you're doing.

### What it is

KArchNotify is an Arch Linux utility used to notify a user when new packages are available in the pacman repositories.

It is a small shell script with output to KDE using the kdialog command.

### Why?

At the time of KArchNotify's creation there is only one other app that I know of which notifies the user of package updates.  It's called Alunn and I'm sure it's a great tool.  I thought this tool might be overkill for what I want to do so I wrote my own.  I'm sure Alunn is a good app but I don't want to run more daemons like dbus & allund when I only want a quick check during startup.

### Requirements

* Bash (probably already on your system)
* KDE  (needed for kdialog popup window)
* sudo (needed to check for package updates)

### Setup

* As root user run the included install.sh script and follow the directions.
* You can configure user settings in the file /ect/karchnotify.conf
* As root run "usermod -a -G updatecheck [username]" where [username] is the user you wish to allow use of karchnotify.  This needed to allow updates to the repository lists.  Any other users who you wish to allow also must be part of this updatecheck group.
* copy kde/karchnotify.desktop to your [userdir]/.kde/Autostart directory.

### Permissions

The KArchNotify install script will attempt to setup the sudo permissions file (sudoers) for you by adding the new usergroup "updatecheck" with permission to run only the /usr/sbin/karchnotify without need for a password.  This seems to be a faily secure method as even if it is managed to be run abusively the script only updates the local repositories lists with the remote ones.

A backup copy of your /etc/sudoers file was made named /etc/sudoers.karchnotify before changes were made.  Any changes are labeled under the "# Group added by karchnotify" heading.

### Other

* NOTE: Please remember that you must logout for your new group permissions to take affect!!
* Screenshots of the different settings can be found in _screenshots/ directory
* Again, user configuration can be found in /etc/karchnotify.conf
* The karchnotify.desktop script is needed to use the sudo command on the actual script
* The karchnotify.script script is placed in the ~/.kde/Autostart directory to be run at kde startup once the user is logged in.  ~ is the users home directory or same as [userdir] mentioned above.

### Changelog

#### v1.2

* Now more active KDE dialogs, a prompt asking to display a list of updates
* Oldschool mode for those who like the old passive popup mode.
* No dialogs unless there are updates available (silent)
* User config file moved to /etc/karchnotify.conf  (common practice)
* KDE startup script changed from a script to a KDE desktop file  (common practice)
