- Create netinstaller module for calamares
- Netinstaller module is based on https://arcolinuxforum.com/viewtopic.php?f=46&t=2525&p=10207b
```
rm -f /etc/machine-id /var/lib/dbus/machine-id
dbus-uuidgen --ensure=/etc/machine-id
dbus-uuidgen --ensure
RE: https://wiki.debian.org/MachineId
```
Shout out @Pandaiscool author of RebornOS for this solution
License: GPL3 (soem settings from arco linux)

Live iso requires: debootstrap
- FIXME: /usr/sbin/sources-media edit `apt-get` to apt. Belongs to `calamares-settings-parrot`
- TODO: system init selector, services selector (nginx, apache2, ...)
- FIXME cannot open /etc/shells (No such file or directory)\nEither another instance of /usr/sbin/add-shell is running, or it was previously interrupted.

Module explain:
- shellprocess-bootstrap: Generating system with debootstrap. This step is to create a system with mimimized package list
- shellprocess-initsystem: Do some commands to add groups, which fix packages failed to install. It also adds repository address (could be config files), install packages that can't be installed during bootstrap step so it can create a ready-to-use netinstaller environment. The whole point is to create usable environment to install selected packages and run other calamares modules.