#!/bin/sh

VERSION_JMULTICARD=1.7.20220204.1
VERSION_AUTOFIRMA=1.7.202202.2
VERSION_DEBIAN=1.7.202202.2-1
VERSION_EXTERNAL=20220204.1
echo $VERSION_AUTOFIRMA


# Para incluir los ultimos cambios del DNI 3 unamos una versión aún no liberada de JMULTICARD 
svn export https://github.com/albfernandez/jmulticard/tags/v.$VERSION_JMULTICARD jmulticard-$VERSION_JMULTICARD
cd jmulticard-$VERSION_JMULTICARD
mvn clean package -Dmaven.test.skip=true install
cd ..

svn export https://github.com/albfernandez/clienteafirma-external/tags/v.$VERSION_EXTERNAL clienteafirma-external-$VERSION_EXTERNAL
cd clienteafirma-external-$VERSION_EXTERNAL
mvn clean package -Dmaven.test.skip=true install
cd ..

svn export https://github.com/albfernandez/clienteafirma/tags/v.$VERSION_AUTOFIRMA autofirma-$VERSION_AUTOFIRMA
tar zcvf autofirma_$VERSION_AUTOFIRMA.orig.tar.gz autofirma-$VERSION_AUTOFIRMA/

svn export https://github.com/albfernandez/clienteafirma-deb-package/tags/v.$VERSION_DEBIAN clienteafirma-deb-package
cp -a clienteafirma-deb-package/debian/ autofirma-$VERSION_AUTOFIRMA/


cd autofirma-$VERSION_AUTOFIRMA

dpkg-buildpackage
