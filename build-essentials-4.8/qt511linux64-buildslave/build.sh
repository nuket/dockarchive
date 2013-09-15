#!/bin/bash

BASE_HREF="http://download.qt-project.org/official_releases/qt/5.1/5.1.1/"

INSTALLER="qt-linux-opensource-5.1.1-x86_64-offline.run"
HASHFILE="${INSTALLER}.sha256"

INSTALLER_URL="${BASE_HREF}${INSTALLER}"
HASHFILE_URL="${BASE_HREF}${HASHFILE}"

echo "${BASE_HREF}"
echo "${INSTALLER_URL}"
echo "${HASHFILE_URL}"

# Grab the checksum file if necessary.

if [ ! -f "${HASHFILE}" ]; then
    wget "${HASHFILE_URL}" -O "${HASHFILE}"
fi

# Grab the installer file if necessary.

if [ ! -f "${INSTALLER}" ]; then
    wget -c "${INSTALLER_URL}"
fi

# Check the local copy of the INSTALLER.

shasum --check "${HASHFILE}"

if [ $? -eq 0 ]; then
    echo "Good to go."
else
    echo "Uh-oh. Checksum didn't match."
    echo "Delete ${INSTALLER} and run this script again."
fi
