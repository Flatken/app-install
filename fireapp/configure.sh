#!/bin/bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Don't source me"
    return 1
fi
set -e
thisdir=$(readlink -f $(dirname $BASH_SOURCE))
. $thisdir/env.sh

mkdir -p build-$fireapp_version

pushd build-$fireapp_version

cmake ../fireapp \
      -DCMAKE_INSTALL_PREFIX=$fireapp_prefix \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON \
      -DNetCDF_LIBRARY=$NETCDF_DIR/lib/libnetcdf.so \
      -DNetCDF_INCLUDE_DIR=$NETCDF_DIR/include \
      -DFIREAPP_CONAN=ON \
      -DFIREAPP_CONAN_GDAL=OFF \
      -DCONAN_CMD=$CONAN_DIR/bin/conan

popd
