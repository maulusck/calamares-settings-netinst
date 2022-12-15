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

Live iso requires: `debootstrap`, temporarily included in `shellprocess-bootstrap`.

- **FIXME**: /usr/sbin/sources-media edit `apt-get` to apt. Belongs to `calamares-settings-parrot`
- **TODO**: services selector (nginx, apache2, ...) in core packages
- **FIXME**: bash-completion and bash failed to install because of overwriting settings in /etc/. Try to solve it and add bash-completion to bootstrap again
- **FIXME**: console-setup's setting at /etc/default/console-setup needs to change charmap to utf-8
- **TODO**: install parrot's skel
- **TODO**: install debian front-end like "dialog"
- **TODO**: seem like debootstrap pulled everything (222 packages) but only installed required packages (about less than 100 packages). Must optimize it for faster debootstrap step

##### After install issues:
- default `/etc/bash.bashrc` and user `.bashrc` remains debian standard

##### Module explain:
- `shellprocess-bootstrap`: Generating system with debootstrap. This step is to create a system with mimimized package list
- `shellprocess-initsystem`: Do some commands to add groups, which fix packages failed to install. It also adds repository address (could be config files), install packages that can't be installed during bootstrap step so it can create a ready-to-use netinstaller environment. The whole point is to create usable environment to install selected packages and run other calamares modules.
- `shellprocess-cleanup`: Makes the system full up-to-date, cleans up temporary files/logfiles and removes apt configurations.
