#!/bin/sh
sed -i 's#pkexec calamares#pkexec calamares -d | tee /var/log/calamares.log#g' $(which install-debian)
