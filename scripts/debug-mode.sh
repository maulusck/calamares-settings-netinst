#!/bin/bash
set -e
[ -x $(which install-debian 2>/dev/null) ] || \
[ -z $(grep -ri log $(which install-debian 2>/dev/null)) ] || \
sed -i 's#pkexec calamares#pkexec calamares -d | tee /var/log/calamares.log#g' $(which install-debian)
