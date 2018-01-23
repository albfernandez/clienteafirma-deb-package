# clienteafirma-deb-package

Scripts para la generación del paquete deb de Autofirma a partir de las fuentes

## Prerrequisitos

### Oracle JDK 8

En Debian

	apt-get install 
	make-jpkg  jdk-8u151-linux-x64.tar.gz
	dpkg -i oracle-java8-jdk_8u151_amd64.deb 
	 
Se necesita oracle-jdk 8, OpenJDK no tiene las librerias jnlp y no compila el proyecto completo.

### Poner repositorio de la Universidad Jaume I en .m2/settings.xml
	
```xml
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
	<profiles>
  		<profile>
			<id>uji-repository</id>
			<repositories>
				<repository>
					<id>uji-repository</id>
					<name>Universitat Jaume I</name>
					<url>http://devel.uji.es/nexus/content/groups/public/</url>
					<layout>default</layout>
					<releases>
						<enabled>true</enabled>
						<updatePolicy>never</updatePolicy>
					</releases>
				</repository>
			</repositories>
		</profile>
	</profiles>
	<activeProfiles>
    	<activeProfile>uji-repository</activeProfile>
  	</activeProfiles>
</settings>
```

### Compilar e instalar Instalar dependencias
 * jmulticard
 * clienteafirma-external
  * jmimemagic
  * itext
  * juniversalchardet
  * afirma-lib-oro

#### jmulticard

    git clone https://github.com/ctt-gob-es/jmulticard.git
    cd jmulticard
    mvn -Dmaven.test.skip=true clean package install
    
#### clienteafirma-external

     git clone https://github.com/ctt-gob-es/clienteafirma-external.git
     cd clienteafirma-external
     mvn clean package install
     

## Construir el paquete deb.
Se puede generar el paquete deb con el script construir_paquete.sh

	construir_paquete.sh 1.6.0-1

## Si queremos compilar el proyecto
Si seguimos la compilacion manual (probar el proyecto pero no generar el deb)

	git clone https://github.com/ctt-gob-es/clienteafirma.git
	mvn clean package -Dmaven.test.skip=true -Denv=deploy

    
	
