#!/bin/sh

VERSION_JMULTICARD=1.8.202301.1
VERSION_AUTOFIRMA=1.8.202301.1
VERSION_EXTERNAL=202301.1
echo $VERSION_AUTOFIRMA

# Eliminamos los archivos generados previamente
rm -rf autofirma-*
rm -rf autofirma_*
rm -rf clienteafirma-external*
rm -rf jmulticard*


# Para incluir los ultimos cambios del DNI 3 unamos una versión aún no liberada de JMULTICARD 
#svn export https://github.com/albfernandez/jmulticard/tags/v.$VERSION_JMULTICARD jmulticard-$VERSION_JMULTICARD
#cd jmulticard-$VERSION_JMULTICARD
#mvn clean package -Dmaven.test.skip=true install
#cd ..

#svn export https://github.com/albfernandez/clienteafirma-external/tags/v.$VERSION_EXTERNAL clienteafirma-external-$VERSION_EXTERNAL
#cd clienteafirma-external-$VERSION_EXTERNAL
#mvn clean package -Dmaven.test.skip=true install
#cd ..

#svn export https://github.com/albfernandez/clienteafirma/tags/v.$VERSION_AUTOFIRMA autofirma-$VERSION_AUTOFIRMA
#tar zcvf autofirma_$VERSION_AUTOFIRMA.orig.tar.gz autofirma-$VERSION_AUTOFIRMA/



# Descargar y compilar jmulticard
wget https://github.com/albfernandez/jmulticard/archive/refs/tags/v.$VERSION_JMULTICARD.zip -O jmulticard-$VERSION_JMULTICARD.zip
unzip jmulticard-$VERSION_JMULTICARD.zip
cd jmulticard-v.$VERSION_JMULTICARD
mvn clean package -Dmaven.test.skip=true install
cd ..

# Descargar y compilar clienteafirma-external
wget https://github.com/albfernandez/clienteafirma-external/archive/refs/tags/v.$VERSION_EXTERNAL.zip -O clienteafirma-external-$VERSION_EXTERNAL.zip
unzip clienteafirma-external-$VERSION_EXTERNAL.zip
cd clienteafirma-external-v.$VERSION_EXTERNAL
mvn clean package -Dmaven.test.skip=true install
cd ..

# Descargar y empaquetar clienteafirma
wget https://github.com/albfernandez/clienteafirma/archive/refs/tags/v.$VERSION_AUTOFIRMA.zip -O autofirma-$VERSION_AUTOFIRMA.zip
unzip autofirma-$VERSION_AUTOFIRMA.zip
mv clienteafirma-v.$VERSION_AUTOFIRMA autofirma-$VERSION_AUTOFIRMA
tar zcvf autofirma_$VERSION_AUTOFIRMA.orig.tar.gz autofirma-$VERSION_AUTOFIRMA/

cp -a debian/ autofirma-$VERSION_AUTOFIRMA/

cd autofirma-$VERSION_AUTOFIRMA

dpkg-buildpackage
