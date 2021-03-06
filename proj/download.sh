#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

wget https://download.osgeo.org/proj/proj-$proj_version.tar.gz
tar -xzf proj-$proj_version.tar.gz
