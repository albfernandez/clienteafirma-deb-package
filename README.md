# clienteafirma-deb-package

Scripts para la generación del paquete deb de Autofirma a partir de las fuentes

## Cambios respecto a la versión oficial
A nivel de código, es el mismo que la versión oficial. Como cambios principales está un mayor cuidado al empaquetado:
 * No se cierran los navegadores al instalar (no he encontrado problemas, de momento)
 * Se ha reducido el tamaño de los archivos eliminando librerias nativas que se incluían en los jars (librerias para windows, mac y linux)

## Prerrequisitos


### Openjdk 11, Subversion, zip, git y maven

	apt-get install subversion zip git maven openjdk-11-jdk



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



    
	
