- Importar npm modules a javascript sin frameworks

  - Import NPM modules into JavaScript applications without frameworks using TypeScript & Browserify
    - https://mirzaleka.medium.com/import-npm-modules-into-web-applications-without-frameworks-using-typescript-browserify-303515cb0885

- Pasar variables

  - nodejs

    - https://nodejs.org/docs/latest/api/process.html#process_process_argv
      - index.js
        ```javascript
        import { argv } from "node:process";
        console.log({ myVar: process.env.npm_config_myVar });
        argv.forEach((val, index) => {
          console.log(`${index}: ${val}`);
        });
        console.log({ myVar: process.env.npm_config_myVar });
        process.argv.forEach(function (val, index, array) {
          console.log(index + ": " + val);
        });
        ```
      - Ejecutar
        - node src/index_pr_01.js one --myVar=hola
          - Salida:
            - { myVar: undefined }
              0: C:\Users\bgva\AppData\Local\fnm_multishells\13156_1727005395840\node.exe
              1: C:\Users\bgva\Downloads\borrar\borrar_08\a_crear\src\index_pr_01.js
              2: one
              3: --myVar=hola

  - npm

    - index.js
      - Misma que en nodejs index.js
    - Ejecutar

      - npm run dev:pr_01 one --myVar=hola / npm --myVar=hola run dev:pr_01 one
        - Salida:
          - { myVar: 'hola' }
            0: C:\Users\bgva\AppData\Local\fnm_multishells\13156_1727005395840\node.exe
            1: C:\Users\bgva\Downloads\borrar\borrar_08\a_crear\src\index_pr_01.js
            2: one

    - Deducción:
      - Se accesa con "process.env.npm*config*<Nombre>" Ejem: process.env.npm_config_myVar
        - https://docs.npmjs.com/cli/v9/using-npm/config#environment-variables

  - pnpm

    - https://pnpm.io/es/pnpm-cli#diferencias-con-npm
    - npm_config_myVar=hola pnpm run dev:pr_01 one

      - OJO: Se debe definir explícitamente "npm_config_myVar=hola"

    - index.js
      - Misma que en nodejs index.js
    - Ejecutar

      - pnpm run dev:pr_01 one --myVar=hola

        - Salida:
          - { myVar: undefined }
            0: C:\Users\bgva\AppData\Local\fnm_multishells\13156_1727005395840\node.exe
            1: C:\Users\bgva\Downloads\borrar\borrar_08\a_crear\src\index_pr_01.js
            2: one
            3: --myVar=hola

      - npm_config_myVar=hola pnpm run dev:pr_01 one

        - Salida:
          - { myVar: 'hola' }
            0: C:\Users\bgva\AppData\Local\fnm_multishells\13156_1727005395840\node.exe
            1: C:\Users\bgva\Downloads\borrar\borrar_08\a_crear\src\index_pr_01.js
            2: one

      - pnpm run dev:pr_01 one npm_config_myVar=hola
        - Salida:
          - { myVar: undefined }
            0: C:\Users\bgva\AppData\Local\fnm_multishells\13156_1727005395840\node.exe
            1: C:\Users\bgva\Downloads\borrar\borrar_08\a_crear\src\index_pr_01.js
            2: one
            3: npm_config_myVar=hola

- JavaScript package managers compared: npm, Yarn, or pnpm?
  - https://blog.logrocket.com/javascript-package-managers-compared/
- npx
  - Instala en windows en el siguiente path:
    - Windows
      - C:\Users\bgva\AppData\Local\npm-cache_npx
    - bash shell
      - ~/Local Settings/npm-cache/\_npx/
- npm

  - Versionado en el package.json

    - https://docs.npmjs.com/cli/v7/configuring-npm/package-json#dependencies
      - tilde, carret

  - Globales que tengo instalados:

    - npm install -g pnpm
    -
    - corepack@0.28.1
    - npm@10.7.0
    - pnpm@9.4.0
    - yarn@1.22.21

    - Ver las versiones disponibles para instalar.
      - npm view <package> versions

  - Borrar cache

    - C:\Users\bgva\AppData\Local\npm-cache
    - npm cache clean --force
    - npm cache verify

  - ¿Qué es PostCSS y cómo usarlo?

    - https://www.arsys.es/academy/webinars/que-es-postcss

  - Kevin Powell: Stop using an extension to compile Sass

    - https://www.youtube.com/watch?v=o4cECvhrBo8

  - Stephanie Eckles's npm script: Minimum Static Site Setup with Sass

    - https://thinkdobecreate.com/articles/minimum-static-site-sass-setup/

    {
    ....
    "scripts": {
    "build:sass": "sass --no-source-map src/sass:public/css",
    "copy:assets": "copyfiles -u 1 ./src/assets/**/_ public",
    "copy:html": "copyfiles -u 1 ./src/_.html public",
    "copy": "npm-run-all --parallel copy:\*",
    "watch:assets": "onchange \"src/assets/**/_\" -- npm run copy:assets",
    "watch:html": "onchange 'src/_.html' -- npm run copy:html",
    "watch:sass": "sass --no-source-map --watch src/sass:public/css",
    "watch": "npm-run-all --parallel watch:_",
    "serve": "browser-sync start --server public --files public",
    "start": "npm-run-all copy --parallel watch serve",
    "build": "npm-run-all copy:html build:_",
    "postbuild": "postcss public/css/\*.css -u autoprefixer cssnano -r --no-map"
    },
    "dependencies": {
    }
    "devDependencies": {
    "autoprefixer":"10.4.13",
    "browser-sync": "2.27.11",
    "copyfiles": "2.4.1",
    "cssnano":"5.1.14",
    "npm-run-all": "4.1.5",
    "onchange": "7.1.0",
    "postcss-cli": "10.1.0",
    "sass": "1.57.1"
    },
    }

    - Ejecución scripts en paralelo y secuencial

      - Usar && (double ampersand) para ejecución secuencial.
      - Usar & (single ampersand) para ejecución paralelo.

      - https://stackoverflow.com/questions/47957124/how-can-i-run-multiple-npm-scripts-at-the-same-time/59585721#answer-56712735

  - PLUGINS
    - PostCSS
      - https://postcss.org/
      - https://github.com/postcss/postcss-cli
        - -u, --use List of postcss plugins to use
        - -r, --replace Replace (overwrite) the input file [boolean]
        - --no-map Disable the default inline sourcemaps

- pnpm

  - Instalación

    - Fazt Code: ¿Qué es pnpm y porque lo uso actualmente? - pnpm Tutorial

      - https://www.youtube.com/watch?v=MZ6JxWWCA5M

        - Si ya utiliza node, se recomienda usar COREPACK que es una utilidad de nodejs que permite utilizar otros administradores de paquetes.

      - Variables de entorno:

        - Sistema

          - PNPM_HOME --> C:\Users\bgva\AppData\Local\pnpm

        - Usuario
          - Path
            - %PNPM_HOME%

      - Instala / actualiza

        - npm install -g pnpm

          - npm ls -g

        - pnpm add -g pnpm
          - pnpm list -g

    - Donde instala los paquetes

      - SET
        - pnpm config set store-dir /d/.pnpm-store (https://pnpm.io/configuring)
          - Y se guarda en: C:\Users\bgva\AppData\Local\pnpm\config\rc
      - GET

        - pnpm store path (https://pnpm.io/cli/store#path)

          - If the $XDG_DATA_HOME env variable is set, then $XDG_DATA_HOME/pnpm/store
          - On Windows: ~/AppData/Local/pnpm/store
          - On macOS: ~/Library/pnpm/store
          - On Linux: ~/.local/share/pnpm/store

        - En windows:

          - %LOCALAPPDATA% (https://stackoverflow.com/questions/55403775/how-to-get-pnpm-store-directory#:~:text=On%20Windows%3A%20~%2FAppData%2FLocal,local%2Fshare%2Fpnpm%2Fstore)

        - Storage:
          - C:\Users\bgva\AppData\Local
            - pnpm ....

  - Comandos

    - pnpm i

      - Instala los paquetes
      - Si es un workspace en TODOS los proyectos.

    -

  - Desisntalación

    - https://pnpm.io/uninstall
      - Verificar todos los paquetes globales instalados con pnpm
        - pnpm ls -g
      - Hay dos formas para remover los paquetes globales
        - Eliminar paquetes uno a uno, con cada paquete listado antes ejecutar:
          - pnpm rm -g <pkg>...
        - Encontrar la ubicación del directorio global y removerlo manualmente.
          - pnpm root -g
          - rm -rf nombre directorio.
    - npm

      - npm list -g
      - npm uninstall pnpm -g

    - pnpm
      - pnpm list -g

  - Workspaces

    - Instalar solo las dependencias de un workspace en particular.

      - pnpm install --filter react-prueba-tecnica
      - El comando "" instala todas las dependencias, para evitarlo usar
      - pnpm i --filter=react-prueba-tecnica --dedupe-peer-dependents=false
        pnpm i --filter=react-prueba-tecnica --dedupe-peer-dependents=false

    - ## Intalar solo dependencias del root.

    - Instalar en un path en particular

      - https://stackoverflow.com/questions/72101186/pnpm-install-a-library-inside-micro-frontend
        - To filter by path:
          - pnpm add lodash --filter=./projects/vanilla
          - pnpm i --filter=./projects/vanilla
            - Debe existir un .npmrc con:
              - dedupe-peer-dependents=false
        - To filter by package name, you can specify the name of the package. For instance:
          - pnpm add lodash --filter=cashout
        - You can also just change the directory to portals/cashout and run installation there.

    - TypeScript Monorepo Setup with PNPM Workspaces, Vite, VueJS and TailwindCSS

      - https://www.youtube.com/watch?v=HM03XGVlRXI

        - structure
          - @app
            |- client
            |- server
          - packages
        - pnpm init
        - pnpm-workspace
          - Le comunicamos a pnpm que usaremos workspaces al crear el archivo "pnpm-workspace.yaml"
          - Se define los paths en los cuales ningún folder creamos va a ser interpretado como un paquete standalone.
          - pnpm-workspace.yaml
            packages:
            - ./@app/\*
            - ./packages/\*
        - Crear dentro carpeta "client" la apliación.

          - cambiar nombre según convensión para nombrar los paquetes con un signo "@"
          - dentro de aplicación
            - En package.json cambiar el nombre: "name": "@demo/client", (@ + nombre de la app + nombre paquete)

        - TypeScript

          - tsconfig file
            - reusar este archivo para reforzar algunas características de todos los paquetes en el monorepo.
            - Moverlo a la raíz del monorepo.

        - Scripts

          - Client
            - "client":"pnpm --filter @demo/client"

        - pnpm add -Dw typescript
        - pnpm add -Dw eslint eslint-config-prettier eslint-plugin-import eslint-plugin-simple-import-sort eslint-plugin-vue @typescript-eslint/eslint-plugin @typescript-eslint/parser prettier prettier-plugin-tailwindcss

          - @typescript-eslint/eslint-plugin :aplica linting rules for typescript
          - @typescript-eslint/parser: has the ability for eslint to lint typescript files
          - eslint-config-prettier: removes eslint that conflict with prettier letting prettier handle those.
          - eslint-plugin-import: ensure consistent import statements
          - eslint-plugin-simple-import-sort: It outomatically sorts import statements for us.
          - eslint-plugin-vue: contains linting rules for vue.js
          - prettier-plugin-tailwindcss: usamos tailwind css classes in our templates this plugin for prettier will allow it to automatically sor our css so that they remain consistent this make a big difference for the developer experience when using tailwindcss

        - crear en base del monorepo ".eslintrc"

  - ERROR: pnpm : No se puede cargar el archivo C:\ProgramFiles\nodejs\pnpm.ps1 porque la ejecución de scripts está deshabilitada en este sistema. Para obtener más información, consulta el tema about_Execution_Policies en https:/go.microsoft.com/fwlink/?LinkID=135170.

    - Get-ExecutionPolicy
    - Get-ExecutionPolicy -List
    - Get-ExecutionPolicy -Scope CurrentUser
    - Para cambiar la directiva de ejecución:

      - Set-ExecutionPolicy -ExecutionPolicy <PolicyName>
        - Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
      - Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

    - En marcus-evans: (https://github.com/orgs/pnpm/discussions/4810)
      - First check the execution policy for the current user .
        Please copy the code below and execute this on your vscode terminal
        - Get-ExecutionPolicy -Scope CurrentUser
      - if the result is Undefined change the execution policy for current user.
        Please copy the code below and execute this on your vscode terminal
        - Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
      - Then check if the execution policy are change to RemoteSigned
        - Get-ExecutionPolicy -Scope CurrentUser
