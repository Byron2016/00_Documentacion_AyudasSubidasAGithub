- **RUFUS**

  - [Tecnación Daez:👨‍💻 Informática - Crear USB Booteable de Windows 10 con Rufus | 2021 | ✅](https://www.youtube.com/watch?v=PFFj6SZaDEI)

    - Tener una USB de 8Gb mínimo
    - Tener archivo ISO o archivo de imagen de Windows 10 [Tecnación Daez:👨‍💻 Informática - Descargar Windows 10 ultima versión (Imagen ISO) | 2021 | ✅](https://www.youtube.com/watch?v=GHLoYw_6ias)
      - Ver manual en [T_InstWindows](https://github.com/Byron2016/00_Documentacion_AyudasSubidasAGithub/blob/main/AyudasSubidasAGithub/T_InstWindows.md)
    - Ir a [Rufus](https://rufus.ie/es/)
    - Bajar programa existen dos versiones
      - Versiones
        - **Normal**: <code>rufus-4.6.exe Estándar Windows x64 1.5 MB 2024.10.21</code>
          - [Link descarga rufus-4.6.exe](https://github.com/pbatard/rufus/releases/download/v4.6/rufus-4.6.exe)
        - **Portátil**: <code>rufus-4.6p.exe Portable Windows x64 1.5 MB 2024.10.21</code>
          - [Link descarga rufus-4.6p.exe](https://github.com/pbatard/rufus/releases/download/v4.6/rufus-4.6p.exe)
        - Usaremos la **Estándar**
    - **Uso**

      - Conectar memoria USB antes de ejecutar **rufus**
      - Dar doble click en el programa **rufus-4.6**
      - Responder SI a: ¿Quieres permitir que esta aplicación haga cambios en el dispositivo? Rufus
      - Responder SI a: Política de actualización de Rufus ¿Quieres permitir que Rufus busque actualizaciones en línea?
      - Seleccionar parámetros de configuración:

        - **Propiedades de la unidad**

          - En **Dispositivo** seleccionar la memoria USB
          - En **Elección de arranque** seleccionar

            - Disco o imagen ISO
            - Seleccionar la ubicación de la ISO (D:\YaPasadoASSD_verde\DelDownload_20240611\Iso_20250118/Win10_20220522_SpanishMx_x64_2.iso)
            - En **Opciones de imagen** dejar
              - Instalación de Windows estándar
            - En **Esquema de partición** hay que tener un poco de cuidado
              - Se debe seleccionar el mismo esquema o estilo de partición que tiene el disco donde instalaran el Sistema Operativo.
                - Ir a Administrador de discos / Crear o formatear particiones de disco duro.
                - Sobre el Disco en el que se trabajará presionar botón derecho y propiedades.
                - Ir a **Volúmenes/Estilo de partición** y seleccionar el mismo tipo que ahí indica.
              - **Características**
                - MBR
                  - Es compatible con todos los sistemas operativos
                  - Sólo es capaz de manejar discos de hasta 2TB
                  - Sólo admite 4 particiones primarias
                  - GPT
                    - Sólo funciona en sistemas operativos de 64 bits
                    - Maneja discos hasta 256TB
                    - Admite hasta 128 particiones primarias. No existe particiones lógicas
                  - MBR aún es necesario por temas de compatibilidad con dispositivos de almacenamiento móviles y sistemas operativos antiguos que aún se están utilizando como Windows XP SP3 de 32 bits.
            - En **Sistema de destino**
              - UEFI (no CSM)
            - En caso de producirse error, como fue el caso de la Pavilion Dv6 que se despliega la siguiente pantalla, se debe seleccionar

              ![Error ejecutar instalación en Pavilion Dv6](../images/HpPavilionDv6_2011/CrearArranqueRufus.JPG)

              - En **Esquema de partición**
                - MBR
              - En **Sistema de destino**
                - BIOS (o UEFI-CSM)

        - **Opciones de formateo**
          - En **Etiqueta de volumen**
            - Colocar el volumen que se quiere "Win10_X64_22H2_SpaMX_250118_MBR_BIOS" / "Win10_X64_22H2_SpaMX_250118_GPT_UEFI"
          - En **Sistema de archivos**
            - Colocar NTFS
          - En **Tamaño del clúster**
            - Colocar la que esté por defecto

      - Presionar **Empezar**
        - Como en la USB se creará un sector de arranque que sería UEFI NTFS, nos pedirá que desactivemos **Secure Boot**
          - Esta es una opción que viene en las placas bases de UEFI:NTFS , si secure boot está activado impedirá la ejecución de cualquier software que no esté firmado o certificado.
          - Para saber si **Secure Boot** está activado o desactivado vavmos a presionar la tecla y veremos **Modo del Bios** UEFI y vemos **Estado de arranque seguro** y según sea el caso habrá que activarlo o desactivarlo en el BIOS.
            - Razón: El gestor de arranque UTFS: NTFS tiene una licencia pública general conocida como GPL y Microsoft que fue el que implementó **Secure Boot** decidió que no firmaría ningún software con este tipo de licencia lo que significa que UTFS: NTFS no se puede enviar a Microsoft para la firma de **Secure Boot** ya que se rechazaría automáticamente.
            - En caso que no se haya desactivado aparecerá el mensaje "La imagen de arranque seleccionada no superó la autenticación. Presione enter para continuar."

- BalenaEtcher

  - Bajarse el programa "https://etcher.balena.io/"

  - Flash from file
  - Seleccionar el ISO
  - Presionar botón "Flash"
  -

- LINUX FROM SCRATCH
  - Github
    - https://github.com/lfs-book
