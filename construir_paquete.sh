#!/bin/sh

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 VERSION" >&2
  exit 1
fi

VERSION_DEBIAN=$1
VERSION_AUTOFIRMA=`echo $VERSION_DEBIAN | sed -e s/-.*//g`
echo $VERSION_AUTOFIRMA

svn export https://github.com/albfernandez/clienteafirma/tags/v$VERSION_AUTOFIRMA autofirma-$VERSION_AUTOFIRMA
tar zcvf autofirma_$VERSION_AUTOFIRMA.orig.tar.gz autofirma-$VERSION_AUTOFIRMA/
#svn export https://github.com/albfernandez/clienteafirma-deb-package/trunk/ clientefirma-deb-package
svn export https://github.com/albfernandez/clienteafirma-deb-package/tags/v$VERSION_DEBIAN clientefirma-deb-package
mv clientefirma-deb-package/debian/ autofirma-$VERSION_AUTOFIRMA/
cd autofirma-$VERSION_AUTOFIRMA
dpkg-buildpackage
