- **LAPTOP dv6-6180la + windows + 10 + drivers**

  - **Características**

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

    - **System Information (Presionar ESC y luego F1)**
      - Notebook Model: HP Pavillion dv6 Notebook PC
      - Product Number: A2U69LA#AEM
      - Serial Number: 5CH14112HQ
      - Warranty Start Date: 10/14/2011
      - System board ID: 3388
      - Product configuration ID: 058E110000244710000620100
      - System Board CT Number: PBZAU04HT1H00N
      - BIOS Version: F.1A
      - Processor Type: Intel(R) Core(TM) i7-2630QM CPU @ 2.00GHz
      - Processor Spedd: 2000 MHZ
      - Total Memory: 12 GB
      - Primary Battery SN: 04147 09/17/2011
      - WLAN FCC ID: PD911230BNHU
      - Bluetooth FCC ID:

  - **Entrar al BIOS**
    - **LAPTOP dv6-6180la**
      - Con **F10**
        - Colocar el drive USB en el equipo
        - Prender y presionar de manera repetitiva **F10**
        - Ir a **Boot Order** y colocar primero al USB.
        - Guardar y Salir/reboot.
      - Con **ESC** para que salga el siguente menú
        - Menu
          - F1 System Information
          - F2 System Diagnostic
          - F9 Boot Device Options
          - F10 BIOS Setup
          - F11 System Recovery
          - F12 Network BOOT
        - Seleccionar **F10** para hacer lo que indica en Con **F10**
        - Podría ser que se necesite **F9** para seleccionar el USB

- **Windows 10**

  - Descargar Imagen
    - [Tecnación Daez:👨‍💻 Informática - Descargar Windows 10 ultima versión (Imagen ISO) | 2021 | ✅](https://www.youtube.com/watch?v=GHLoYw_6ias)
      - Ir a [Descargar Windows 10](https://www.microsoft.com/es-es/software-download/windows10)
      - Seleccionar **Descargar ahora** en **Crear medios de instalación de Windows 10**
        - MediaCreationTool_22H2.exe
      - Pero eso no me sirve, en esta pantalla presionar click derecho y dar en "Inspeccionar"
      - Presionar para ver como en **dispositivo móvil**
      - Hacer click en recargar y cerrar el inspector de página
      - Ahora en sección **Actualización de Windows 10 2023 | Versión 22H2**
      - Seleccionar el idioma
      - Seleccionar 64 o 32 bits.

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
