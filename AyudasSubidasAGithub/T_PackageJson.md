- package.json (entendiendo)

  - files

    - https://docs.npmjs.com/cli/v10/configuring-npm/package-json#files
      - The optional files field is an array of file patterns that describes the entries to be included when your package is installed as a dependency

  - main / export

    - Es una keyword LEGACY
    - Es el punto de entrada de nuestra aplicación.
    - En la actualidad es mejor usar "export"

    - export reemplaza a "main"
    - Con "export" añadimos encapsulación: solo podemos acceder al que especificamos en export.
    - https://nodejs.org/api/packages.html#exports-sugar
    - https://www.youtube.com/watch?v=2qizpBu5QCQ

      - Estructura inicial

        ```bash

            mkdir calc && cd calc
            npm init -y
            cd ..

            mkdir myapp && cd calc
            npm init -y
            cd ..

            cd calc
            npm link myapp
            cd ..

            cd myapp
            npm link calc
            cd ..

        ```

        ```javascript

            // pwd -> CALC
            // main.js
                export function Add(x,y){
                    console.log("Called Add);
                    return x + y;
                }
            // package.json
                {
                    "main": "main.js",
                    "type": "module"
                }

        ```

        ```javascript
            // pwd -> MYAPP
            // main.js
                import {Add } from "calc"
                Add(10,10)

            // package.json
                {
                    "main": "main.js",
                    "type": "module"
                }

        ```

      - Realizado

        - Si llamamos sin "type": "module" nos da error debemos ponerlo en ambos.
        - Si llamamos con "main": "index.js"
          - Error: Module not found. Me está diciendo cuál es el módulo por default que tengo que llamar; está buscando por "index.js"
        - Si ponemos a "main": "main.js" funciona OK.

      - Reemplazando "main" por "export"

        ```javascript

            // pwd -> CALC
            // package.json
                {
                    "export": {
                        ".": "./main.js" #por default (.) vamos a usar main.js
                    },
                    "type": "module"
                }

        ```

        - Realizado

          - Si ejecutamos funciona bien

      - Encapsulación

        ```javascript

            // pwd -> CALC/feature/superadd.js
            // superadd.js
                export function superadd(x,y,z){
                    console.log("Called superadd);
                    return x + y + z;
                }

        ```

        - Realizado

          - Si tratamos de acceder a superadd desde "myapp" no me permite. Me indicará que no se ha proveído de un módulo superadd.

        - Actualizamos "export"

        ```javascript

            // pwd -> CALC
            // package.json
                {
                    "export": {
                        ".": "./main.js", #por default (.) vamos a usar main.js
                        "./feature": "./feature/superadd.js"
                    },
                    "type": "module"
                }

        ```

        ```javascript
        // pwd -> MYAPP
        // main.js
        import { Add } from "calc";
        import { superadd } from "calc/feature";
        Add(10, 10);
        superadd(10, 10, 10);
        ```

      - Export condicionales

        - Actualizamos "export"

        ```javascript

            // pwd -> CALC
            // package.json
                {
                    "export": {
                        ".": "./main.js", #por default (.) vamos a usar main.js
                        "./feature": {
                            "development": "./feature/devsuperadd.js".
                            "default": "./feature/superadd.js".
                        }
                    },
                    "type": "module"
                }

        ```

        ```javascript
        // pwd -> MYAPP
        // main.js
        import { Add } from "calc";
        import { superadd } from "calc/feature";
        Add(10, 10);
        superadd(10, 10, 10);
        ```

        ```bash
        node --condicion=development main.js
        // importará devsuperapp.js
        ```

  - main / import / module / type

    - https://nodejs.org/api/packages.html#imports

      - Las entradas deben ser campos que empiecen con #
      - Permiten mapear paquetes externos
      - The hidden power of package.json (https://medium.com/outbrain-engineering/the-hidden-power-of-package-json-a93143ec0b7c)
        - Cuando requerimos un paquete nodejs lo busca en ndoe_modules, por defecto buscará y ejecutará el "index.js"
        - Podemos cambiar este comportamiento con "main":"lib/index.js"
          - Ahora cuando requiramos algún módulo, irá al node_modules ignorará el index.js y buscará lib/index.js
        - También podemos soportar ESM (import) usando la propiedad "module"
          - "module":"lib/index.mjs"
          - import data from "some-module"
            - buscará node_modules/some-module/lib/index.mjs.
        - types
          - El compilador de TypeScript usa un algoritmo similar a nodejs para localizar los tipos en los paquetes, con la diferencia que busca extensión ."d.ts".
          - Por default TS buscará index.d.ts dentro del folder del módulo, pero si ponemos "types":"lib/index.d.ts" ignorará el default y buscará en la ruta indicada.
      - Al combinar estas propiedades podemos configurar cjs, esm y typeScript simultáneamente.
        - "main": "lib/index.cjs"
        - "module": "lib/index.mjs"
        - "types": "lib/index.d.ts"
      - export / import

        - export

          - Indica el punto de entrada
          - Controla como acceder a los subdirectorios del paqute
          - Previene acceder a archivos específicos.

          ```javascript
              "exports":{
                  ".":"./lib/index.js", //como usar "main"
                  "./utils": "./lib/utils/index.js"
              }
              require("some_module")
              require("some_module/utils")
          ```

        - import

          - Nos permite crear scopes que evitan que escribamos ../../.. ..

          ```javascript
              "imports":{
                  "#utils/read":"./src/utils/read.js"
              }
              const read = require("#utils/read")
          ```
