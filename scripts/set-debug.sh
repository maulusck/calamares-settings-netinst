#!/bin/sh

# set calamares to debug mode and log to file
sed -i 's|pkexec calamares|pkexec calamares -d \| tee -a /var/log/calamares.log|g' $(which install-debian)
