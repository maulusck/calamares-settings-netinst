- Create netinstaller module for calamares
- Netinstaller module is based on [this](https://arcolinuxforum.com/viewtopic.php?f=46&t=2525&p=10207b).
```
rm -f /etc/machine-id /var/lib/dbus/machine-id
dbus-uuidgen --ensure=/etc/machine-id
dbus-uuidgen --ensure
RE: https://wiki.debian.org/MachineId
```
Shout out @Pandaiscool author of RebornOS for this solution
License: GPL3 (soem settings from arco linux)

Live iso requires: `debootstrap`, temporarily included in `shellprocess-bootstrap`.
- FIXME: /usr/sbin/sources-media edit `apt-get` to apt. Belongs to `calamares-settings-parrot`
- TODO: services selector (nginx, apache2, ...) in core packages
<<<<<<< HEAD
=======
- NOTICE: console-setup has UTF-8 when calamares is 3.2.36. The latest version set ISO-* for some reason
- TODO: install parrot's skel
>>>>>>> upstream/master
- TODO: seem like debootstrap pulled everything (222 packages) but only installed required packages (about less than 100 packages). Must optimize it for faster debootstrap step

##### Tasks:
- **FIXME**: /usr/sbin/sources-media edit `apt-get` to apt. Belongs to `calamares-settings-parrot`
- **TODO**: services selector (nginx, apache2, ...) in core packages
- **TODO**: seem like debootstrap pulled everything (222 packages) but only installed required packages (about less than 100 packages). Must optimize it for faster debootstrap step
- **TODO**: default init system is not pre-selected (check calamares docs)
- **TODO**: grub missing parrot theme

##### After install issues:
- `/etc/skel/.bashrc` from `parrot-core` magically disappears, and subsequently does not get copied in user's home
- charmap issue (not UTF8) ? happens on upstream, here it works

##### Modules explanation:
- `shellprocess-bootstrap`: Generating system with debootstrap. This step is to create a system with mimimized package list
- `packages-pre`: Installs base packages + cryptsetup related and Parrot configs (skel, sources and such)
- `shellprocess-initsystem`: Do some commands to add groups, which fix packages failed to install. It also adds repository address (could be config files), install packages that can't be installed during bootstrap step so it can create a ready-to-use netinstaller environment. The whole point is to create usable environment to install selected packages and run other calamares modules.
- `shellprocess-cleanup`: Fully updates the system, cleans up temporary files/logfiles and removes apt configurations.
