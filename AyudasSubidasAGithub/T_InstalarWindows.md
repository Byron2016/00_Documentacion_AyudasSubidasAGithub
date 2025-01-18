- **LAPTOP dv6-6180la + windows + 10 + drivers**

  - PC portátil de entretenimiento HP Pavilion dv6-6180la
  - Serial:
    - 5CH14112HQ
  - Product:
    - A2U69LA#ABM
  - CustModel:
    - dv6-6180la
  - Warranty:
    - 1y1y0y
  - PCID:
    - 058E110000244710000620100

- **Unidades de arranque**

  - [elmondigital: 2 USB de arranque que TODO USUARIO de PC debería crear (Antes de que sea tarde)](https://www.youtube.com/watch?v=Ued2kyWywqI)

    - Formatear flash

      - Click derecho unidad
      - Formatear
      - formato: NTFS
      - Etiqueta
      - Iniciar

    - **USB #1**:

      - Descdargar herramienta de creación de medios de windows

        - Verificar tus discos duros
        - Verificar tu sistema de archivos de Windows
        - Eliminar actualizaciones
        - Ejecutar la restauración del sistema.

        - Ir a google y escribir descargar la herramienta de creación de medios de windows 10
          - Descargar ahora la herramienta
          - Ejecutarlo
          - Aceptar acuerdo de licencia
          - Crear medios de instalación (unidad flash USB, DVD o archivo ISO) para otro PC
          - Seleccionar Idioma, arquitectura y edición.
          - Elegir el medio a usar
            - Unidad Flash USB
            - Archivo ISO
          - Seleccionar unidad flash USB

      - **USB # 2**
        - Creación del Disto de Hiren´s BootCD
          - Buscar en google "descargar Hiren´s Boot USB"
          - Seleccionar Hiren´s BootCD PE (hidensbootcd.org)
          - Ir al archivo ISO: HBDC_PE_x64.iso y dar click
          - Seleccionar USB booting.
          - Descargar Rufus
          - Rufus
            - Doble clik en Rufus descargado.
            - Presionar Alt + E para activar el modo uefi dual
              - Aparece en la parte inferior "Modo dual EFI/BIOS desactivado"
            - Seleccionar el archivo "HBDC_PE_x64.iso"
            - Sistema Destino: Bios o UEFI
            - Esquema de partición
              - W10: mbr
              - W11: gpt
            - Para sistemas viejos activar "Agregar particiones para BIOS viejos (partición extra, alineación, etc)
            - Usar MBR de Rufus con ID de BIOS y el valor predeterminado
            - Empezar
          -

- [ComputerShopping: Como instalar Windows 10 en 2023 desde USB - TUTORIAL!](https://www.youtube.com/watch?v=WxDA6q0ND1s)

- [Javier Marin: Windows 10 y 11 desde cero: Crear dos particiones antes de instalar.](https://www.youtube.com/watch?v=WN1bNE9e9zw)

  - **Crear Partición**

    - En la pantalla <code>¿Dónde quieres instalar Windows?</code> seleccionar **Nuevo**

      - Disco Duro Particioneas

        - 50MB - Reservado para el Sistema
        - 200GB - Disco C - NTFS
        - 200GB - Disco D - NTFS - Datos
        - 200GB - Disco E - NTFS - DatosDos
        - 93.39GB - No Asignado

        - 204,800 MB -> 200 GB [convertidor](https://tradukka.com/unit/storage/gigabyte/megabyte?hl=es)

- **DRIVERS**

  - SDI (https://www.youtube.com/watch?v=vc63owOUUoY)
    - Bajar utorrent: https://getintopc.com/softwares/utorrent-pro-2019-free-download/ o en su defecto qBittorrent
    - Bajar SDI Drivers
      - how to download and install SDI drivers (step by step)
        - https://www.youtube.com/watch?v=vc63owOUUoY
      - SDI
        - https://sdi-tool.org/download/
        - seleccionar Torrent y download SDI Full
        - Alternativa para no descargar todo lo de SDI
          - Snappy Driver El mejor buscador de Drivers (Controladores) para Windows
            - https://www.youtube.com/watch?v=cIlqUAsEleE
      - qBittorrent
        - https://www.qbittorrent.org/download
        - Download qBittorrent v4.5.4
    - Una vez bajado el torrent de SDI Drivers abrirlo con qBittorrent y mandar a bajarlo
    - Entrar a la descarga realizada y ejecutar "SDI_x64_R2305.exe"
      - Idioma: Español
      - Tema: Grass
      - Modo Experto: Visto
      - Incluído en DireverPacks
        - No Instalado
        - Más nuevo
        - Más apropiado
      - No incluido en DriverPacks
        - No instalado
      - Presionar botón "Seleccionar Todo"
      - Presionar botón "Instalar"
  - **Drivers - HP Pavilion dv6-6180la**

    ![HpPavilionDv6_2011](../images/HpPavilionDv6_2011/HpPavilionDv6_2011_AdmDispositivos.jpg)
