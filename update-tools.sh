#!/bin/bash
#
# Update Tools in Jenkins from Git repo
#
# Copy
#   $WORKSPACE/bin/* $home/bin
#   $WORKSPACE/etc/* $home/etc

. bin/source-home.sh

echo "INFO: Destination HOME: ${NODE_HOME}"
if [ -d ${WORKSPACE}/bin ]; then
  echo "INFO: Copying bin..."
  cp -afu ${WORKSPACE}/bin ${NODE_HOME}
fi
if [ -d ${WORKSPACE}/etc ]; then
  echo "INFO: Copying etc..."
  cp -afu ${WORKSPACE}/etc ${NODE_HOME}
fi
