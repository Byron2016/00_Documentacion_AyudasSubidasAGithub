- Nodejs Debug

  - fnm: Support FNM Node Version Manager in Node configuration provider

    - https://github.com/microsoft/vscode-js-debug/issues/847

    - Hacer debug - json

      - Referencia

        - [Support FNM Node Version Manager in Node configuration provider](https://github.com/microsoft/vscode-js-debug/issues/847)
        - [Debug a nodejs program. (using fnm) #230759](https://github.com/microsoft/vscode/issues/230759)

      - launch.json file

        ```json
        {
          // Use IntelliSense to learn about possible attributes.
          // Hover to view descriptions of existing attributes.
          // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
          // fnm.exe exec --using default -- node ./src/index.js
          "version": "0.2.0",
          "configurations": [
            {
              "type": "node",
              "request": "launch",
              "name": "Launch Program (with FNM)",
              "skipFiles": ["<node_internals>/**"],
              "console": "integratedTerminal",
              "internalConsoleOptions": "neverOpen",
              "program": "${workspaceFolder}/src/index.js",
              "runtimeExecutable": "fnm",
              "runtimeVersion": "default",
              "runtimeArgs": ["exec", "--using", "20", "--", "node"],
              "windows": {
                "runtimeExecutable": "fnm",
                "runtimeArgs": ["exec", "--using", "20", "--", "node"]
              },
              "restart": true
            }
          ]
        }
        ```

  - Fazt Code: Nodejs Visual Studio Code Debugger para Iniciantes

    - https://www.youtube.com/watch?v=4Z8CM-E-HRE

      - Ir en VSC (Visual Studio Code / VisualStudioCode) a "Run and Debug (Crtl + Shift + D)"
      - Seleccionar "create a launch.json file"

        - seleleccionar el "Select debugger" para este caso "Node.js"

          - Esto creará un "launch.json" en "./.vscode"

            ```json
            {
              // Use IntelliSense to learn about possible attributes.
              // Hover to view descriptions of existing attributes.
              // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
              "version": "0.2.0",
              "configurations": [
                {
                  "type": "node",
                  "request": "launch",
                  "name": "Launch Program",
                  "skipFiles": ["<node_internals>/**"],
                  "program": "${workspaceFolder}\\callbacks_vs_promesas\\index.js"
                }
              ]
            }
            ```

          - Tomar en cuenta la línea en la que se indica en que programa iniciará "index.js"
            - "${workspaceFolder}\\callbacks_vs_promesas\\index.js"

      - Ejecutar el debug
        - ERROR: Can´t find Node.js binary "node": path does not exist. Make sure Node.js is installed and in your PATH, or set the "runtimeExecutable" in your launch.json
          - Abrir VSC en el directorio del proyecto
          - Crear el "launch.json" en este directorio
          - Ejecutar.

  - Para TypeScript

    - Crear los .map.

      - Agregar en "tsconfig.json"
        - "sourceMap": true

    - Generar el "launch.json"

      - Agregar estas entradas:

        ```json
          {
            // ....
            "configurations": [
              {
                // ....
                "preLaunchTask": "npm: debug_build",,
                "outFiles": ["${workspaceFolder}/**/*.js"]
              }
            ]
          }
        ```

    - Ejemplo general:

      ```json
      {
        "version": "0.2.0",
        "configurations": [
          {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "skipFiles": ["<node_internals>/**"],
            "program": "${workspaceFolder}\\src\\app.ts",
            "preLaunchTask": "npm: debug*build",
            "outFiles": ["${workspaceFolder}/**/_.js"]
          }
        ]
      }
      ```

    - Crear script en "package.json"

      - "debug_build": "tsc",
        - Nota: el rimraf es un PAQUETE DESTRUCTIVO, por tanto tener cuidado al usarlo.

    - Problema con ' "preLaunchTask": "tsc: build - tsconfig.json", '
      - El VSC está ejecutando:
        - tsc -p c:\Users\xxx\Downloads\yyyy\zzzz\tsconfig.json
      - Pero en la terminal ese path "c:\Users\xxx\Downloads\yyyy\zzzz\tsconfig.json" no existe
      - Hay que investigar como hacer para que pueda ejecutar el path pero con los "separadores de directorios" adecuado.
        - tsc -p /c/Users/xxx/Downloads/yyyy/zzzz/tsconfig.json

  - process.stdout.write no imprime en consola
    - stackoverflow: https://stackoverflow.com/questions/51810557/where-is-stdout-for-vs-code#answer-51815414
      - en el "launch.json" agregar dentro del objeto que está en "configurations"
        "console": "internalConsole",
        "outputCapture": "std",

- Node a Escritorio (Electron / Tauri)

  - Electron

    - ERROR: can´t not find node binaries

      - https://bobbyhadz.com/blog/cant-find-node-js-binary-node-path-does-not-exist
        - Ejecutar "code ." desde la consola.

    - ## https://www.electronjs.org/docs/latest/tutorial/ tutorial-first-app#optional-debugging-from-vs-code

    - https://github.com/JohannRosenberg/debugging-electron

      - "launch.json"

        ```json
        {
          // Use IntelliSense to learn about possible attributes.
          // Hover to view descriptions of existing attributes.
          // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
          "version": "0.2.0",
          "configurations": [
            {
              "name": "Launch Program",
              "type": "node",
              "request": "launch",
              "cwd": "${workspaceRoot}",
              "skipFiles": ["<node_internals>/**"],
              "runtimeExecutable": "${workspaceRoot}/node_modules/.bin/electron",
              "program": "${workspaceFolder}\\src\\main.js"
            }
          ]
        }
        ```

  - Alternativa a Electron

    - Tauri y usa Rush.
      - https://faztweb.com/contenido/aplicaciones-de-escritorio-en-javascript
    - Nativefier
      - FaztCode: Convierte sitios web en Aplicaciones de Escritorio con Nativefier
        - https://www.youtube.com/watch?v=nH1Fnzp3VYU

  - coderJeet: ElectronJS Tutorial - How to debug Electron JS in VS Code

    - https://www.youtube.com/watch?v=-bjl401p5r8&list=PLmx8ERLT7ojO2PAH_sDnnoKXcqswxJ6CL&index=2

      - Debug en electron js es diferente por que maneja DOS PROCESOS SEPRADOS.
        - MAIN PROCESS: node debugger
        - RENDERER PROCESS: chromium debugger
      - Manual solo habla del "main process"

        - https://www.electronjs.org/docs/latest/tutorial/debugging-vscode

      - https://github.com/Microsoft/vscode-recipes/tree/master/Electron

        - Presionar en el ícono debug en la "Activity Bar" o crtl+shift+d para traer la vista de debug. Presionar el gear icono para configurar un launch.json.
        - Seleccionar Chrome para el entorno.

        - Reemplazar el contenido con lo que hay en el archivo del github dado anteriormente.

          ```json
          {
            "version": "0.2.0",
            "configurations": [
              {
                "type": "node",
                "request": "launch",
                "name": "Electron: Main",
                "runtimeExecutable": "${workspaceFolder}/node_modules/.bin/electron",
                "runtimeArgs": ["--remote-debugging-port=9223", "."],
                "windows": {
                  "runtimeExecutable": "${workspaceFolder}/node_modules/.bin/electron.cmd"
                }
              },
              {
                "name": "Electron: Renderer",
                "type": "chrome",
                "request": "attach",
                "port": 9223,
                "webRoot": "${workspaceFolder}",
                "timeout": 30000
              }
            ],
            "compounds": [
              {
                "name": "Electron: All",
                "configurations": ["Electron: Main", "Electron: Renderer"]
              }
            ]
          }
          ```

        - DEBUG DEL PROCESO MAIN

          - Poner el brake point en alguna línea del main.js dentro de la función createWindow
          - Ir a la vista de Debug y seleccionar la configuración "Electron: Main" y presionr F5 o el botón verde.
          - VSC tratará de iniciar la aplicación Electron

        - DEBUG DEL PROCESO RENDERER

          - Actualizar el contenido de "renderer.js" a:

            ```js
            // This file is required by the index.html file and will
            // be executed in the renderer process for that window.
            // All of the Node.js APIs are available in this process.
            function test() {
              console.log("test");
            }
            test();
            ```

          - Mientras su sessión de debug está corriendo, puede ir a la vista de debug y seleccionar configuración "Electron: Renderer" la cual conectará VSC al proceso de renderer de electrón.
          - Cuando se conecte ir a "renderer.js" y poner breakpoint en la línea 6.
          - ## Ahora ir a la ventana de la aplicación de electrón y hacer un reload de la página (view-> reload o ctrl+R)

        - DEBUG LOS DOS PROCESOS SIMULTANEAMENTE.

          - Se usa el "compound configurations"

            - https://code.visualstudio.com/updates/v1_8#_multitarget-debugging

          - En la ventana de debug seleccionar "Electron: All" esto conectará VSC con los procesos de Main y Renderer.
          - Poner los breakpoints.
