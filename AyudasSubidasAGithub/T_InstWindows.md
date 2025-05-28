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
          - En **Boot Options** Existe una entrada **POST HotKey Delay (sec)**
            - **POST hotkey delay** es una configuración del BIOS que controla que tiempo un usuario tiene para presionar la tecla de función para entrar a la utilidad de Setup cuando el computador arranca.
              - [Que hace POST hotkey delay](https://h30434.www3.hp.com/t5/Notebook-Operating-System-and-Recovery/How-much-of-a-delay-in-seconds-should-I-set-up-Also-what-the/td-p/6271964)
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

  - [MovilAndroide: Instala Windows 11/10 en un disco duro sin usar Pendrives ni Discos de Instalación](https://www.youtube.com/watch?v=HMhaejCWuM4)
    - [MovilAndroide: Instala Windows 11/10 en un disco duro sin usar Pendrives ni Discos de Instalación](https://movilandroide.com/instalar-windows-11-10-sin-usar-pendrives-ni-discos-de-instalacion/)
      - **Requisitos**
        - Un PC con Windows instalado
        - El disco duro donde vayamos a instalar Windows debe estar conectado a la placa base del PC mediante un cable serial ATA
        - El archivo .ISO de instalación
        - Bajar programa [WinToHDD](https://www.easyuefi.com/wintohdd/index.html)
      - **Proceso**
        - Ejecutar **WinToHDD** y seleccionar **Instalación Nueva**
        - Seleccionar el **.ISO** y elegir la versión
        - **Unidad de destino** ponemos el nuevo disco
        - Selected device needs to be formatted, plase select the partition schema
          - MBR para BIOS <----- 📌
          - GPT para UEFI
          - Conservar el esquema de partición existente
        - La unidad se formatea y se crea una pequeña partición de sistema y una de arranque y formateamos las dos.
        - Al finalizar se tendrá windows instalado pero sin configurar. (En carpeta Usuarios no aparece ni siquiera el usuario)
        - Cambiar el Disco al nuevo equipo para que al prenderlo se empiece a configurar.

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

  - **Funcional al 100% 20250207 cambio Disco Duro**
    - Copiar localmente windows/system32 del disco viejo
      - A copiar:
        - 5.42GB (5.823.126.864 bytes)
        - En disco: 5.37GB (5.768.355.840 bytes)
        - 15.219 archivos. 1.286 carpetas
			- Copiado <code>D:\Borrar_20250121\CopiaParaDrivers</code>: 
				- 6.02GB (6.472.562.391 bytes)
				- En disco: 6.05GB (6.500.368.384 bytes)
				- 16.248 archivos. 3.604 carpetas
 
    - Abrir el *Administrador de dispositivos* 
      - Seleccionar el controlador a corregir 
      - Botón derecho "Actualizar Controlador"
      - Seleccionar "Buscar controlador en mi equipo" y apuntar a <code>D:\Borrar_20250121\CopiaParaDrivers</code>
      - Resultado:
        - Para: *Dispositivo PCI*
          - Instala: RealTek PCIE CardReader 
        - Para: *Dispositivo desconocido*
          - Instala: HP Mobile Data Protection Sensor 
        - Para: *Controladora simple de comunicaciones PCI*
          - Instala: Intel(R) Management Engine Interface 
        - Para: *AMD Radeon HD 6700M Series*
          - Resolución de pantalla sigue igual.

			- Al ver los dispositivos nuevamente en *Administrador de dispositivos*
				- Indica para Intel(R) HD Graphics 3000 
					- **Windows detuvo este dispositivo porque informó de problemas. (Código 43)**
						- [Tutoriales IT: ¿ERROR 43 en WINDOWS 10/11? 🛠️ Aquí tu SOLUCIÓN](https://www.youtube.com/watch?v=Uq-XzK7KLjc)
							- Presionar tecla windows + R 
							- Ejecuar <code>msdt.exe -id DeviceDiagnostic</code> 
  							- Abre el asistente "Solucionar y audar a evitar los problemas del equipo" presionar siguiente
								- Indica que: Intel(R) HD Graphics 3000 tiene un error.
								- Habilitar Windows para buscar comprobación automática.
								- Reiniciar el equipo. 
  
  - **Solo como referencia Esto no funciona.**
    - Puse a buscar directamente en el <code>windows/system32/drives (incluídas subcarpetas) del disco viejo</code> para  
      - Adaptadores de pantala: 
        - AMD Radeon HD 6700M Series 
        - Intel(R) HD Graphics 3000
      - Otros dispositivos	
        - Controladora simple de comunicaciones PCI 
        - Dispositivo desconocido 
        - Dispositivo PCI 
		- Resultado NULO.
  
  - **Esto ya no aplicaría se deja como referencia**

    - [SDI] (https://www.youtube.com/watch?v=vc63owOUUoY)
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

- **Para el tema de drivers 20250121**

  - [Crear una lista con todos los controladores del sistema](https://www.softzone.es/windows/como-se-hace/ver-controlado)

    - cmd
    - <code>driverquery</code>
    - PowerShell
      - <code>Get-WmiObject Win32_PnpSignedDriver| select DeviceName, Manufacturer, DriverVersion Get-WmiObject Win32_PnPSignedDriver| select DeviceName, Manufacturer, DriverVersion</code>
    - Otros Programas
      - InstalledDriverList
      - IObit Driver Booster
    - **Crear copia y restaurar con Dism** 
      - [Utilizar CMD para copiar y restaurar drivers de Windows]https://www.softzone.es/windows/como-se-hace/truco-cmd-ver-guardar-drivers/)
        - Copia
          - <code>dism /online /export-driver /destination:C:/Copia-seguridad-drivers_conDism</code>
            - [export-driver](https://learn.microsoft.com/es-es/windows-hardware/manufacture/desktop/dism-driver-servicing-command-line-options-s14?view=windows-11#export-driver)
        - Restaurar
          - <code>dism /online /Add-Driver /Driver: C:/Copia-seguridad-drivers_conDism /Recurse</code>
            - [add-driver](https://learn.microsoft.com/es-es/windows-hardware/manufacture/desktop/dism-driver-servicing-command-line-options-s14?view=windows-11#add-driver)
          - <code>dism /online /Add-Driver /Driver: D:\Borrar_20250121\b00_Documentacion_AyudasSubidasAGithub\z_Respaldos\Copia-seguridad-drivers_conDism /Recurse</code>
          - <code>dism /online /Add-Driver /Driver:D:\Borrar_20250121\b00_Documentacion_AyudasSubidasAGithub\z_Respaldos\Copia-seguridad-drivers_conDism /Recurse</code>
          
          - La herramienta DISM (Deployment Image Servicing and Management) con el comando **DISM /Cleanup-Image** analiza y repara la imagen de Windows
            - dism /Online /Cleanup-Image /AnalyzeComponentStore (https://www.youtube.com/watch?v=c95a5HweNr0)


  - [Windows 10 tendrá carpeta OEMDRIVER para controladores de terceros](https://www.muycomputer.com/2021/03/30/controladores-de-windows/)
    - hacker Albacore ()
      - OEMDRIVERS
      - %SystemRoot%\System32\DriverStore
      - En las versiones actuales de Windows 10, todos los controladores, ya sean controladores de Microsoft o de terceros, se almacenan juntos en DriverStore.
  - [TutosVideos: Como Guardar Drivers o Controladores Antes de Formatear tu PC: Trucos y Pasos Cruciales](https://www.youtube.com/watch?v=DombCEIloag)
    - [TutosVideos: Como Guardar Drivers o Controladores Antes de Formatear tu PC: Trucos y Pasos Cruciales](https://tutosvideos.com/4089/)
      - windows/System32/DriverStore Los controladores estarán en carpeta FileRepository
      - [Driver Genius: DG_Setup](https://www.mediafire.com/file/8vcsnxh1ob77sq1/DG_Setup.exe/file)
        - [Driver Genius: DG_Setup](https://drivergenius.es/))

  - [¿En qué CARPETA se GUARDAN los DRIVERS en WINDOWS 10?](https://www.dailymotion.com/video/x8xmndw)
  - [✅ Cómo REPARAR automáticamente PROBLEMAS de BUCLE en Windows 11🔴 Reparación de INICIO de Windows](https://www.youtube.com/watch?v=lXdGJBv6OJQ)
    - diskpart
      - list volume 
        - Ver en que volumen está instalado
      - exit 
    - chkdsk c: 
      - Escanea en busca de errores 
        - chkdsk c: /r /f
        - NUNCA DETENER A LA MITAD X Q PUEDES DAÑAR SISTEMA DE ARCHIVOS Y SE VUELVEN IRRECUPERABLES 
    - Examinar sistema operativo en busca archivos daños y reparlos o sustituirlos
      - sfc /scannow  
    - Actualizar directivas. si no pertenece a un domineo no funcionará.
      - gpupdate
    - Reparar el boot del sistema operativo.
      - bootrec /fixmbr
      - bootrec /fixboot
    - exit 
    - apagar equipo 
    - Si no funcionaria volver a inicio avanzado windows
      - Solucionar problemas 
        - Restablecer este equipo 
          - formateará con dos opciones mantener o formatear todo.

- **Windows 10 LTSC**
	- [Proto: Me REGRESO a Windows 10 PERO CON 7 AÑOS DE SOPORTE GRATIS](https://www.youtube.com/watch?v=j6FFrSJr9aE)
    - **ISO** 
      - **Inglés**
        - Baja automáticamente
          - [ISO Windows 10 IoT Enterprise LTSC 2021 (English) x64](https://archive.org/download/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f_202301/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso&v=j6FFrSJr9aE)
        - Al archive para seleccionar
        - [en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso (View Contents)](https://archive.org/download/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f_202301/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f.iso)
        - **Desde Microsoft**
          - [Windows 10 Enterprise](https://www.microsoft.com/en-us/evalcenter/evaluate-windows-10-enterprise)
            - Ir a esa página.
            - Presionar a **Download the ISO - LTSC Enterprise**
              - [Evaluate Windows 10 Enterprise](https://info.microsoft.com/ww-landing-windows-10-enterprise.html)
              - Ingresar la información que solicitan
              - Presonar **Descargar ahora**
              - Buscar
                - Español
                - ISO: descargar de la versión LTSC de Enterprise
		- **Licencia** 
  		- [VIP-UEcdkey: ](https://www.vip-urcdkey.com/software/p202502111054418302.html?urd=PROTOL)
    		- Al parecer es más barata que la **kopkeys**
    		- Cup(A_no) 
      		- **A_PROTO_A**
      		- **A_UKGA_A** (MIO)
	- [acaele: Instalación Windows 10 IoT Enterprise 2021 x64 caduca en 2032](https://www.youtube.com/watch?v=Lp7qepjK_oI)
		- **Licencia** 
  		- [kopkeys: MS Win 10 Enterprise LTSC 2021 IoT Edition CD Key Global ](https://www.kopkeys.com/software/p202504011030576914.html?urd=LTSC2021)
    		- Buy now
    		- Cup(A_no) 
      		- **A_ACA_A**
      		- **A_KMS_A**
      		- **A_SKU3_A** (MIO)
    - **ISO** 
      - **Inglés**
        - [ISO Windows 10 IoT Enterprise LTSC 2021 (English) x64](https://archive.org/details/en-us_windows_10_iot_enterprise_ltsc_2021_x64_dvd_257ad90f_202301)
          - Una vez instalado si se puede cambiar a inglés
      - **Español** 
        - [ISO Windows 10 Enterprise LTSC 2021 (Spanish) [x86/x64]]()
      - **Multilingual**
        - [ISO Windows 10 IoT Enterprise LTSC 2021 64bit Multilingual (Fully Updated) Archive](https://archive.org/details/mul_windows_10_iot_enterprise_ltsc_custom-Archive)

  - **DeepSeek preguntas**
  	- Los requisitos mínimos oficiales para Windows 10 LTSC (Long-Term Servicing Channel) son los mismos que para las versiones estándar de Windows 10, ya que comparten la misma base técnica. A continuación, te detallo los requerimientos:
    	- **Requisitos mínimos para Windows 10 LTSC (2021 o versiones anteriores)**
      	- **Procesador**: 
        	- CPU de 1 GHz o más rápido (compatible con PAE, NX y SSE2).
      	- **RAM**:
		    	- 2 GB para versiones de 64 bits (x64).
		    	- 1 GB para versiones de 32 bits (x86).
		    - **Almacenamiento**:
  		    - 32 GB de espacio en disco para versiones de 64 bits.
  		    - 16 GB para versiones de 32 bits.
        - **Tarjeta gráfica**:
          - DirectX 9 o posterior con controlador WDDM 1.0.
          - Para determinar la tarjeta gráfica mirar más abajo pasos a seguir
        - **Pantalla**:
          - Resolución mínima de 800 × 600 píxeles.
        - **Conexión a Internet**:
          - No es obligatoria, pero se recomienda para activación y actualizaciones.
      - **Notas importantes**:
        - LTSC vs. Versiones normales:
          - Windows 10 LTSC está optimizado para entornos críticos (como kioscos, equipos industriales o sistemas embebidos) y no incluye aplicaciones modernas como Microsoft Store, Cortana ni actualizaciones de características frecuentes.
          - Solo recibe actualizaciones de seguridad durante su ciclo de vida (generalmente 5 años de soporte estándar + 5 años opcionales con pago).
    - **Recomendaciones reales**:
      - Para un mejor rendimiento, se sugiere al menos 4 GB de RAM y un SSD (especialmente en sistemas de 64 bits).
      - Algunas aplicaciones empresariales pueden requerir más recursos.
    - **Compatibilidad**:
      - Verifica que el hardware sea compatible con Windows 10 (algunos drivers antiguos pueden no funcionar).
      - Si planeas instalar Windows 10 LTSC 2021, asegúrate de que tu hardware cumpla estos requisitos para un funcionamiento óptimo.
	
    - **Conocer que Tarjeta gráfica tengo**
	    - Para determinar qué tarjeta gráfica tiene tu CPU (o sistema en general), puedes seguir estos métodos según tu sistema operativo:
	    	- En Windows:
	    		- 1. Usar el Administrador de dispositivos
	    			- Presiona Win + X y selecciona "Administrador de dispositivos". 
	    			- Expande la sección "Adaptadores de pantalla". 
	    				- Ahí aparecerá el modelo de tu tarjeta gráfica (ejemplo: NVIDIA GeForce RTX 3060, AMD Radeon RX 6700 XT, o Intel UHD Graphics 630 si es gráfica integrada).

			    - 2. Usar el comando dxdiag
			    	- Presiona Win + R, escribe dxdiag y presiona Enter. 
			    	- Ve a la pestaña "Pantalla".
			    	- En "Nombre" aparecerá el modelo de tu GPU.

			    - 3. Usar la Configuración de Windows
			    	- Ve a Configuración > Sistema > Pantalla > Configuración de gráficos.
			    	- Haz clic en "Propiedades de la pantalla" y luego en "Adaptador de pantalla".

			    - 4. Usar software de terceros
			    	- CPU-Z (gratis): Muestra detalles de la GPU en la pestaña "Graphics".
			    	- GPU-Z (especializado en tarjetas gráficas).
			    	- Speccy (muestra información detallada del hardware).
				
    - **Software en Windows 10 LTSC**
      - **Adobe**
	      - **Adobe Photoshop**
	      	- Sí, Adobe Photoshop puede instalarse y ejecutarse en Windows 10 LTSC, pero hay algunas consideraciones importantes que debes tener en cuenta:
	      	- 1. Compatibilidad Técnica
	      		- Windows 10 LTSC está basado en la misma base técnica que las versiones normales de Windows 10, por lo que Photoshop (CS6, CC 2018, 2020, 2024, etc.) debería funcionar sin problemas.
	      		- Requisitos oficiales de Adobe Photoshop (2024):
	      			- Windows 10 (versión 22H2 o posterior, LTSC 2021 está basado en 21H2, por lo que es compatible).
	      			- CPU de 2 GHz o más rápido (SSE2+).
	      			- 8 GB de RAM (recomendado 16 GB para edición profesional).
	      			- 2 GB de espacio en disco (más para archivos temporales).
	      			- GPU compatible con DirectX 12 (opcional, pero necesario para funciones aceleradas por hardware).

		      - 2. Posibles Problemas y Soluciones
		      	- A. Falta de Microsoft Store y dependencias
		      		- Windows 10 LTSC no incluye Microsoft Store por defecto, y algunas versiones recientes de Photoshop CC pueden requerir componentes como:
		      			- Microsoft Edge WebView2 (necesario para funciones de Creative Cloud).
		      			- VC++ Redistributable y otros runtime libraries. 
		      		- Solución:
		      		- Instala manualmente los requisitos desde el sitio oficial de Microsoft:
		      			- WebView2 Runtime
		      		- Visual C++ Redistributable.

			      - B. Creative Cloud (CC) en LTSC
			      	- La aplicación Adobe Creative Cloud (necesaria para instalar Photoshop CC) funciona en LTSC, pero puede requerir ajustes:
			      		- Si falla la instalación, descarga el instalador manual desde Adobe.com.
			      		- Algunas funciones en la nube (como fuentes de Adobe) pueden tener limitaciones.

	      		- C. Versiones Recomendadas
			      	- Si prefieres evitar Creative Cloud, puedes usar:
			      		- Photoshop CS6 (versión independiente, sin suscripción).
			      		- Photoshop Portable (no oficial, útil para usos básicos).

		      - 3. Optimización en LTSC
		      	- Desactiva las actualizaciones automáticas de LTSC (ya que no recibirá nuevas funciones, solo parches de seguridad).
		      	- Asegúrate de tener los drivers de GPU actualizados (especialmente si usas funciones como Hardware Acceleration en Photoshop).

		      - Conclusión
			      - ✅ Photoshop funciona en Windows 10 LTSC, pero: 
			      	- Si usas Photoshop CC (Creative Cloud), instala manualmente los requisitos faltantes (WebView2, VC++).
			      	- Si prefieres evitar dependencias, opta por CS6 o versiones portable.
			      	- Verifica que tu hardware cumpla con los requisitos de Adobe.

        - **Adobe Illustrator**
		      - Sí, Adobe Illustrator puede instalarse y ejecutarse en Windows 10 LTSC, pero al igual que con Photoshop, hay algunos detalles importantes que debes considerar para garantizar su correcto funcionamiento.
		      - 1. Compatibilidad Oficial
		      	- Windows 10 LTSC 2021 (basado en Windows 10 21H2) cumple con los requisitos de Adobe Illustrator CC (2020, 2021, 2022, 2023, 2024).
		      	- Requisitos mínimos de Illustrator CC (2024):
		      		- Windows 10 (versión 22H2 o posterior). (LTSC 2021 usa 21H2, pero funciona sin problemas en la práctica).
		      		- CPU multicore de 2 GHz o superior (SSE4.2+).
		      		- 8 GB de RAM (16 GB recomendado para proyectos complejos).
		      		- 2 GB de espacio en disco (más para archivos temporales).
		      		- GPU compatible con DirectX 12 (opcional, pero necesario para renderizado acelerado).

		      - 2. Posibles Problemas y Soluciones
		      	- A. Dependencias Faltantes (Creative Cloud y Microsoft Store)
		      		- Windows 10 LTSC no incluye Microsoft Store, y algunas funciones de Illustrator CC pueden requerir:
		      			- Microsoft Edge WebView2 (necesario para el panel de inicio de Adobe).
		      			- Paquetes de Visual C++ Redistributable.
		      		- Soluciones:
		      			- Instalar WebView2 manualmente (desde Microsoft).
		      			- Descargar los VC++ Redistributables (x64) desde Microsoft.
		      			- Usar el instalador offline de Creative Cloud (si el instalador online falla):
		      				- Descarga el instalador desde Adobe.
			      - B. Problemas con Servicios de Adobe
				      - Algunas funciones en la nube (como Adobe Fonts o Bibliotecas CC) pueden requerir ajustes en firewalls o políticas de red.	
			      - C. Alternativas si Creative Cloud no funciona
			      	- Illustrator CS6 (versión independiente, sin suscripción).
			      	- Illustrator Portable (no oficial, para usos básicos).

		      - 3. Recomendaciones para un Rendimiento Óptimo
		      	- Actualiza los drivers de tu GPU (especialmente si usas NVIDIA/AMD para renderizado GPU). 
		      	- Asigna más RAM a Illustrator (en Edición > Preferencias > Rendimiento).
		      	- Desactiva actualizaciones automáticas de Windows LTSC (para evitar conflictos con Creative Cloud).

    		  - Conclusión
			      - ✅ Adobe Illustrator funciona en Windows 10 LTSC, pero:
			      	- Si usas Illustrator CC (Creative Cloud), instala manualmente WebView2 y VC++.
			      	- Si prefieres evitar la nube, Illustrator CS6 es una opción estable.
			      	- Verifica que tu hardware cumpla los requisitos de Adobe.
