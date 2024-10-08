- D:\dev_20220602\00_Documentacion\T_Node_001.txt

- Node

  - Import dinámico
    - https://stackoverflow.com/questions/58858782/using-the-dynamic-import-function-on-node-js
  - Menu

    - https://stackoverflow.com/questions/32458427/multiple-menus-with-node-js

  - Desarrollo Útil: Curso de Node js desde 0

    - https://www.youtube.com/watch?v=e8n_9N-ZyFE&list=PL3aEngjGbYhnrRfZKMxzn79qdgPxL7OWM&index=2

      - QUÉ es Node JS? 🟢 CÓMO funciona? 😎 Curso de Node.JS desde cero #1
      - GLOBAL vs WINDOW 🌎 Objetos globales en Node JS 🟢 Curso de Node.JS desde cero #2
      - REQUIRE vs IMPORT ⚡ COMMON JS vs ES MODULES 🤔 CJS vs ESM 🟢 Curso de Node.JS desde cero #3
      - CÓMO crear un SERVIDOR en Node.JS 🌐 Principios de HTTP 🟢 Curso de Node.JS desde cero #4
      - Entendiendo una REQUEST HTTP en Node JS 🌐 GET? POST? HEADERS? BODY?🟢 Curso de Node.JS desde cero #5
      - POR QUÉ usar EXPRESS en NODE JS 🤔 EXPRESS vs HTTP module🟢 Curso de Node.JS desde cero #6
      -
      -
      -
      -
      -
      -
      -

    - Entendiendo versionado (Current, Active, Maintenance )
      - https://nodejs.org/en/about/previous-releases
        - Las principales versiones (Major) de Node.js ingresan al estado de lanzamiento actual (Current release status) durante seis meses,
          - lo que les da tiempo a los autores de bibliotecas para agregarles soporte.
        - Después de seis meses,
          - las versiones impares (9, 11, etc.) dejan de recibir soporte (unsupported) y
          - las versiones pares (10, 12, etc.) pasan al estado de LTS activa (Active LTS status) y están listas para su uso general.
        - El estado de lanzamiento LTS es "soporte a largo plazo", que generalmente garantiza que los errores críticos se solucionarán durante un total de 30 meses. Las aplicaciones de producción solo deben utilizar versiones LTS activas (Active LTS releases) o LTS de mantenimiento (Maintenance LTS releases).

  - Errores

    - "NODE_ENV" no se reconoce como un comando interno o externo, programa o archivo por lotes ejecutable.

      - Windows development: Fixing the "NODE_ENV is not recognized..." error

        - https://www.youtube.com/watch?v=t9okUDkRUDc

          - PowerShell
            - a
              - NOK
                - "dev": "NODE_ENV=development node index.js",
              - OK
                - "devset": "set NODE_ENV=development && node index.js",
            - b
              - OK
                - "devall": "cross-env NODE_ENV=development node index.js",
          - Bash
            - a
              - NOK
                - "dev": "NODE_ENV=development node index.js",
              - OK
                - "devset": "set NODE_ENV=development && node index.js",
            - b
              - OK
                - "devall": "cross-env NODE_ENV=development node index.js",
          - cmd
            - a
              - NOK
                - "dev": "NODE_ENV=development node index.js",
              - OK
                - "devset": "set NODE_ENV=development && node index.js",
            - b
              - OK
                - "devall": "cross-env NODE_ENV=development node index.js",

  - Manejar múltiples versiones

    - How to work with multiple NodeJS versions using fnm?

      - https://thetldr.tech/how-to-work-with-multiple-nodejs-versions-using-fnm/

    - nvm-windows

      - https://github.com/coreybutler/nvm-windows

        - Instalador:

          - https://github.com/coreybutler/nvm-windows/releases
            - Despliega las versiones existentes, seleccionar la última
              - https://github.com/coreybutler/nvm-windows/releases/tag/1.1.11
                - Notar que al final está el release que se usará.
                - Ir a la sección ASSETS y seleccionar la adecuada para el sistema operativo
                  - OJO NO INSTALAR LA VERSION 1.1.12 DA PROBLEMAS CON GIT BASH.
                    - Ver en la página de github, bajo RELEASES hay link +19 Releases, seleccionar esta.
                    - En la sección de la versión hay un bottón Assets
                    - nvm-setup.exe
                      - C:\Users\bgva\AppData\Roaming\nvm
                      - No ponerlo en "C:\Program Files\nodejs"
                        - C:\Users\bgva\nvm
                        -
                    -
                  - Bajar para windows: nvm-setup.zip
                  - descomprimir el archivo y proceder a realizar la instalación.

        - ERROR: NVM for Windows should be run from a terminal such as CMD or PowerShell

          - Installing NVM on Windows for Git Bash

            - https://www.youtube.com/watch?v=1qbQkZihtCY

              - La versión 1.1.12 NO ES UNA BUENA VERSIÓN para instalar en windows y usar gitbash. En su lugar se instalará la versión 1.1.11

              - Desinstalar la V1.1.12

                - Ir a agregar o quitar programa
                - Buscar nvm for windows v1.1.12
                -

              - nvm version
              - INSTALL
                - Windows
                  - nvm install lts
                - Ubuntu
                  - nvm install --lts
              - nvm list
              - Ver cual es la q actualmente tenemos seteada
                - nvm current
              - nvm use 16.15.1
              - nvm uninstall 16.15.1

            - ## nvm-update.zip

        - Uninstall
          - Have a look at the installation path - C:\Users\[username]\AppData\Roaming\nvm is the default path. In this folder you'll find unins000.exe. Double-click it and agree to removing NVM and all Node-versions in the following steps.

        npm config list
        ; node bin location = C:\Program Files\nodejs\node.exe
        ; node version = v18.16.0
        ; npm local prefix = D:\dev_20220602\Colaboraciones\mdn\content
        ; npm version = 9.5.1
        ; cwd = D:\dev_20220602\Colaboraciones\mdn\content
        ; HOME = C:\Users\bgva
        ; Run `npm config ls -l` to show all defaults.

        - ERROR: npm WARN config global `--global`, `--local` are deprecated. Use `--location=global` instead

          - https://stackoverflow.com/questions/72401421/npm-warn-config-global-global-local-are-deprecated-use-location-glo
            - Upgrading npm on Windows doesn't work with npm itself like on Linux. You have to use npm-windows-upgrade to update the wrapper script npm.cmd at the right location
              - https://www.npmjs.com/package/npm-windows-upgrade
                - run PowerShell as Administrator
                - Ejecutar: Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
                  - Asegurar que puede ejecutar scripts en su sistema
                - Ejecutar: npm install --global --production npm-windows-upgrade
                  - Este instala la herramienta.
                - npm-windows-upgrade
                - npm-windows-upgrade --npm-version latest

        - Error: Cannot find module 'C:\Program Files\nodejs\node_modules\npm-windows-upgrade\bin\npm-windows-upgrade.js'

    - fnm: Alternativa a nvm --> FNM (Fast Node Manager) - https://www.freecodecamp.org/news/fnm-fast-node-manager/ --> muy buena explicaciones.

      - Instalación

        - https://github.com/Schniz/fnm

          - Windows

            - Using Winget (Windows)
              - winget install Schniz.fnm
            - versión
              - fnm --version
            - Configurar el Shell (https://github.com/Schniz/fnm#shell-setup)

              - Versión de node a ser usada.
                - Crear en el proyecto un archivo ".node-version" y colocar la versión en él.
                  - node --version > .node-version
              - Bash
                - PENDIENTE
              - git-bash

                - Revisar AydaGit_20230130.txt sección "Trabajar con .bashrc" para ver como se agrega el archivo .bashrc
                - Agregar al final de .bashrc
                  - eval "$(fnm env --use-on-cd)"

              - PowerShell
                - Profile
                  - To locate your PowerShell profile, you can simply access the $profile variable within PowerShell. On Windows, profiles are located in “$Home\Documents\WindowsPowerShell\Microsoft.
                  - notepad $PROFILE
                  - OJO: $PROFILE --> C:\Users\bgva\OneDrive\Documentos\PowerShell\Microsoft.PowerShell_profile.ps1
                - Add the following to the end of your profile file:
                  - fnm env --use-on-cd | Out-String | Invoke-Expression

            - Instalar versión de node

              - fnm use --install-if-missing 20
              - node -v
              - npm -v

                        - Comandos
                            - Ver instalados
                                - fnm list

      - Desinstalación

        - Just delete the .fnm folder in your home directory.
        - You should also edit your shell configuration to remove any references to fnm (ie. read Shell Setup, and do the opposite).
          - (https://github.com/Schniz/fnm#shell-setup)

      - Instalar Rust

        - https://www.rust-lang.org/es/learn/get-started

          - Descargar RUSTUP-INIT.EXE (64 BITS)
          - Instalar Microsoft C++ build toos for Visual Studio 2013+

            - https://visualstudio.microsoft.com/visual-cpp-build-tools/

            - con winget

              - How to install Microsoft Visual C++ Build Tools, the fast way
                - https://www.youtube.com/watch?v=x6OBMfLTLhA
              - winget install Microsoft.VisualStuido.2022.BuildTools --force --override "--passive --wait --add Microsoft.VisualStuido.Workload.VCTools;includeRecommended"

              - rem https://learn.microsoft.com/en-us/visualstudio/install/workload-component-id-vs-build-tools?view=vs-2022

  - Developing Console Applications with Node.js in TypeScript
    - https://dev.to/josunlp/developing-console-applications-with-nodejs-in-typescript-343i
      - Comandos en aplicación de consola
      - Barras de progreso
      - Comandos y banderas
      - Actualizaciones en tiempo real
      - Manejo de errores
      - Implementar una barra de progreso de seguiminto.

- To get started you may need to restart your current shell.
  This would reload its PATH environment variable to include
  Cargo's bin directory (%USERPROFILE%\.cargo\bin).

  - Instalation

    - Varias versiones de Node FNM en Windows

      - https://www.youtube.com/watch?v=bYbxZRMo4Vs

        - [winget](https://github.com/Schniz/fnm?tab=readme-ov-file#using-winget-windows)

          - winget install Schniz.fnm
          - configuración variables de entorno.
            - Imprimir variable de entorno **$profile**
              - En el PS poner: $profile + enter
                - OJO: Tanto para la _PS toda azul_ como para la _PS negra_, las dos carpetas **WindowsPowerShell** y **PoserShell** están en **documentos** y existe un archivo **Microsoft.PowerShell_profile.ps1** en cada carpeta
                - Para la PS toda azul
                  - C:\Users\bgva\OneDrive\Documentos\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
                - Para la PS
                  - f
                - Agregar según corresponda con el nombre del archivo la siguiente línea:
                  - <code>fnm env --use-on-cd | Out-String | Invoke-Expression</code>
                  - fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
          - instalar.
            - fnm install lts-latest

        - https://github.com/Schniz/fnm

          - choco install fnm
          - Default instalation:
            - $HOME/.local/share/fnm on linux and $HOME/Library/Application Support/fnm on MacOS).
          - MIDUDEV 13.0: https://www.youtube.com/watch?v=yB4n_K7dZV8&t=13s

          - fnm --version
          - fnm
          - fnm list - fnm ls-remote
          - fnm install x.x.x (20.13.1) - fnm install lts-latest <-----
          - fnm use x.x.x
          - Usar versión x.x.x x defecto
            - fnm alias x.x.x. default <-----
          - Editar variables de entorno del sistema
          - Variables de entorno

    - MIDUDEV CURSO

      - CURSO DE NODE.JS DESDE CERO: Introducción y primeros pasos

        - https://www.youtube.com/watch?v=yB4n_K7dZV8

        - 0:00 ¿Qué haremos?
        - 0:24 Objetivo y Comunidad Para apoyo
        - 1:51 Qué es Node.JS y V8
        - 4:18 Orientado a Eventos
        - 5:27 ¿Por qué aprender Node.js? 6 Razones
        - 9:44 Historia
        - 10:54 Requisitos Para este curso
        - 11:57 2 Formas de Instalar Node.JS
        - 19:05 Tus Primeros pasos con NODE JS
        - 21:27 Hola mundo y ejecutar ficheros 🌏
        - 23:15 Variables Globales
        - 25:30 Window VS GlobalThis
        - 26:45 El Console.log
        - 28:19 Patrón de Diseño Módulo
        - 29:54 Sistema de Módulos CommonJS
        - 32:30 Sistema de Módulos ES Modules
        - 35:31 Modulos Nativos
        - 41:02 Pasar de import a require
        - 42:33 Extension de archivos
        - 40:27 File System
        - 45:31 Asíncrono vs Síncrono
        - 51:11 CallBacks en NodeJS
        - 54:54 con Promesas
        - 56:25 Transformar CallBacks a Promesas
        - 58:28 con Async Await
        - 1:03:49 En paralelo
        - 1:05:26 Versión síncrona
        - 1:05:17 Explicación
        - 1:15:41 Path
        - 1:17:33 Unir Rutas
        - 1:18:19 Nombre de un Archivo
        - 1:18:57 Obtener la Extensión
        - 1:19:43 Primer aplicación
        - 1:21:36 Preguntas de los radio escuchas
        - 1:22:45 Objeto Global process
        - 1:25:20 CWD
        - 1:26:41 Platform
        - 1:27:39 Comando ls avanzado
        - 1:30:01 Mejorando la App | Listar archivos/directorios
        - 1:36:18 El resultado de nuestra App
        - 1:38:37 Preguntas de los radio escuchas
        - 1:42:18 NPM
        - 1:45:00 Proyecto e Instalar Dependencias
        - 1:47:29 Package.json
        - 1:48:10 Instalar PicoColors
        - 1:50:00 Semantic Version
        - 1:51:00 node_modules
        - 1:53:18 Desinstalar dependencias
        - 1:53:55 Usando PicoColors
        - 1:55:52 Dependencias de Desarrollo y Producción + Eslint
        - 2:00:34 Tu primer servidor con Node.js
        - 2:03:36 Hack para evitar colisionar puertos
        - 2:07:00 Segunda Aplicación
        - 2:13:57 Variables de entorno
        - 2:15:11 .env?

        - Versiones

          - Pares
            - LTS

        - Instalación (ver más arriba)

          - nvm
            - nvm-windos
          - fnm
            - requiere RUST

        - node
          - REPL : Read Eval Print Loop
        - En node no tenemos windows esto dará error:
          - console.log(window)
        - Si tenemos console.log(typeof window)
          - undefined
        - Para resolverlo tenemos "globalThis" que es comun para navegador, consola. 26.02

              			(es una variale global en toda nuestra aplicación.)
              		        	glogalThis
              		      	    |  |
              	      nodejs  |  | navegador
              		            |  |
                  global<------  ----> window

          - console.log(globalThis)

          - Explicación

            - En navegador globalThis apunta a window
            - En node globalThis apunta a global

          - Lo correcto para referirse a variable global SIEMPRE USAR "globalThis"

          - (26.0)
            - para no hacer:
              - console.log(typeof window === 'undefined' && global)

        - console

          - console sale de "globalThis.console.log(globalThis)"

        - Patron de diseño módulo (29.15)

          - Separar nuestro código en diferentes ficheros.

          - CommonJS: Forma clásica antigua aún no deprecada.

            - Usa extensión ".js" (por defecto utiliza commonJS)
            - Forzar uso de commonJS
              - Usa extensión ".cjs"
            - NO NOMBRADO

              - crear archivo suma.js
                function sum(a,b){
                return a + b
                }

                module.exports = sum

              - importar en archivo index.js
                const sum = require('./suma')

            - NOMBRADO

              - crear archivo suma.js
                function sum(a,b){
                return a + b
                }

                module.exports = {sum}

              - importar en archivo index.js //OJO la extensión es obligatoria (43.00).
                const { sum } = require('./suma')

          - ES Modules: Forma MODERNA .

            - Usa extensión ".mjs"
            - NO NOMBRADO

              - crear archivo suma.mjs
                function sum(a,b){
                return a + b
                }

                export default sum

              - importar en archivo index.mjs
                import sum from './suma.mjs'
                console.log(sum(1,2))

            - NOMBRADO

              - crear archivo suma.mjs
                export function sum(a,b){
                return a + b
                }

              - importar en archivo index.mjs
                import { sum } from './suma.mjs'
                console.log(sum(1,2))

        - Módulos NATIVOS de node

          - const os = require('node:os')

            console.log("Información del sistema operativo:")
            console.log("\***\*\*\*\*\***\_\***\*\*\*\*\***")

            console.log("Nombre del sistema opertivo:", os.platform())
            console.log("Versión del sistema opertivo:", os.release())
            console.log("Arquitectura:", os.arch())
            console.log("CPUs:", os.cpus())
            console.log("Memoria libre:", os.freemen() / 1024 / 1024)
            console.log("Memoria total:", os.totalmem() / 1024 / 1024)
            console.log("Uptime (días encendido):", os.uptime()/60/60)

          - file sistem (44.05)

            - const fs = require('node:fs')

            - //Síncrono BLOQUEA el proceso
            - //Asíncrono UTILIZA ARQUITECTURA DE EVENTOS.

              // Síncrono
              const stats = fs.statSync("./archivo.txt")
              console.log(
              stats.isFile(),
              stats.isDirecotory(),
              stats.isSymbolicLink(),
              stats.size
              )

              //Sincrónito
              console.log("leyendo el primer archovo...")
              const text = fs.readFileSync("./archivo.txt", 'utf-8)
              console.log(text)

              console.log("Hacer cosas mientras lee el archivo")

              console.log("leyendo el segundo archovo...")
              const secondtext = fs.readFileSync("./archivo2.txt", 'utf-8)
              console.log(secondtext)

          - CallBacks
            //Cambiarlo a asíncrono:
            console.log("leyendo el primer archovo...")
            fs.readFile("./archivo.txt", 'utf-8', (err, text) => {
            console.log(text)
            })

            console.log("Hacer cosas mientras lee el archivo")

            console.log("leyendo el segundo archovo...")
            fs.readFile("./archivo2.txt", 'utf-8', (err, text) => {
            console.log(text)
            })

          - Promesas(55.00)

            - const fs = require('node:fs/promises')

              console.log("leyendo el primer archivo...")

              fs.readFile("./archivo.txt", 'utf-8')
              .then(text => {
              console.log('primer texto', text)
              })

              console.log("--->Hacer cosas mientras lee el archivo")

              console.log("leyendo el segundo archovo...")

              fs.readFile("./archivo2.txt", 'utf-8')
              .then(text => {
              console.log('segundo texto', text)
              })

          - Utilidad que da node (57.00)

            - const fs = require('node:fs')
              const { promisify} = require('node:util')

              // crear la versión de promesas de una que no lo sea
              // es decir en los modos nativos que no tienen promesas nativas.

              const readFilePromise = promisify(fs.readFile)

              console.log("leyendo el primer archivo...")

              fs.readFilePromise("./archivo.txt", 'utf-8')
              .then(text => {
              console.log('primer texto', text)
              })

              console.log("--->Hacer cosas mientras lee el archivo")

              console.log("leyendo el segundo archovo...")

              fs.readFilePromise("./archivo2.txt", 'utf-8')
              .then(text => {
              console.log('segundo texto', text)
              })

          - Await

            - Esto no funciona en commondJS:
            - const fs = require('node:fs/promises')

              console.log("leyendo el primer archivo...")

              const text = await fs.readFile("./archivo.txt")
              console.log('primer texto', text)

              console.log("--->Hacer cosas mientras lee el archivo")

              console.log("leyendo el segundo archovo...")

              const secondText = await fs.readFile("./archivo2.txt")
              console.log('segundo texto', secondText)

              - CommonJS el sistema módulo clásico no tiene acceso hay que envolverlo.

              - Opción 1 59.43 Cambiarlo a módulos.
              - .mjs
              - requiere cambiar a módulo: import
              - lo anterior ya funcionaría.
              - esto pasa x que ESModule tiene el soporte para utilizar await en el cuerpo del archivo. eso se llama "Top Level await"

              - Opción 2. 1.00.21 Función autoinvocada.
              - const {readFile} = require('node:fs/promises')

                //IIFE - Inmediatly Invoked Function Expression.
                //OJO: el punto y como es necesario.
                ;(
                async() => {
                console.log("leyendo el primer archivo...")

                    	const text = await readFile("./archivo.txt")
                    	console.log('primer texto', text)

                    	console.log("--->Hacer cosas mientras lee el archivo")

                    	console.log("leyendo el segundo archovo...")

                    	const secondText = await readFile("./archivo2.txt")
                    	console.log('segundo texto', secondText)

                }
                )()

                - Entendiendo la autoinvocada.

                  - async fnction init(){...lo qu esta dentro.}

                    init()

                    // solo que se lo ha hecho de una vez.

            - Asynctrono PARALELO. 1.04.02

              - import {readFile} from 'node:fs/promises'
                Promise.all ([
                readFile("./archivo.txt", 'utf-8'),
                readFile("./archivo2.txt", 'utf-8')
                ]).then(([text, secondtext]) => {
                console.log('primer texto', text)
                console.log('segundo texto', secondtext)
                })

              //cuando termines de leer los dos archivos entonces continúas.

          - 1.05.24 Grafico
            o: ocupado
            d: desocupado.

            - Versión Síncrona
              proceso
              o - ReadFileSinc
              o - ReadFileSinc
              d
              d

            - Asícrono callBack
              proceso
              o - ReadFileSinc
              d
              o - ReadFileSinc
              d
              d
              d
              d
              o - callBack resuelta 2
              o - callBack resuelta 1

            - Asícrono secuencia
              proceso
              o - ReadFileSinc
              d
              o - promesa resuelta 1
              d
              d
              d
              d
              o - ReadFileSinc
              d
              d
              o - promesa resuelta 2

            - Asíncrono Paralelo.
              proceso
              o - ReadFileSinc y - ReadFileSinc
              d
              d
              d
              d
              o - TODO RESUELTO callBack o promesa resuelta

    - Variables de entorno (env / .env)

      - midulive: https://www.youtube.com/watch?v=J8E-6QqZfgI

        - API_KEY="1234"
        - Antes
          - require('dotenv').config();
          - Invocación
            - node index.js
        - ahora

          - console.lgo(process.env.API_KEY)

          - Invocación
            - node --env-file=.env index.js

        - Ahora mejor con V. 21.7.1

          - process.loadEnvFile() //si no se le pasa nada, leeerá el .env por defecto.
          - console.lgo(process.env.API_KEY)
          - Invocación

            - node index.js

          - if(process.env.NODE_ENV !== 'production') {
            process.loadEnvFile("./env.dev")
            } else {
            process.loadEnvFile()
            }

          - const envFile = process.env.NODE_ENV !== 'production'
            ? "./env.dev"
            : undefine

            process.loadEnvFile(envFile)

    - Colores para la consola

      - Antes se hacía con chalk
      - Ahora V.21.7.1
        - const { styleText } = require("node:util")
          console.log(styleText('red', '---- api keys ----'))

    - ## Yari problens

          - inst
          	- git clone https://github.com/Byron2016/yari.git --depth=1
          	- git clone https://github.com/Byron2016/translated-content.git --depth=1
          	- git clone https://github.com/Byron2016/content.git --depth=1

          - ejec
          	- content
          		- http://localhost:5042/
          	- translated-content
          		-
          - cd C:\Users\bgva\AppData\Local\npm-cache\_logs
          	- Borrar logs.
          		- cd ~/AppData/Local/npm-cache/_logs
          		- ls -al && rm *.log* && ls -al
          - cd ~/AppData/Local/Yarn
          	- rm -rf bin/
          	- rm -rf Cache/
          - Borrar node_modules de Yari
          	- find . -name 'node_modules' -type d -prune
          	- find . -name node_modules -type d -prune -exec trash {} +
          	- find . -name 'node_modules' -type d -prune

          	- cd /d/dev_20220602/Colaboraciones/mdn/yari && find . -name 'node_modules' -type d -prune && find . -name node_modules -type d -prune -exec trash {} +
          	-

          - Si se cambia de versión de npm
          	- npm cache clean --force
          	- Instalaciones globales
          		- npm ls -g
          			- trash-cli
          				- npm install --global trash-cli
          			- yarn
          				- npm install --global yarn
          			- server
          				- npm install --global server
          			- serve
          				- npm install --global serve

          				-

          - Cambiar el prefix
          	- npm config ls -l
          		- DE
          			- prefix = "C:\\Program Files\\nodejs"
          		- A
          			- prefix = "C:\\Users\\bgva\\AppData\\Roaming\\nvm\\v18.16.0"

          		- Puede tomar valores de: (https://docs.npmjs.com/cli/v10/configuring-npm/npmrc)
          			- per-project config file (/path/to/my/project/.npmrc)
          			- per-user config file (~/.npmrc)
          			- global config file ($PREFIX/etc/npmrc)
          			- npm builtin config file (/path/to/npm/npmrc)

          - ERROR: error code EPERM
          	- Parece es por permisos.
          		- https://betterstack.com/community/guides/scaling-nodejs/nodejs-errors/

          - OTROS

          	"install:all": "find . -mindepth 2 -name 'yarn.lock' ! -wholename '**/node_modules/**' -print0 | xargs -n1 -0 sh -cx 'yarn --cwd $(dirname $0) install'",

          	"install:all:npm": "find . -mindepth 2 -name 'package-lock.json' ! -wholename '**/node_modules/**' -print0 | xargs -n1 -0 sh -cx 'npm --prefix $(dirname $0) install'",

          	find . -mindepth 2 -name 'yarn.lock' ! -wholename '**/node_modules/**' -print0
          	find . -mindepth 2 -name 'yarn.lock' ! -wholename '**/node_modules/**' -print0 | xargs -n1 -0
          		- -n1 tells xargs to run the given command once per argument.
          		- As for the -0 flag in xargs, that's an alias to the --null option which tells xargs to identify separate arguments by looking for a binary zero (\0) null character between them instead of the default whitespace between them. You need it after find because find is set to use binary zero separators (\0) via the -print0 option, and grep then needs the -z argument to do the same thing.

          	find . -mindepth 2 -name 'package-lock.json' ! -wholename '**/node_modules/**' -print0 | xargs -n1 -0 sh -cx 'echo $(dirname $0)'
          		- sh c
          			- ejecutar comando
          		- sh -cx
          			- va indicando paso a paso lo que va haciendo.


          	- cd /d/dev_20220602/Colaboraciones/mdn/yari/cloud-function && npm i
          	- cd

          	"dev": "yarn build:prepare && nf -j Procfile.dev start",
          	"build:prepare": "yarn build:client && yarn build:ssr && yarn tool optimize-client-build && yarn tool google-analytics-code && yarn tool popularities && yarn tool spas && yarn tool gather-git-history && yarn tool build-robots-txt",
          	"build:client": "cd client && cross-env NODE_ENV=production BABEL_ENV=production INLINE_RUNTIME_CHUNK=false node scripts/build.js",

          	"build": "cross-env NODE_ENV=production NODE_OPTIONS='--no-warnings=ExperimentalWarning --loader ts-node/esm' node build/cli.ts",

          	me quedé en:
          	https://raw.githubusercontent.com/mdn/content/main/files/en-us/web/javascript/inheritance_and_the_prototype_chain/index.md


          	http://localhost:3000/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain

          	https://developer.mozilla.org/es/docs/Web/JavaScript/Inheritance_and_the_prototype_chain

          	- MDN Web Docs contribution guide
          		- https://github.com/mdn/translated-content/blob/main/CONTRIBUTING.md#link-translated-content
          	- Translation guidelines for MDN translated content
          	- Translation guidelines for MDN translated content
          		- https://github.com/mdn/translated-content/blob/main/docs/README.md
          			- title - A long title for the page; to localize
          			- short-title - A short title for the page which appears in sidebars; also to localize
          			- slug - needs to match the original page's slug
          			- l10n.sourceCommit - The commit hash of the upstream commit the translation is synchronized with


          	find . -mindepth 2 -name 'package-lock.json' ! -wholename '**/node_modules/**' -print0 | xargs -n1 -0
          	find . -mindepth 2 -type f ! -wholename '**/node_modules/**' -print0 | xargs -n1 -0

          	Buscar en gitbash
          	grep --color=always -r "Andrade" /c/AA_DataRecuperada
          	grep --color=always -r --include="*.txt" "023_" /c/dev/ (https://www.cyberciti.biz/faq/unix-linux-grep-include-file-pattern-recursive-example/)

          		- F3 usando xargs (ejecutar comandos sobre el output de otro comando)
          			- find . -type f | xargs cat
          			- find . -type d -name "node_modules"
          			- find . -type f -name "*ignore"


          	find . -mindepth 2 -type f ! -wholename '**/node_modules/**' ! -wholename '**/.git/**' ! -wholename '**/.github/**' -print0 | xargs -n1 -0
          	find . -type f -name "*_peaks.bed" ! -path "**/node_modules/**" ! -path "./scripts/*"


          	l10n:
          	sourceCommit: 41cddfdaeed4a73fb8234c332150df8e54df31e9

          	l10n:
          	sourceCommit: 40d43c37f966d713bfdacbb90854ccacc354d60f

          	azucar tintáctico syntax sugar
          	array methods métodos de array
          	monkey patching
          	runtime runtime
          	a.k.a. también conocido como


          	@lamabe_05

- node tips
  - http
    - https://stackoverflow.com/questions/57717492/what-is-the-use-case-of-options-argument-added-to-http-createserver-method
    - https://stackoverflow.com/questions/33855337/trying-to-send-header-in-node
    - https://stackoverflow.com/questions/26337177/extend-nodejs-request-object
