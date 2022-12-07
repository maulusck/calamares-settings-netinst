\- Create netinstaller module for calamares
- Netinstaller module is based on https://arcolinuxforum.com/viewtopic.php?f=46&t=2525&p=10207b
```
rm -f /etc/machine-id /var/lib/dbus/machine-id
dbus-uuidgen --ensure=/etc/machine-id
dbus-uuidgen --ensure
RE: https://wiki.debian.org/MachineId
```
Shout out @Pandaiscool author of RebornOS for this solution
License: GPL3 (soem settings from arco linux)

Live iso requires: `debootstrap` but calamares config installs it automatically
- TODO some packages should be installed by default (by `deboostrap`). Check that in `shellprocess-initsystem.config`
- FIXME: `/usr/sbin/sources-media` edit `apt-get` to apt. Belongs to `calamares-settings-parrot`
- FIXME: `sources-media` must have parrot's source list -> install `sudo` and `dbus`. This also fixes `dbus-uuidgen` and `/etc/sudoers` missing
- TODO LUKS missing packages?
- TODO: system init selector, services selector (`nginx`, `apache2`, ...)
- TODO: kernel arch selector (for now `linux-image-amd64` is automatically chosen and installed)
- TODO: network firmware missing by default (apparently? check)
