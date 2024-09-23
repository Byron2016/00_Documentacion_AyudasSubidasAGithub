- Desarrollo Útil: REQUIRE vs IMPORT ⚡ COMMON JS vs ES MODULES 🤔 CJS vs ESM 🟢 Curso de Node.JS desde cero #3

  - https://www.youtube.com/watch?v=29iYdru2KUg&list=PL3aEngjGbYhnrRfZKMxzn79qdgPxL7OWM&index=3

    - Enlaces:

      - Documentación Common.JS (CJS): https://nodejs.org/docs/latest/api/modules.html
      - Documentación ECMAScript Modules (ESM): https://nodejs.org/docs/latest/api/esm.html
      - CJS con ESM: https://nodejs.org/docs/latest/api/esm.html#interoperability-with-commonjs

    - **Operando con ESM y CJS (28.44)**

      - **ESM**

        - **NOTAS**

          - ESM OBLIGA a indicar la extensión del archivo.

        - **No existe**

          - module.export
          - require
          - \_\_dirname
          - \_\_filename
          - Import directo de JSON

        - **Usar en su lugar**

          - <code>console.log(import.meta.url) --> \_\_dirname</code>

        - **Operar con Commonjs en ESM**

          - Para la gran mayoría de casos:

            - Preparación

              - En "package.json"

                ```json
                {
                  "main": "index.js",
                  "type": "module"
                }
                ```

              - Crear archivo "operaciones.cjs"

                ```javascript
                const suma = (numA, numB) => {
                  return numA + numB;
                };
                const resta = (numA, numB) => {
                  return numA - numB;
                };
                module.exports = { suma, resta };
                ```

              - Crear archivo "index.js" e importar "operaciones.cjs"

                ```javascript
                import { suma, resta } from "./operaciones.cjs";

                console.log(suma(4, 5));
                ```

              - Probar
                <code>node index.js</code>

          - Para importar un JSON:

            - Crear archivo "users.json"

              ```json
              [
                {
                  "name": "pepito",
                  "edad": 30
                },
                {
                  "name": "juanito",
                  "edad": 30
                }
              ]
              ```

            - En "package.json"

              ```json
              {
                "main": "index.js",
                "type": "module"
              }
              ```

            - ALTERNATIVA 1

              - Crear archivo "index.js" e importar "user.json"

                ```javascript
                import { createRequire } from "node:module";
                const require = createRequire(import.meta.url);

                const users = require("./users.json");
                console.log(users);
                ```

              - Probar:
                <code>node index.js</code>

            - ALTERNATIVA 2 **(MiduDev)**

              - midulive (19.45): https://www.youtube.com/watch?v=ev3Yxva4wI4&list=PLUofhDIg_38qm2oPOV-IRTTEKyrVBBaU7&index=4
              - **(DEPRECADO)** ALTERNATIVA 2.1

                - En browser compatibility indica que está DEPRECADO.
                - https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import

                - Importar "user.json"

                  ```javascript
                  import users from "./users.json" assert { type: "json" } //DEPRECADO
                    import users from "./users.json" with { type: "json" } //Status: Stage 3 https://github.com/tc39/proposal-import-attributes

                  console.log(users);
                  ```

                - Nota:

                  - Al 20240923 ES DEPRECADO.

                    - ## https://v8.dev/features/import-assertions

                - Probar
                  <code>node index.js</code>

              - ALTERNATIVA 2.2

                - midulive (21.50): https://www.youtube.com/watch?v=ev3Yxva4wI4&list=PLUofhDIg_38qm2oPOV-IRTTEKyrVBBaU7&index=4

                - **Forma 1**

                  ```javascript
                  import fs from "node:fs";
                  const users = JSON.parse(
                    fs.readFileSync("./users.json", "utf-8")
                  );

                  console.log(users);
                  ```

                - **Forma 2** (Ya explicado anteriormente con createRequire)

                  - Crear un **helpers/utils.js** para invocarlo.

                    ```javascript
                    import { createRequire } from "node:module";
                    const require = createRequire(import.meta.url);

                    export const readJSON = (path) => require(path);
                    ```

                  - Usar el **helpers/utils.js**

                    ```javascript
                    import { readJSON } from "./utils.js";
                    const users = readJSON("./users.json");
                    ```

      - **CJS**

        - **Operar con ESM en Commonjs**

          - Notas

            - Se lo hace a través de "imports dinámicos"
            - Diferencia
              - ESM funciona de forma asíncrona
                - En ESM puedo importarme las cosas síncronas, ya que como funciona asíncronamente me da igual.
              - CJM funciona de forma síncrona

          - Para la gran mayoría de casos:

            - Preparación

            - En "package.json"

              ```json
              {
                "main": "index.js",
                "type": "commonjs" // O sin nada, x default es commonjs
              }
              ```

            - Crear archivo **ESM** "operaciones.mjs"

              ```javascript
              const suma = (numA, numB) => {
                return numA + numB;
              };
              const resta = (numA, numB) => {
                return numA - numB;
              };
              export { suma, resta };
              ```

            - Importar "operaciones.mjs" en "index.js"

              ```javascript
              import("./operaciones.mjs").then((operaciones) => {
                console.log(operaciones);
              }); //ESM --> async   commonjs --> sync
              ```

              ```javascript
              import("./operaciones.mjs").then((suma) => {
                console.log(suma(4, 9));
              }); //ESM --> async   commonjs --> sync
              ```

              - Probar
                <code>node index.js</code>
