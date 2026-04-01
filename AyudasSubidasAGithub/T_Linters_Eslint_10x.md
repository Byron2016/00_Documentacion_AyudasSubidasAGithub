- **Eslint**
  - Para versión 10 trabaja con **eslint.config.js**
    - **Características**
      - Ya no hay el archivo **.eslintrc**
      - Se debe crear el archivo **eslint.config.js**
      - Nativo ESM: ESLint v10 está diseñado para trabajar con módulos modernos (import/export), eliminando los problemas de CommonJS que daban errores en proyectos de Vite o Next.js.
    
    - **Instalación de Dependencias**
      - <code>pnpm add -D eslint@latest prettier eslint-config-prettier eslint-plugin-react globals @eslint/js</code>
        - **Nota**: Ya no necesitamos **eslint-plugin-react-hooks** por separado en muchos casos, ya que el plugin oficial de React ha integrado muchas de estas funciones.
    
    - **eslint.config.js**
      - Crear en la raíz **eslint.config.js** A diferencia de la v8, este archivo exporta un array de objetos.
        ```javascript
          import js from "@eslint/js";
          import globals from "globals";
          import reactPlugin from "eslint-plugin-react";
          import prettierConfig from "eslint-config-prettier";

          export default [
            // 1. Ignorar carpetas (Reemplaza a .eslintignore)
            {
              ignores: ["dist", ".next", "node_modules"],
            },

            // 2. Configuración base para JS y React
            {
              files: ["**/*.{js,jsx}"],
              languageOptions: {
                ecmaVersion: "latest",
                sourceType: "module",
                globals: {
                  ...globals.browser,
                  ...globals.node,
                },
              },
              plugins: {
                react: reactPlugin,
              },
              rules: {
                ...js.configs.recommended.rules,
                ...reactPlugin.configs.recommended.rules,
                "react/react-in-jsx-scope": "off", // No necesario en React moderno
                "react/prop-types": "off",
              },
              settings: {
                react: {
                  version: "detect", // Detecta automáticamente tu versión de React
                },
              },
            },

            // 3. Prettier SIEMPRE al final para desactivar reglas en conflicto
            prettierConfig,
          ];
        ```

      - **Explicación**
        - **ignores**: En la v10, los ignores van en un objeto separado al principio del array.
        - **files**: Defines exactamente a qué archivos aplica cada bloque de reglas.
        - **languageOptions**: Centraliza la versión de ECMAScript y los globales (browser/node) que antes estaban dispersos en env.
        - **prettierConfig**: Al ser un objeto, simplemente se añade al final del array para sobreescribir cualquier regla de estilo que ESLint intente aplicar.
  
  - **Instalación de Dependencias**
      - <code>npm init @eslint/config@latest</code>
        - Need to install the following packages **eslint/create-config@1.11.0* Ok to proceed? (y)
        - **What do you want to lint?**
          - (*) JavaScript
          - ( ) JSON
          - ( ) JSON with comments
          - ( ) JSON5
          - ( ) Markdown
          - (*) CSS
        - **How would you like to use ESLINT?**
          - To check syntax only
          - --> To check syntax and find problems
        - **What type of modules does your project use?**
          - --> JavaScript modules (import/export)
          - CommonJS (require/exports)
          - None of these
        - **Which framework does your project use?**
          - --> React
          - Vue.js
          - None of these
        - **Does your project use TypeScript?**
          - -->No
          - Yes
        - **Where does your code run?** (Press *space* to select, *a* to toggle all *i* to invert selection)
          - -->Browse
          - Node
        - **The config that you´ve selected requires the following dependencies: eslint, @eslint/js, globals, eslint-plugin-react, @eslint/css Would you like to install them now?** 
          - No
          - -->Yes
        - **Con TypeScript**
          - eslint, @eslint/js, globals, typescript-eslint, eslint-plugin-react, @eslint/css
        - **Sin React**
          - eslint, @eslint/js, globals, @eslint/css

        - **Which package manager do you want to use?**
          - npm
          - yarn
          - -->pnpm
          - bun


    - **eslint.config.js**
      - Crear en la raíz **eslint.config.js** A diferencia de la v8, este archivo exporta un array de objetos.  
      - **Sin TypeScript**    
        
        ```javascript
          import js from "@eslint/js"; // Importa el núcleo de reglas para JavaScript.
          import globals from "globals"; // La librería estándar para definir qué variables existen (como window o process).
          import pluginReact from "eslint-plugin-react"; // El plugin específico para entender la sintaxis de React y JSX.
          import css from "@eslint/css"; // Novedad de la v10. ESLint ahora tiene un plugin oficial para revisar errores en tus archivos .css.
          import { defineConfig } from "eslint/config"; // Una función de utilidad que ayuda a que tu editor (VS Code) te dé sugerencias (autocompletado) mientras escribes la configuración.

          export default defineConfig([
            { 
              // Bloque 1: JavaScript & Módulos
              // Define que estas reglas aplican a archivos JS normales, ES Modules (.mjs), CommonJS (.cjs) y archivos de React (.jsx).
              files: [
                "**/*.{js,mjs,cjs,jsx}"
              ], 
              // Registra el motor de JS.
              plugins: { 
                js 
              }, 
              // Activa las reglas básicas de seguridad (como evitar variables no definidas).
              extends: [
                "js/recommended"
              ], 
              // Sustituye al antiguo env. Aquí le dices que tu código corre tanto en el navegador como en el servidor (Node.js).
              languageOptions: { 
                globals: {
                  ...globals.browser, 
                  ...globals.node
                } 
              } 
            },
            // Bloque 2: React (Línea suelta)
            // A diferencia de la v8, aquí se importa un objeto pre-configurado llamado flat.recommended. Esto ya incluye las reglas de React sin que tengas que escribirlas una a una.
            pluginReact.configs.flat.recommended,
            // Bloque 3: CSS (La gran diferencia)
            // Esto es nuevo. ESLint ahora analiza tus archivos .css para buscar errores de sintaxis o propiedades inválidas, algo que antes solo hacían herramientas como Stylelint.
            // 
            { 
              files: ["**/*.css"], // Define que estas reglas aplican a archivos (.css). Ámbito de aplicación
              plugins: { css }, // Registra el motor de css. Motor de análisis
              language: "css/css", // Intérprete de sintaxis
              extends: ["css/recommended"] // Conjunto de reglas
            },
          ]);
        ```
      
      - **Con TypeScript**    
        
        ```javascript
          ...
          import tseslint from "typescript-eslint"; // Es el paquete oficial (anteriormente conocido como @typescript-eslint/eslint-plugin y parser) que une ambos mundos. Funcionalidad: Actúa como un traductor. El código TypeScript no puede ser leído por el motor estándar de ESLint; este paquete lo convierte en un formato que ESLint puede analizar sin dar errores de sintaxis.
          ...

          export default defineConfig([
            { 
              ...
              files: [
                "**/*.{js,mjs,cjs,ts,mts,cts,jsx,tsx}"
              ], 
              ...
            },
            tseslint.configs.recommended, // activa las mejores prácticas para TypeScript de forma automática. Detectan cuando defines una variable pero no le asignas un tipo (si tienes activado el modo estricto). Evitan el uso de any innecesario. Aseguran que las interfaces y tipos estén bien estructurados.
            ...
          ]);
        ```
        
      - **Con REGLAS(Desactivando) con TypeScript**    
        
        ```javascript
          import js from "@eslint/js";
          import globals from "globals";
          import tseslint from "typescript-eslint";
          import pluginReact from "eslint-plugin-react";
          import css from "@eslint/css";
          import { defineConfig } from "eslint/config";

          // 1. Definición de tu constante (Igual que antes)
          const RULES = {
            OFF: 'off',
            WARN: 'warn',
            ERROR: 'error'
          };

          export default defineConfig([
            { 
              ...
              files: [
                "**/*.{js,mjs,cjs,ts,mts,cts,jsx,tsx}"
              ], 
              ...
            },
            tseslint.configs.recommended, // activa las mejores prácticas para TypeScript de forma automática. Detectan cuando defines una variable pero no le asignas un tipo (si tienes activado el modo estricto). Evitan el uso de any innecesario. Aseguran que las interfaces y tipos estén bien estructurados.
            ...
          ]);

          export default defineConfig([
            { 
              // Bloque 1: JavaScript & Módulos
              // Define que estas reglas aplican a archivos JS normales, ES Modules (.mjs), CommonJS (.cjs) y archivos de React (.jsx).
              files: [
                "**/*.{js,mjs,cjs,ts,mts,cts,jsx,tsx}"
              ], 
              // Registra el motor de JS.
              plugins: { 
                js,
                // Motivo de agregar react y @types.....
                // Visibilidad de las reglas: Para que puedas usar tus RULES.OFF en líneas como 'react/prop-types' o '@typescript-eslint/...', el objeto de configuración debe saber qué significan esos prefijos (react y @typescript-eslint).
                // Mapeo explícito: Al escribir react: pluginReact, le estás diciendo a ESLint: "Cuando veas una regla que empiece con react/, usa la lógica del objeto pluginReact que importé arriba".
                // Evitar errores de "Definition not found": Si no los incluyes en ese bloque específico donde defines tus rules, ESLint lanzará un error diciendo que no reconoce la regla, aunque el plugin esté instalado en el proyecto.
                react: pluginReact,
                '@typescript-eslint': tseslint.plugin 
              }, 
              // Activa las reglas básicas de seguridad (como evitar variables no definidas).
              // La razón técnica por la que se eliminó esa sección específica dentro del Bloque 1 tiene que ver con cómo se heredan las reglas en el nuevo sistema Flat Config de la versión 10 y cómo evitar conflictos al usar tu variable RULES.
              // 1. El orden de las piezas (Capa sobre capa)
              // En la v10, el archivo de configuración es un array que se procesa en orden descendente. Al principio del archivo que armamos, pusimos las reglas base de esta forma:

              // Paso 1: Cargamos ...tseslint.configs.recommended.

              // Paso 2: Cargamos pluginReact.configs.flat.recommended.

              // Al hacer esto, ya estás importando las reglas recomendadas de JavaScript, TypeScript y React. Si volviéramos a poner extends: ["js/recommended"] dentro de tu bloque personalizado, estaríamos intentando "extender" algo dentro de un objeto que ya tiene sus propias reglas definidas, lo cual puede causar que ESLint se confunda sobre qué regla tiene prioridad.

              // 2. Evitar que las reglas recomendadas sobrescriban tus RULES
              // Si pones el extends dentro del bloque donde están tus rules personalizadas (como RULES.OFF), corres el riesgo de que la configuración recomendada "gane" y reactive reglas que tú quieres apagar.

              // En el manual que estamos construyendo, la lógica es:

              // Importar lo recomendado globalmente (fuera de tu bloque).

              // Sobrescribir solo lo que tú decidas dentro de tu bloque de rules usando tu variable RULES.

              // 3. Simplificación del código para Notepad++
              // En la v10, la propiedad extends dentro de un objeto de configuración (como el Bloque 1) ya no funciona igual que en la v8. Ahora, para usar reglas recomendadas de forma limpia, lo ideal es:

              // O bien se "esparcen" dentro de rules (usando ...js.configs.recommended.rules).

              // O bien se añaden como elementos independientes en el array principal (como hicimos con React y TS).
              // extends: [
              //   "js/recommended"
              // ], 
              // Sustituye al antiguo env. Aquí le dices que tu código corre tanto en el navegador como en el servidor (Node.js).
              languageOptions: { 
                globals: {
                  ...globals.browser, 
                  ...globals.node
                } 
              } 
              // APLICACIÓN DE TUS REGLAS PASO A PASO:
              rules: {
                // 1. Cargas las recomendadas de JS como base
                ...js.configs.recommended.rules,
                
                // 2. Aplicas tus sobrescrituras usando la variable RULES
                'react/prop-types': RULES.OFF,
                'react/react-in-jsx-scope': RULES.OFF,
                'import/no-absolute-path': RULES.OFF,
                '@typescript-eslint/explicit-function-return-type': RULES.OFF,
                
                // Ejemplo: puedes añadir avisos preventivos
                'no-console': RULES.WARN
              },
              settings: {
                react: { version: "detect" }
              }
            },
            // ¿Por qué los tres puntos (...) en tseslint.configs.recommended?
            // Este es un concepto de JavaScript llamado Spread Operator (operador de propagación), y su uso aquí es una diferencia crítica entre cómo se maneja React y cómo se maneja TypeScript en la v10.
            // Diferencia de Estructura: * pluginReact.configs.flat.recommended es un solo objeto de configuración.
            // tseslint.configs.recommended es una colección (un Array) de varios objetos de configuración.
            // La función del ...: Como el defineConfig([...]) recibe un array de objetos, si pones el array de TypeScript directamente dentro, tendrías un "array dentro de otro array", lo cual rompería la configuración.
            // Resultado: Los tres puntos "extraen" todos los objetos internos de la configuración de TypeScript y los colocan al mismo nivel que tus otros bloques, permitiendo que ESLint los lea uno por uno de forma plana.
            ...tseslint.configs.recommended,
            pluginReact.configs.flat.recommended,
            // Bloque 3: CSS (La gran diferencia)
            // Esto es nuevo. ESLint ahora analiza tus archivos .css para buscar errores de sintaxis o propiedades inválidas, algo que antes solo hacían herramientas como Stylelint.
            // 
            { 
              files: ["**/*.css"], // Define que estas reglas aplican a archivos (.css). Ámbito de aplicación
              plugins: { css }, // Registra el motor de css. Motor de análisis
              language: "css/css", // Intérprete de sintaxis
              extends: ["css/recommended"] // Conjunto de reglas
            },
          ]);
        ```




- **Prettier**
  - **Instalación**
    - <code>pnpm add --save-dev --save-exact prettier</code>
    - <code>pnpm add -D prettier eslint-config-prettier eslint-plugin-prettier</code>
    - <code>node --eval "fs.writeFileSync('.prettierrc','{}\n')"</code>
    - <code>node --eval "fs.writeFileSync('.prettierignore','# Ignore artifacts:\nbuild\ncoverage\n')"</code>
  - **Actualizar archivo eslint.config.js**        
        ```javascript
          ...
          // 1. Importar Prettier
          import eslintPluginPrettierRecommended from "eslint-plugin-prettier/recommended";

          export default defineConfig([
            ...
            pluginReact.configs.flat.recommended,
            { 
              files: ["**/*.css"], 
              ...
            },
            // 2. Agregar la configuración recomendada de Prettier al final
            // Esto desactiva las reglas de ESLint que entran en conflicto con Prettier
            eslintPluginPrettierRecommended,
          ]);
        ```
  - **Configuración de Prettier (.prettierrc)**
    ```json
      {
        "semi": false,
        "singleQuote": true,
        "trailingComma": "es5",
        "printWidth": 80,
        "tabWidth": 2
      }
    ```

- **Scripts en package.json**
    ```json
      {
        "scripts": {
          "lint": "eslint .",
          "lint:fix": "eslint . --fix",
          "format": "prettier --write .",
          "format:check": "prettier --check ."
        }
      }
    ```
- **Configuración de VS Code (settings.json)**
  - Para que el auto-formateo funcione con la v10 y el Flat Config, asegúrate de tener esto en tu settings.  
  - **eslint.experimental.useFlatConfig**: Aunque en la v10 ya es el estándar, algunas versiones de la extensión de VS Code aún requieren este flag para asegurar que lea correctamente el archivo .js.  
    ```json
      {
        "editor.formatOnSave": true,
          "editor.defaultFormatter": "esbenp.prettier-vscode",
          "eslint.experimental.useFlatConfig": true, 
          "editor.codeActionsOnSave": {
            "source.fixAll.eslint": "explicit"
          },
          "eslint.validate": [
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact"
          ]
      }
    ```
- **Resumen de cambios clave vs v8:**
  - ****Adiós** .eslintrc.js: Ahora es eslint.config.js.
  - ****Adiós** .eslintignore: Ahora se integra dentro de la configuración en la propiedad ignores.
  - ****Adiós** env: { browser: true }: Ahora se usa la librería globals importada manualmente.
  - ****Plugins**: Ya no se pasan como strings ("react"), sino como objetos importados directamente en el archivo.
