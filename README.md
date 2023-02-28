# clienteafirma-deb-package

Scripts para la generación del paquete deb de Autofirma a partir de las fuentes

## Cambios respecto a la versión oficial
A nivel de código, es el mismo que la versión oficial. Como cambios principales está un mayor cuidado al empaquetado:
 * No se cierran los navegadores al instalar (no he encontrado problemas, de momento)
 * Se ha reducido el tamaño de los archivos eliminando librerias nativas que se incluían en los jars (librerias para windows, mac y linux)

## Prerrequisitos


### Openjdk 8, Subversion, git y maven

	apt-get install subversion git maven openjdk-8-jdk


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

## Construir el paquete deb (modo rápido)
Se puede generar el paquete deb con el script construir_paquete.sh, que ejecuta todos los pasos indicados en la sección "paso a paso"

	git clone https://github.com/albfernandez/clienteafirma-deb-package.git
	cd clienteafirma-deb-package
	construir_paquete.sh
	
## Paso a paso

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
     


### Si queremos compilar el proyecto clientefirma
Si seguimos la compilacion manual (probar el proyecto pero no generar el deb)

	git clone https://github.com/ctt-gob-es/clienteafirma.git
	cd clienteafirma
	mvn clean package -Dmaven.test.skip=true -Denv=install



    
	
