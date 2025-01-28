- Configurar Visual Studio 2022
	- Para que al crear la variable con "Create and assign field 'log'" me salga _NombreVariable.
		- .NET Core Console App with Dependency Injection, Logging, and Settings
			- https://www.youtube.com/watch?v=GAOCe-2nXqc
			- MINUTO: 33:57
			- Tools/Options/Text Editor/C#/Code Style/Naming
				- Presionar el +
				- Primer campo: Private or internal Field
				- Segundo campo	
					- Manage naming styles
						- Presionar +
						- Naming Style Title: Underscore
						- Required Prefix: _ 
						- Capitalizacion: camel Case Name
					- Seleccionar 	Underscore
				- Tercer campo: Refactoring Only

    - Elementos instalados

	    - Visual Studio Build Tools 2022
	    	- Paquetes de Idioma
	    		- English
	    		- Español
	    - Visual Studio Community 2022
	    	- Desarrollo de ASP.NET y web
	    	- Desarrollo de Nodejs
	    	- Desarrollo de la interfa de usuario de aplicaciones 
	    	- Desarrollo de escritorio .NET
	    	- Desarrollo para el escritorio con C++
	    	- Desarrollo de aplicaciones de Windows 
	    	- Almacenamiento y procesamiento de datos 
				
- No se puede ver ASP.NET web application (.NET Framework)
	- Ir al instalador y en componentes individuales agregar templates de .NET Framework
	
- Visual Studio Bloqueado archivo
	- Windows: Cómo saber que proceso tiene abierto un archivo o carpeta
		- https://www.youtube.com/watch?v=ocoHay1gDNQ
			- Método uno
			- Administrador de tareas
			- Rendimiento
			- Abrir el Monitor de recursos
				- Ir a CPU
				- Buscar el archivo q está bloqueado
				
			- Método Dos
				- https://www.sysadmit.com/2013/11/sysinternals-descarga-individual-de.html
				- http://live.sysinternals.com/
				- bajar: procexp64.exe
			
			- Método Tres
				- En misma ruta anterior
				- bajar: handle64.exe
		 
		
	- Visual Studio Bloqueado archivo
		- https://www.mejorcodigo.com/p/7283.html
			- taskkill /F /IM VBCSCompiler.exe
			
- Visual Studio ver "Test Explorer "
	- choose Test on the Visual Studio menu, choose Windows, and then choose Test Explorer
	
- Visual Studio cambiar idioma (https://www.jasoft.org/Blog/post/como-cambiar-el-idioma-de-la-interfaz-de-visual-studio)
	- Ir a Visual Studio Installer
	- Modificar
	- Paquetes de idioma y seleccionar el idioma
	- Abrir Visual Studio y verificar si la interfaz aparece en el idioma que te interesa. 
		- En caso de que no sea así, todavía te queda un paso por dar. 
		  Debes ir al menú de Herramientas>Opciones y dentro del apartado 
		  Ajustes internacionales elegir el idioma de tu preferencia: