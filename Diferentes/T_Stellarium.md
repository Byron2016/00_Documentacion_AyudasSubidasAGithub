**Stellamrium**

- **Stellerium 26.4**

- *Bajar los catálogos*

  ```bash 
    # Definimos la base de la URL de descarga de SourceForge
    BASE_URL="https://downloads.sourceforge.net/project/stellarium/Extra-data-files/stars-3.0"

    # Lista con todos los archivos exactos del directorio stars-3.0
    # Tomar en cuenta que los .asc no es necesario bajarlos es solo para validar como se indica más adelante.
    
    files=(
      "README.md"
      "stars_4_1v0_6.cat"
      "stars_4_1v0_6.cat.asc"
      "stars_5_1v0_6.cat"
      "stars_5_1v0_6.cat.asc"
      "stars_6_1v0_4.cat"
      "stars_6_1v0_4.cat.asc"
      "stars_7_1v0_4.cat"
      "stars_7_1v0_4.cat.asc"
      "stars_8_2v0_3.cat"
      "stars_8_2v0_3.cat.asc"
    )

    # Bucle para descargar cada uno con curl siguiendo redirecciones
    for file in "${files[@]}"; do
      echo "Descargando: $file..."
      curl -L -O "${BASE_URL}/${file}"
    done

    Nota: 
    	- curl -L -O "https://downloads.sourceforge.net/project/stellarium/Extra-data-files/stars-3.0/    stars_5_1v0_6.cat"
  ```

- *Obtener Verificación archivos de estrellas (secure/seguridad)*
	- ir a github.com/Stellarium/stellarium/releases
		- Import Stellarium's GPG key Bajar la clave pública
			- <code>curl -O https://stellarium.org/files/stellarium.gpg</code>
		- List Stellarium's GPG key auditar, inspeccionar y listar la información interna de la clave pública
			- <code>gpg --with-fingerprint --show-keys --keyid-format long stellarium.gpg</code>
			- Arroja el ID y el FingerPrint que debe coincidir con lo que dice en la web.
		- Verify the binary file is valid (tarball for example) Es el momento en el que usas toda la criptografía matemática para comprobar si el archivo que te descargaste es 100% seguro, original y no ha sido alterado por nadie.
			- <code>gpgv --keyring ./stellarium.gpg stars_5_1v0_6.cat.asc stars_5_1v0_6.cat</code>
			- Ejecutarlo para cada archivo:
				- <code>gpgv --keyring ./stellarium.gpg stellarium-25.3.tar.gz.asc stellarium-25.3.tar.gz</code>
				- Ejecutar
  				- For 1
          ```bash
            for i in 4_1v0_6 5_1v0_6 6_1v0_4 7_1v0_4 8_2v0_3; do
              echo "=== Verificando catálogo stars_${i} ==="
              gpg --keyring ./stellarium.gpg --verify stars_${i}.cat.asc stars_${i}.cat
              echo -e "\n"
            done
          ```
  				- For 2 (Si no funciona el anterior, ver más abajo)
          ```bash
            for i in 4_1v0_6 5_1v0_6 6_1v0_4 7_1v0_4 8_2v0_3; do
              echo "=== Verificando catálogo stars_${i} ==="
              gpg --verify stars_${i}.cat.asc stars_${i}.cat
              echo -e "\n"
            done
          ```

			- Verificar resultado, debe decir: 
				- gpg: Good signature from...
				
			- Si da error antes del for ejecutar
				- gpg --import ./stellarium.gpg
				- Y ejecutar el *for 2*
				
- *Copiar a Windows 10*
	- teclas Windows + R y poner: %APPDATA%\Stellarium\stars\hip_gaia3\
	- Si el comando te da un error informando que la ruta no existe, ve un nivel atrás ejecutando %APPDATA%\Stellarium\, crea manualmente una carpeta llamada stars y, dentro de ella, otra llamada hip_gaia3
	- Toma los archivos .cat que descargaste desde el navegador y copialos dentro de esa carpeta hip_gaia3.
	- Vuelve a abrir Stellarium.
	- Dirígete a la Ventana de configuración (F2) > pestaña Herramientas > Actualización de catálogos de estrellas. Verás que el programa detecta automáticamente los archivos añadidos y el botón de descarga cambiará a un indicador de que el catálogo ya está presente en el sistema.

