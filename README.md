# clienteafirma-deb-package

Scripts para la generación del paquete deb de Autofirma a partir de las fuentes

## Prerrequisitos

### Oracle JDK 8

En Debian
	 apt-get install 
	 make-jpkg  jdk-8u151-linux-x64.tar.gz
	 dpkg -i oracle-java8-jdk_8u151_amd64.deb 
	 
Se necesita oracle-jdk 8
Openjdk no tiene las librerias jnlp y no compila el proyecto completo.

	poner repositorio de la Universidad Jaume I en .m2/settings.xml
	
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
 * Instalar jmulticard

mvn -Dmaven.test.skip=true clean package install

 * Instalar jmimemagic
 
clienteafirma-external/afirma-lib-jmimemagic/trunk

mvn clean package install

	

Instalar itext

mvn clean package install

Instalar afirma-lib-juniversalchardet
	
mvn clean package install
	
compilar afirma-lib-oro

	mvn clean package install
	
