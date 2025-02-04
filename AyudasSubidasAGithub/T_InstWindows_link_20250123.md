- LAPTOP dv6-6180la + windows + 10 + drivers
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
	

- 20250123 [mark thinks: how to download and install SDI drivers (step by step)](https://www.youtube.com/watch?v=vc63owOUUoY)
	- Bajar utorrent: https://getintopc.com/softwares/utorrent-pro-2019-free-download/ o en su defecto qBittorrent
		- [COMO DESCARGAR Y UTILIZAR UTORRENT EN 2024 (COMPLETO) ⚙️ - DAN DROID](https://www.youtube.com/watch?v=8qTBzcBSFV4)
	- Bajar SDI Drivers
		- [mark thinks: how to download and install SDI drivers (step by step)](https://www.youtube.com/watch?v=vc63owOUUoY)
		- [Snappy Driver Installer](https://sdi-tool.org/download/)
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
		
		- Intel(R) HD Graphics 3000
		- AMD Radeon HD 6700M Series
	

- 20250123 [HP Support Assistant](https://support.hp.com/es-es/help/hp-support-assistant)
	- Baja programa,
		- Al 20250123: sp155262.exe (version 9.39.17.0)
			- Se instala en "c:\SWSetup\SP155262"
		- sp114036.exe NO SOPORTADO POR MI WINDOWS 10 EN HP PAVILION DV6
		- sp140482.exe SI SE INSTALO.
		

	- Soporte 
		- Hola @Dragora
			Tengo Windows Version 21H2 (Compilación SO 19044.1288), me he bajado el asistente de soporte "sp140482.exe" y he ido a la opción "Software y Controladores" donde me indica "su software y controladores están actualizados" pero si voy al administrador de dispositivos veo los siguientes problemas:
			Adaptadores de pantalla Adaptador de pantalla básico de Microsoft
				- Este dispositivo no funciona correctamente porque Windows no puede cargar los controladores requeridos para dicho dispositivo. (Código 31) El controlador que se está tratando de iniciar no es el mismo que el controlador del adaptador de pantalla de POST.

				Otros dispositivos
					Controladora simple de comunicaciones PCI
					Dispositivo desconocido
					Dispositivo desconocido
					Dispositivo PCI



				En donde para todos me despliega este mensaje: - No están instalados los controladores para este dispositivo. (Código 28) No hay controladores compatibles para este dispositivo. Para buscar un controlador para este dispositivo, haz clic en Actualizar controlador.
				Entonces no se cuál es y de donde debo bajar el controlador específico para el modelo de máquina y el sistema operativo. Estoy seguro que HP me puede dar la informaicón exacta basado en su conocimiento de sus equipos.
				Por ejemplo en la página de drivers que me dieron inicialmente en la sección Controladores gráficos, tengo estas tres opciones.
				
			- [DriverIdentifier](https://www.driveridentifier.com/scan/amd-radeontm-r5-graphics/download/217239484/025995CEDC77423DB95EF7E96D59486B/PCI%5CVEN_1002%26DEV_9851%26SUBSYS_80B1103C%26REV_45)	
				- NO FUNCIONÓ: Controlador de gráficos AMD High-Definition (Windows 10 v1703) (sp80617)
					- [DriverIdentifier](https://www.driveridentifier.com/scan/amd-radeontm-r5-graphics/download/217239484/025995CEDC77423DB95EF7E96D59486B/PCI%5CVEN_1002%26DEV_9851%26SUBSYS_80B1103C%26REV_45)
						- Se baja 
							- driveridentifier_setup.exe
						- Resultado 
							- Da una lista de drivers.
							- No sirvio de nada.
				- NO FUNCIONÓ: Controlador de gráficos AMD High-Definition (Windows 10 v1803) (sp88345)
					- C:\swsetup\SP88345 NO ES COMPATIBLE. Controlador de grficos AMD HighDefinition Windows 10 v1803 - sp88345.exe
				- NO FUNCIONÓ: Controlador de gráficos High-Definition AMD (sp79701)
					- c:\swsetup\SP79701 NO ES COMPATIBLE. Controlador de grficos HighDefinition AMD - sp79701.exe


AMD
	- https://www.amd.com/en/support
		- AUTODETECT
			- For use with systems running Windows® 11 / Windows® 10 64-bit version 1809 and later. Download and run directly onto the system you want to update.
			- amd-software-adrenalin-edition-22.5.2-minimalsetup-220530_web.exe
				- C:\AMD\AMD-Software-Adrenalin-Edition-22.5.2-MinimalSetup-220530_we
					- Bajado de
						- https://filehippo.com/download_amd-driver-autodetect/22.5.2/post_download/?dt=internalDownload
					- Instala en 
						- C:\AMD\AMD-Software-Adrenalin-Edition-22.5.2-MinimalSetup-220530_web
					- Resultado 
						- Sale la pantalla y trata de hacer algo (https://www.amd.com/en/resources/support-articles/faqs/gpu-kb182.html)
						- Error 182 – AMD Software Installer Detected AMD Graphics Hardware in Your System Configuration That Is Not Supported
							- Possible Cause
								- AMD Software Installer terminated the installation because the detected AMD Graphics hardware belongs to one of these unsupported product groups: 
									- Embedded AMD Radeon™ Graphics
									- Legacy AMD Radeon™ Graphics 
									- Customized AMD Radeon™ Graphics for original equipment manufacturer (OEM) systems 

1024MB ATI AMD Radeon HD 7400M Series (HP)
https://h30467.www3.hp.com/t5/Pantalla-y-v%C3%ADdeo-para-notebooks/Informaci%C3%B3n-Gr%C3%A1ficos-intercambiables-AMD/m-p/668103#M23457
	- This Content was Archived
	- al ejecutar: amd-software-adrenalin-edition-22.5.2-minimalsetup-220530_web.exe
		- Error 182: El instalador de AMD Software detectó un hardware de gráficos AMD en la configuración de tu sistema que no es compatible.
		- OBTENER MÁS INFORMACIÓN: https://www.amd.com/en/support/kb/faq/gpu-kb182

- 20250123 Ir a "AMD Drivers & Software page"
	- [Drivers and Support for Processors and Graphics](https://www.amd.com/en/support)
		- seleccionar Graphics/Legacy Graphics/Radeon 7xxx Series/ATI Radeon 7000 Series
			- Presionar submit que abre pantalla "Drivers and Software" y seleccionar el S.O.
				- Windows 2000
					- **NO FUNCIONÓ** Display Driver Revision Number 6.2
						- Display Driver Only
						- Se baja 
							- 6-2_xp-2k_dd_30152.exe
						- Resultado
							- Trata de instalar "ATI Software" pero no pudo x q no está en administrador.
							- 
					- **NO FUNCIONÓ** Catalyst Software Suite Revision Number 6.2
						- Driver Details
							- Display Driver
							- Catalyst Control Center
							- WDM Drivers
						- Se baja 
							- 6-2_xp-2k_dd_ccc_wdm_enu_30152.exe
						- Resultado 
							- Trata de instalar "ATI Software"
							- Mensaje: Warning Setup was unable to find components that can be installed on your current hardware or software configuration. Please make sure you have the required hardware or software.
se baja: "amd-amd-radeon-hd-7400m-series-outbyte-driver-updater.exe"

	- [AMD Radeon HD 7400M Series, la lista de controladores](https://devid.info/es/catalog/class39-vendor254-device430404--videocards-advanced-micro-devices-amd-radeon-hd-7400m-series)
		- AMD Radeon HD 7400M Series
			- Se baja 
				- outbyte-driver-updater.exe
			- Se Instala 
				- C:\Program Files (x86)\Outbyte\Driver Updater
				- Al ejecutarlo se pone a escanear los drivers y buscar actualizaciones
				- ¨Puse a actualizar el "Monitor Pnp Genérico"

	- [Driver Scape](https://www.driverscape.com/download/amd-radeon-hd-7400m-series)

- con https://www.drivereasy.com/
	descargar 
		AMD Radeon HD 6700M Series
	
	
- Generate and Save a List of Devices/Drivers (https://www.techspot.com/guides/1714-export-old-device-windows-drivers/)
	- msinfo32.exe
	- Ir a Compontnes
		- and this information can be saved to a text file by going to File > Export (no actual drivers are exported).
		
- Generate a list of drivers in the Command Prompt
	- 
	
- Snappy Driver El mejor buscador de Drivers (Controladores) para Windows
	- https://www.youtube.com/watch?v=cIlqUAsEleE
	
- [AMD Radeon HD 6700M Series. Win10 Update. Pantalla negra/black screen](https://community.amd.com/t5/pc-drivers-software/amd-radeon-hd-6700m-series-win10-update-pantalla-negra-black/m-p/206053)
	- Byron2016 PutoAmd2025! bgva2005@yahoo.com
	- 20250123 puse un comentario.
	
- [Disco Verde](E:\01_EnExtAntes_20241018\Respaldo20220531\AMD) 
	- E:\01_EnExtAntes_20241018\Respaldo20220531\AMD
		- **NO FUNCIONÓ** Radeon-Software-Adrenalin-2020-21.5.1-MinimalSetup-210505_web
			- Error 182: El instalador de AMD Software detectó un hardware de gráficos AMD en la configuración de tu sistema que no es compatible.
		
		- **NO FUNCIONÓ NO USAR PANTALLA NEGRA** AMD-Catalyst-15.7.1-Win10-64bit
			- E:\01_EnExtAntes_20241018\Respaldo20220531\AA_DataRecuperada\INSTALADORES_AMD
			- Instalar en 
				- C:\Program Files\AMD
			- Pantalla negra solución 
				- Entrar a opciones de windos / opciones de reinicio / modo seguro opciones de red
					- Una vez salga la pantalla azul 
						- Opciones avanzadas
						- Solucionar problemas
						- Opciones avanzadas
						- Configuración de inicio
						- Reiniciar 
						- Seleccionar Modo Seguro soporte a red. 
						
					- Reparación de inicio 
						- [cual es la contraseña que pide en la reparación de inicio, en el apartado de modo seguro](https://answers.microsoft.com/es-es/windows/forum/all/cual-es-la-contrase%C3%B1a-que-pide-en-la/8944fe60-6c27-4baa-aa23-2881c68da1f7)
							- 
		- **NO FUNCIONÓ?** Radeon-Software-Adrenalin-2019-19.9.2-MinimalSetup-190923_web
			- E:\01_EnExtAntes_20241018\Respaldo20220531\AA_DataRecuperada\INSTALADORES_AMD\Radeon-Software-Adrenalin-2019-19.9.2-MinimalSetup-190923_web
			- Aministrador de instalacion Catalyst - Version 08.00.0916
				- Controlador de pantalla AMD
				- AMD Catalyst Control Center 
				- AMD Gaming Evolved App 


- 20250123 Tema actualizaciones 
  - Actualizaciones de Calidad (6)
    - 2025-01 Actualización acumulatipa para .NET Framework 3.5, 4.8 y 4.8.1 para Windows 10 Version 22H2 para x64 (KB5050188) - Act ok en 23/1/2025
    - 2024-01 Actualización de Windos 10 Version 22H2 para x64 sistemas basados en (KB5033052) - Act ok en 23/1/2025
    - 2023-10 Actualización de Windos 10 Version 22H2 para x64 sistemas basados en x64 (KB4023057) - Act ok en 23/1/2025
    - 2024-10 Actualización de Windos 10 Version 22H2 para x64 sistemas basados en x64 (KB5001716) - Act ok en 23/1/2025
    - 2025-01 Actualización de Windos 10 Version 22H2 para x64 sistemas basados en x64 (KB5049981) - Act ok en 22/1/2025
    - 2024-05 Actualización de Windos 10 Version 22H2 para x64 sistemas basados en x64 (KB5001716) - Act ok en 22/1/2025
  - Actualizaciones de controladores (1)
    - Inter Corporation driver update for Intel(R) Wireless Bluetooth(R) - Act ok en 22/1/2025 
  - Actualizaciones de definiciones (1)
    - Actualización de inteligencia de seguridad para Microsoft Defender Antivirus - KB2267602 (versión 1.421.1461.0) - Canal actual (ampliado) - Act ok en 20/1/2025 
  - Otras actualizaciones (2)
    - Herramienta de eliminación de software malintencionado de Windows x64 v5.131 (KB890830) - Act ok en 23/1/2025
    - Microsoft .NET Framework 4.8.1 para Windows 10 Version 22H2 de x64 (KB5011048) - Act ok en 22/1/2025


    - 2025-01 Actualización acumulatipa para .NET Framework 3.5, 4.8 y 4.8.1 para Windows 10 Version 22H2 para x64 (KB5049981) - Act ok en 23/1/2025 