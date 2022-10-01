- Create netinstaller module for calamares
- Based on https://arcolinuxforum.com/viewtopic.php?f=46&t=2525&p=10207
- TODO Need to find a solution to install kernel without unpacking FS (https://github.com/arcolinux/arcod-calamares-config-git). This method from debian should help too https://salsa.debian.org/installer-team/debian-installer-utils/
- TODO parrot-interface-common contains firefox-esr profiles but it depends on too many packages
- TODO LUKS missing packages?
- TODO some packages should be enabled by default
- TODO: oem setup https://invent.kde.org/neon/neon/calamares-settings/-/blob/Neon/unstable/oem-prepare/calamares/oem-prepare/settings.conf
- TODO: system init selector, services selector (nginx, apache2, ...)
License: GPL3 (soem settings from arco linux)