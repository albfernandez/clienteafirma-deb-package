#!/bin/sh

VERSION_JMULTICARD=1.8.202301.1
VERSION_AUTOFIRMA=1.8.202301.1
VERSION_EXTERNAL=202301.1
echo $VERSION_AUTOFIRMA

# Eliminamos los archivos generados previamente
rm -f autofirma-1.8* autofirma_1.8*

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

cp -a debian/ autofirma-$VERSION_AUTOFIRMA/

cd autofirma-$VERSION_AUTOFIRMA

dpkg-buildpackage
