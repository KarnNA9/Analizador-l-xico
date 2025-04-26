# Descripción:
Analizador léxico hecho con flex para pseudocódico C.

### Contenido:
* lexAnalyzer.l - Código principal
* entrada.txt   - Archivo para escribir la entrada
* salida.txt    - Archivo en el que el código entrega la salida

# Uso
## Windows 10-11
### Prerequisitos
* [MingW64/32](https://sourceforge.net/projects/mingw/files/latest/download) 
* [flex](https://sourceforge.net/projects/gnuwin32/files/flex/2.5.4a-1/flex-2.5.4a-1.exe/download?use_mirror=netactuate&download=) 

### Instalación
* Abra la terminal en la carpeta donde descargó los archivos del repositorio y ejecute `flex lexAnalyzer.l` para compilar el programa. Esto creará el archivo 'lex.yy.c'.
* Ejecutar `gcc lex.yy.c` para compilar el código que se creó en el paso anterior. Esto creará el archivo 'a.exe'
* Para evaluar el archivo entrada.txt, ejecutar `a.exe`. Este archivo de entrada puede probarse tal como está o puede sobreescribirlos.
* La salida del programa estará en 'salida.txt'.

### Ejemplo 
El archivo 'entrada.txt' tiene contiene lo siguiente:
```
// basic code

//float b
f b

// integer a
i a

// a = 5
a = 5

// b = a + 3.2
b = a + 3.2

//print 8.5
p b

```
su salida es
```
COMMENT 

COMMENT 
floatdcl id 

COMMENT 
intdcl id 

COMMENT 
id assign inum 

COMMENT 
id assign id plus fnum 

COMMENT 
id id 
```




