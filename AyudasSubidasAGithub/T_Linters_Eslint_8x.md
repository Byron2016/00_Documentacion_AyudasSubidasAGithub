- Eslint

  - para V.8.57.0 trabajar con eslint.config.mjs

    ```js
    import globals from "globals";

    import path from "path";
    import { fileURLToPath } from "url";
    import { FlatCompat } from "@eslint/eslintrc";
    import pluginJs from "@eslint/js";

    // mimic CommonJS variables -- not needed if using CommonJS
    const __filename = fileURLToPath(import.meta.url);
    const __dirname = path.dirname(__filename);
    const compat = new FlatCompat({
      baseDirectory: __dirname,
      recommendedConfig: pluginJs.configs.recommended,
    });

    export default [
      { languageOptions: { globals: { ...globals.browser, ...globals.node } } },
      ...compat.extends("standard-with-typescript"),
    ];
    ```

  - V.8.x LO VIEJO.

    - Eslint Prettier Conventional Commits.

      - MIRAR:

        - Para TypeScript

          - Tutorial TypeScript con Node.js y Express. ¡Crea tu API REST con tipos estáticos DESDE CERO!

            - https://www.youtube.com/watch?v=ZpY5KdGQvwI&list=PLV8x_i1fqBw0Kn_fBIZTa3wS_VZAqddX7&index=53

              - npm install ts-standard -D -E / pnpm add ts-standard -D -E
              - en package.json
                - "eslintConfig": {
                  "parseOptions": {
                  "project": "./tsconfig.json"
                  }
                  "extends": ["./node_modules/ts-standard/eslintrc.json"]
                  }

          - Midulive 3.33: Clon de Google Translate | React, TypeScript, ChatGPT + ViteTest

            - https://www.youtube.com/watch?v=kZhabulNCUc&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=8

            - (ref: eslint_TypeScript)

            - En ".eslintrc.cjs "
              module.exports = {
              overides: [...],
              parseOtions: {
              ....
              project: './tsconfig.json'
              }
              }

        - D:\dev\HTML_CS_JS\012_EslintPrettier\conf_eslint_prettier

      - Creando la página Home y configurando ESLINT y PRETTIER en nuestro proyecto

        - MIDUDEV: https://www.youtube.com/watch?v=EEDRcolSHms&list=PLV8x_i1fqBw1VR86y4C72xMGJ8ifjBwJ6&index=4
          - Resumen - npm i -D eslint prettier eslint-config-prettier - Funcione con ver ant a 9 de eslint - npm i -D standard@17.1.0 eslint-config-prettier prettier - Esta ya instalará eslint@8.41.0

              - npm init @eslint/config
              - echo ".next" >> .prettierignore
              - echo '{"semi": false}' >> .prettierrc.json
              - echo ".next" >> .eslintignore

          - ESLINT
            - **Instalación** 
              - npm i -D eslint@^8.57.1
            - **Inicializar toda la configuración de Slint**
              - npx eslint --init o npm init @eslint/config /pnpx eslint --init
                - **Configuración** (D:\dev\HTML_CS_JS\012_EslintPrettier\conf_eslint_prettier)
                  - **How would you like to use ESLint?**
                    - To check syntax, find problems, and enforce code style
                  - **What type of mudules does your project use?**
                    - JavaScript modules (import/export)
                  - **Which framework does your project use?**
                    - React
                  - **Does your project use TypeScript?**
                    - No
                  - **Where does your code run?**
                    - Presionar "a" para TODOS (Osea Brawser y Node)
                  - **How would you like to define a style for your project?**
                    - Use a popular style guide
                      - Seleccionar: Standard: https://github.com/standard/standard
                  - **What format do you want your config file to be in?**
                    - JavaScript (Opciones son: JavaScript / YAML / JSON)
                  - **Would you like to install them now with npm?**
                    - Yes
              - Ya a este punto nos ha creado el **.eslintrc.js**

              - **NOTA**:

                - .eslintrc.\*
                  - .js: and export an object containing your configuration.
                  - .cjs: in JavaScript packages that specify "type":"module" in their package.json Note that ESLint does not support ESM configuration at this time.

                - Original:
                  ```javascript
                  module.exports = {
                    root: true,
                    env: { browser: true, es2020: true },
                    extends: [
                      "eslint:recommended",
                      "plugin:react/recommended",
                      "plugin:react/jsx-runtime",
                      "plugin:react-hooks/recommended",
                      "prettier",
                    ],
                    ignorePatterns: ["dist", ".eslintrc.cjs"],
                    parserOptions: { ecmaVersion: "latest", sourceType: "module" },
                    settings: { react: { version: "18.2" } },
                    plugins: ["react-refresh"],
                    rules: {
                      "react-refresh/only-export-components": [
                        "warn",
                        { allowConstantExport: true },
                      ],
                    },
                  }
                  ```

                - Original:
                  ```javascript
                  module.exports = {
                    "env": { 
                      "browser": true, 
                      "es2020": true,
                      "node": true 
                    },
                    "extends": [
                      "plugin:react/recommended"
                      "standard",
                    ],
                    "parserOptions": { 
                      "ecmaFeatures": {
                        "jsx": true
                      }, 
                      "ecmaVersion": 11,
                      "sourceType": "module" 
                    },
                    "plugins": [
                      "react"
                    ],
                    "rules": {
                    },
                  }
                  ```

            - **Instalación Extensión** 
              - Instalar en VSCode la extensión *ESLint de Dirk Baeumer*
                
            - **Configurar settings.json (17.50)** / **Guardar al formatear**

              - Ir a *settings* Abrir con UI: Presionar "Crtl ," para abrirla.
                - Eslint: Enable (DEBE ESTAR HABILITADO)
                  - Controls whether eslint is enabled for JavaScript files or not.
                - Eslint: Code Actions On Save: Mode "Specifies the code action mode. Possible values are "all" and "problemas" PONERLO EN ALL
                - Eslint: Run
                  - Decidir si dejar en onType o ponerlo en "onSave" **Poner onSave**
                - **Abrir como archivo**:
                  - Presionar "Crtl + shift + p"
                  - Seleccionar Open Setting (json) (19.40)

                  - C:\Users\xxxx\AppData\Roaming\Code\User\settings.json

                    ```json
                      {
                        "[javascript]": {
                        	// Original
                        	// "editor.codeActionsOnSave": {
                        	// "source.fixAll.eslint": true
                        	// Utilizando CON prettier
                        	"editor.defaultFormatter": "esbenp.prettier-vscode",
                        	"editor.formatOnSave": true,
                        	}
                        }
                        "editor.formatOnSave": true
                      }
                    ``` 
                
                
                
                - **Cambios a hacer en el .eslintrc**

                  - Verificar que este haciendo un lint de los .jsx-eslint/eslint-plugin-react#configuration

                    - npx eslint .
                      - Debería encontrar problemas en .jsx
                    - Si no los logra encontrar hay que agregar lo siguientes
                      ```javascript
                        const RULES = {
                          OFF: 'off',
                          WARN: 'warn',
                          ERROR: 'error'
                        }
                        module.exports = {
                          ...
                          "parserOptions": { 
                            "ecmaFeatures": {
                              "jsx": true // <======
                            }, 
                            "ecmaVersion": 'latest',
                            "sourceType": "module" 
                          },
                          "plugins": [
                            ....
                          ],
                          overrides: [
                            ....
                            files: [
                            '.eslintrc.{js,cjs}',
                            '*.jsx', // <======
                            '*.js' // <======
                            ],
                            ....
                          ],
                          "rules": {
                            'react/prop-types': RULES.OFF,
                	          'react/react-in-jsx-scope': RULES.OFF,
                	          'import/no-absolute-path': RULES.OFF
                	          '@typescript-eslint/explicit-function-return-type': RULES.OFF,
                          },
                        }
                      ```


                  - No especificada la versión de React
                    parserOptions: { .... },

                    settings: { react: { version: '18.2' } }, // <======

                    plugins: [....],

                  - Ignorar carpetas
                    - extends: [.....]
                      ignorePatterns: ['dist', '.eslintrc.cjs'],// <======
                      parserOptions:{....}

            - Para TypeScript
              - Mirar un apartado especial (ref: eslint_TypeScript)
            - **Testear**
              - npx eslint .
              - npx eslint --fix
            - **Agregar en package.json**
              "lint": "eslint .",
              "lintfix": "eslint --fix"
            - npx eslint src/js/main.js --color
            - Extension VSC Eslint verificada x Microsoft
              - ESLint v. 2.4.2 de microsoft.com

              - 20240113: Configuración.

                - How to Format Code on Save in VS Code with ESlint

                  - https://www.aleksandrhovhannisyan.com/blog/format-code-on-save-vs-code-eslint/ #3-formatting-on-save-in-vs-code-with-eslint

                - ACTIVAR AUTOCORRECIÓN/AUTOFORMATO DE ESLINT AL GUARDAR UN ARCHIVO EN VS CODE

                  - https://www.cesarguerra.mx/ activar-autocorrecion-autoformato-de-eslint-al-guardar-un-archivo-en-vs-code/ #:~:text=ESLint%20es%20una%20herramienta%20muy,y%20coma%2C%20espaciados%2C%20etc.

                  - Abrir la paleta de comandos: Ctrl+Shift+P en Windows y Cmd+Shift+P en Mac
                  - Escribir settings json
                  - Seleccionar las preferencias de usuario: Preferences: Open User Settings (JSON)
                  - En el settings.json agregar al final:

                    "eslint.validate": [
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact"
                    ],
                    "editor.codeActionsOnSave": {
                    "source.fixAll.eslint": true,
                    }

            - Agregar en .gitignore

              - .eslintcache

            - Desactivar reglas de ESLint y StandardJS (21.35)

              - https://bobbyhadz.com/blog/missing-return-type-of-function-eslint-typescript-explicit

              - 'React' must be in scope when using JSX y Error de las propTypes

                - Espera que en el archivos este: import React from "react";


            - ERROR:

              - ESLint was configured to run on `<tsconfigRootDir>/auth-front\.eslintrc.cjs` using `parserOptions.project`: <tsconfigRootDir>/auth-front\tsconfig.json
                However, that TSConfig does not include this file. Either: - Change ESLint's list of included files to not include this file - Change that TSConfig to include this file - Create a new TSConfig that includes this file and include it in your parserOptions.project

                - https://typescript-eslint.io/linting/ troubleshooting#i-get-errors-telling-me-eslint-was-configured-to-run--however-that-tsconfig-does-not--none- of-those-tsconfigs-include-this-file

                - Solución

                  - Más fácil.

                    - Añadir a ".eslintrc.cjs" luego de ""extends":"[...],"" ignorePatterns: ["dist", ".eslintrc.cjs"],

                  - Solución: https://github.com/vitejs/vite/issues/13747

                    - HendrikThePendric commented on Jul 13, 2023 •

                    I might be stating the obvious here, but adding the files to ignorePatterns (Add ignorePatterns: [".eslintrc.cjs", "vite.config.ts"], to .eslintrc.cjs to fix) will disable ESLint for these files, which probably isn't what you want. So the suggestion @ArnaudBarre made is probably more helpful. Personally I had to go through a few additional steps as well. I'll list them below:

                    In .eslintrc.cjs add project: ['./tsconfig.json', './tsconfig.node.json'], to parserOptions
                    In tsconfig.node.json add "allowJs": true, to compilerOptions and update the include array to this "include": ["vite.config.ts", ".eslintrc.cjs",]
                    But now I saw a warning Cannot write file './eslintrc.cjs' because it would overwrite input file.. To fix, add "noEmit": true, to the compilerOptions in tsconfig.node.json.
                    And finally I now saw a lint error in .eslintrc.cjs which said tsconfigRootDir: **dirname Unsafe assignment of an "any" value. Since **dirname is a NodeJS thing I figured I needed to install the types for nodeJS yarn add -D @types/node, and tell the compiler to use them, so I added "types": ["@types/node"], to compilerOptions in tsconfig.node.json
                    Now everything is being linted and I am not seeing any lint errors anymore. So probably this is the "correct" configuration.

                    Caveat: Whenever you add a file to the project root which you want to be linted, you'll have to manually add that file to the include array in tsconfig.node.json. I tried editing the include and exclude fields in tsconfig.node.json to effectively make it include "all relevant files at the project root" but I couldn't get it to work as I intended and got the initial error again.

          - **PRETTIER - scripts**:
            ```JSON
              {
                "scripts": {
                  "format": "prettier --write . --config .prettierrc --ignore-path .prettierignore",
                  "format:check": "prettier --check . --config .prettierrc --ignore-path .prettierignore",
                },
              }
            ```

            - Mismo estilo de código en todo nuestro proyecto.
            - Sitio oficial [Prettier](https://prettier.io/).
            - **Evitar conflictos con eslint. (40.30)**
              - Agregar **eslint-config-prettier**
                - Ejecutar: npm i -D eslint-config-prettier / pnpm add -D eslint-config-prettier
              - Ejecutar: npm i -D prettier / pnpm add -D prettier
              - En archivo ".eslintrc.js" desactivar todas las reglas de linter q pelean con prettier.
              - Agregar com **ÚLTIMA** extensión la de prettier.

                ```javascript
                  extends: [
                    'plugin:react/recommended',
                    'standard',
                    'prettier'
                  ],

                ```

                - Con esto logramos desactivar todas las reglas que se pelean entre eslint y prettier

            - **Configuración prettier. (43.30)**
              - crear archivo .prettierignore (45.00)
                - .next
              - crear archivo .prettierrc.json
                - Que exista aunque sea vacío.
            - ver errores. (45.30)
              - npx prettier . --check // pnpx prettier . --check
            - corregir errores. (45.30)
              - npx prettier . --write
            - Instalar extension de PRETTIER (46.15)

              - Prettier de Code formatter using prettier (esbenp.prettier-vscode)

              ```json
              {
              	"editor.defaultFormatter": "esbenp.prettier-vscode",
              	"[javascript]": {
              	"editor.defaultFormatter": "esbenp.prettier-vscode"
              	// Fijarse en la parte de eslint que ya se especifica.
              	"editor.formatOnSave": true
              	}
              }
              ```

            - **Decirle a PRETTIER no usar ; (49.55)**

              - En ".prettierrc.json" Prettier de Code

                ```json
                {
                  "semi": false,
                  "singleQuote": true
                }
                ```

            - **Prettier para astrojs**

              - Referencias

                - https://github.com/withastro/prettier-plugin-astro
                - Usando Plugging oficial Astro
                  - https://marketplace.visualstudio.com/items?itemName=astro-build.astro-vscode
                  - https://code.visualstudio.com/docs/editor/codebasics#_formatting

              - pnpm add -D prettier prettier-plugin-astro
              - crear .prettierrc.mjs
                // .prettierrc.mjs
                /\*_ @type {import("prettier").Config} _/
                export default {
                plugins: ["prettier-plugin-astro"],
                overrides: [
                {
                files: "*.astro",
                options: {
                parser: "astro",
                },
                },
                ],
                };
              - Agregar al "<project_path>\.vscode\settings.json"
                {
                "prettier.documentSelectors": ["**/*.astro"],
                "[astro]": {
                "editor.defaultFormatter": "esbenp.prettier-vscode",
                "editor.formatOnSave": true
                }
                }

          - **VERIFICAR ESLINT Y PRETTIER SE CUMPLEN (54.30)**

            - Verificar antes de commitear que esté pasando el linter y el prettier.
              hay un montón de estrategias y casi todas utilizando "Husky" (Ver T_Test_Husky_Lint_Staged.txt) (incluso hay gente que lo hace a mano)
              "lint-staged" - solo hace lint y prettier de los archivos tocados - es bastante rápida - Configuración cero. - También utiliza Husky

          - **PARA HACER PRUEBAS**

            - Archivo Button.js
              ,,,
              import { colors } from "./theme";

              export default function Button ({ children, onClick }) {
              let a = "hola";
              return (
              <>
              <button onClick={onClick}>
              {children}
              </button>
              <style>{`
              button {
              align-items: center;
              background: ${colors.black};
              border-radius: 9999px;
              border: 0;
              color: #fff;
              cursor: pointer;
              display: flex;
              font-size: 16px;
              font-weight: 800;
              padding: 8px 24px;
              transition: opacity .3s ease;
              }
              
                  	button > :global(svg) {
                  	margin-right: 8px;
                  	}
              
                  	button:hover {
                  	opacity: .7;
                  	}
                  `}</style>

                  </>

              )
              }
              ,,,

            - Archivo theme.js
              ,,,
              export const breakpoints = {
              mobile: '520px'
              }

              export const fonts = {
              base: 'system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Ubuntu, "Helvetica Neue", sans-serif'
              }

              export const colors = {
              black: '#000000',
              white: '#ffffff',
              primary: '#0099ff',
              secondary: '#1c5480'
              }
              ,,,

            - npm i -D prettier (43.20)
            - npx prettier src/js/main.js --write
            - Archivo .prettierrc.json
            - Extension VSC Prettier verificada x Prettier
            - Boton derecho format document with prettier
            - Extensiones/Settings/Format on Save
            - Añadir .prettierignore (45.09)
              - Agregar .next
            - npx prettier . --check
            - ## Quitar puntos y comas.

            - RESOLVER PROBLEMAS DE INCOMPATIBILIDAD ESLINT Y PRETTIER
              - npm i -D eslint-config-prettier (41.03)
              - copiar en eslintrc.js sección extends:
                ['eslint-config-prettier']

    - Estandariza el #CÓDIGO de tu equipo de desarrollo usando: #ESLINT #PRETTIER y #HUSKY 😎

      - Programacion en español: https://www.youtube.com/watch?v=sKT4YvXc1SY

        - Instalar devDependencies

          - Linter

            - npm i -D eslint
            - plugin para prettier
              - npm i -D eslint-plugin-prettier
            - plubin para TS
              - npm i -D @typescrpt-eslint/eslint-plugin
            - no conflictos entre prettier y esling
              - npm i -D eslint-config-prettier

          - prettier
            - npm i -D prettier

        - configuracion eslintrc.json 3.00
        - crear el el script en package.json

          ```json
          {
            "lint": "eslint \"_/**/_.{js,ts,tsx}\" --quiet --fix"
          }
          ```

        - ignorar archivos

          - .eslintignore

            ```bash
              package.json
              package-lock.json
              node-module
              dist
            ```

          - .prettierignore

            ```bash
              .next
            ```

        - configuracion prettier
          - .prettierrc.json
        - VSC (9.02)

          - actualizar settings.json

            ```json
              {
                ...
                "[javascript]": {
                "editor.autoClosingBrackets": "always",
                "editor.defaultFormatter": "dbaeumer.vscode-eslint",
                "editor.codeActionsOnSave": {
                "source.fixAll.eslint": true
                },
                "editor.formatOnSave": true
                },
                "[json]": {
                "editor.autoClosingBrackets": "always",
                "editor.defaultFormatter": "dbaeumer.vscode-eslint",
                "editor.codeActionsOnSave": {
                "source.fixAll.eslint": true
                },
                "editor.formatOnSave": true
                },
                "[typescript]": {
                "editor.autoClosingBrackets": "always",
                "editor.defaultFormatter": "dbaeumer.vscode-eslint",
                "editor.codeActionsOnSave": {
                "source.fixAll.eslint": true
                },
                "editor.formatOnSave": true
                }
              }

            ```

        - Hooks de git

          - Ver T_Test_Husky_Lint_Staged.txt

        - Convensional Commits 17.18

          - https://www.conventionalcommits.org/en/v1.0.0/
          - https://carlosazaustre.es/conventional-commits

          - https://www.youtube.com/watch?v=EdXgW4kMWe8
          - npm i -D @commitlint/config-conventional @commitlint/cli
          - Crear archivo
            .commitlintrc.json

            ```json
            {
              "extends": ["@commitlint/config-conventional"]
            }
            ```

          - Agregar el hook (https://typicode.github.io/husky/#/)

            - [Husky add YA NO FUNCIONA PENDIENTE ARREGLAR.] npx husky add .husky/commit-msg 'npx --no -- commitlint --edit "$1"'

          - probar
            - ok:
              - git add . && git commit -m 'feat: conventional commits implementation with husky'

          git add . && git commit -m "chore!: lint-staged

          BREAKING CHANGE: use JavaScript features not available in Node 6."

    git add . && git commit -m "chore!: lint-staged

    BREAKING CHANGE: use JavaScript features not available in Node 6."

    - ERROR:

      - Error [ERR_REQUIRE_ESM]: require() of ES Module /home/byron/Code/gr_js_bc/gr_js_bc_s40/.eslintrc.js from /home/byron/Code/ gr_js_bc/gr_js_bc_s40/node_modules/@eslint/eslintrc/dist/eslintrc.cjs not supported.
        .eslintrc.js is treated as an ES module file as it is a .js file whose nearest parent package.json contains "type": "module" which declares all .js files in that package scope as ES modules.
        Instead rename .eslintrc.js to end in .cjs, change the requiring code to use dynamic import() which is available in all CommonJS modules, or change "type": "module" to "type": "commonjs" in /home/byron/Code/gr_js_bc/gr_js_bc_s40/package.json to treat all .js files as CommonJS (using .mjs for all ES modules instead).

      - ESLint fails with ESM and JS eslintrc #14137

        - https://github.com/eslint/eslint/issues/14137

          - CAMBIAR
            DE .eslintrc.js
            A .eslintrc.cjs

      - Warning: React version not specified in eslint-plugin-react settings. See https://github.com/jsx-eslint/ eslint-plugin-react#configuration .
        - Agregar esta configuración luego de "ignorePatterns: ["dist", ".eslintrc.cjs"]," en el ".eslintrc.js"
          ```json
          {
            "settings": {
              "react": {
                "version": "detect"
              }
            }
          }
          ```

    - ERRORES LINT

      - 'React' must be in scope when using JSX

        - https://github.com/jsx-eslint/eslint-plugin-react/blob/master/docs/rules/react-in-jsx-scope.md

          - If you are using the new JSX transform from React 17, you should disable this rule by extending react/jsx-runtime
            in your eslint config (add "plugin:react/jsx-runtime" to "extends").

          - Solución 1:

            - Fácil
              - Agregar
                - 'react/react-in-jsx-scope': RULES.OFF
                - A "rules" del .eslintrc.jcs

          - Solución 2:
            - Agregar
              - "plugin:react/jsx-runtime"
              - A "extends" del .eslintrc.jcs

      - Module '"react"' has no exported member 'useState'.ts(2305)

        - Solución 1:
          - Agregar
            - "plugin:react/jsx-runtime"
          - Salir y volver a entrar a VSC

      - Using target="\_blank" without rel="noreferrer" (which implies rel="noopener")
        is a security risk in older browsers: see https://mathiasbynens.github.io/rel-noopener/#recommendations eslintreact/ jsx-no-target-blank)

        - https://github.com/jsx-eslint/eslint-plugin-react/blob/master/docs/rules/jsx-no-target-blank.md
          - viene de eslint-plugin-react
          - se soluciona con --fix

      - Missing return type on function.eslint@typescript-eslint/explicit-function-return-type)

        - Espera q la función tenga un tipo de retorno.
        - Dependiendo podría ser soluciones

          - :void
          - https://bobbyhadz.com/blog/missing-return-type-of-function-eslint-typescript-explicit

            - React:

              - : React.FC<TagProps>
              - : React.FC
              - : JSX.Element o <======
              - : React.ReactElement

              - NOTA: DEBE ESTAR EXTENDIDO "plugin:react/jsx-runtime"

      - Do not import modules using an absolute patheslintimport/no-absolute-path

        - https://github.com/import-js/eslint-plugin-import/blob/v2.28.1/docs/rules/no-absolute-path.md
        - viene de eslint-plugin-import -

        - How to change eslint settings to understand absolute import?
          - https://stackoverflow.com/questions/50234858/how-to-change-eslint-settings-to-understand-absolute-import

      - All imports in the declaration are only used as types. Use `import type`.eslint@typescript-eslint/consistent-type-imports)

        - https://typescript-eslint.io/rules/consistent-type-imports/
          - Se debe agregar la palabra "type" antes del nombre q le pondré a lo importado.
          - import type { Foo } from 'Foo';
          - import type Bar from 'Bar';

      - Returning a void expression from an arrow function shorthand is forbidden.
        Please add braces to the arrow function.eslint@typescript-eslint/no-confusing-void-expression)

        - https://typescript-eslint.io/rules/no-confusing-void-expression/

      - 7 Recommended ESLint Rules for React TypeScript Project
        - https://itnext.io/7-recommended-eslint-rules-for-react-typescript-project-1a22b011b4b5

    # for macOS and Linux

    rm -rf node_modules && rm -f package-lock.json && rm -f yarn.lock && npm cache clean --force && npm install
    rm -rf node_modules && rm -f package-lock.json && npm cache clean --force && npm install

    # for Windows

    rd /s /q "node_modules" && del package-lock.json && del -f yarn.lock && npm cache clean --force && npm install

    - Path hacer un alias

      - Creamos una app en React ! buenas prácticas, clean architecture, redux, context y Typescript !

        - https://www.youtube.com/watch?v=p9PAmqpCWgA&t=2765s

          - buscar en google

            - alias vitejs react typescript

          - En vite.config.ts

            - import \* as path from 'path'

            - instalar tipos de typescript de nodejs

              - npm i -D @types/node

            - agregar luego de plugins
              resolve: {
              alias: [{ find: '@', replacemente: path.resolve(__dirname, 'src) }]
              }

          - En tsconfi.json
            - Agregar dentro de compilerOptions
              - "paths": {
                "@/_": ["./src/_"]
                },

- **Rome** (Ahora mantenido por BIOME)

      - CRUD con React Redux Toolkit + Rome Tools y Tremor

        - https://www.youtube.com/watch?v=bEEjuwujbbU

          - https://biomejs.dev/blog/annoucing-biome/

            - The rome package won’t be maintained anymore by the core team, so you won’t get any more releases.

            - Oficial web: https://biomejs.dev/
            - Instalación biomejs

              - Instalar

                - npm install --save-dev --save-exact @biomejs/biome
                - yarn add --dev --exact @biomejs/biome
                - pnpm add --save-dev --save-exact @biomejs/biome
                - bun add --dev --exact @biomejs/biome

              - Configuración

                - npx @biomejs/biome init
                - yarn dlx @biomejs/biome init
                - pnpm dlx @biomejs/biome init
                - bunx @biomejs/biome init

              - uso

                - Formatear archivos y directorios

                  - npx @biomejs/biome format <files> --write
                  - yarn dlx @biomejs/biome format <files> --write
                  - pnpm dlx @biomejs/biome format <files> --write
                  - bunx @biomejs/biome format <files> --write

                - Lint y aplicar ARREGLOS SEGUROS a archivos y directorios

                  - npx @biomejs/biome lint <files>
                  - yarn dlx @biomejs/biome lint <files>
                  - pnpm dlx @biomejs/biome lint <files>
                  - bunx @biomejs/biome lint <files>

                - Aplicar format y lint
                  - npx @biomejs/biome check --apply <files>
                  - yarn dlx @biomejs/biome check --apply <files>
                  - pnpm dlx @biomejs/biome check --apply <files>
                  - bunx @biomejs/biome check --apply <files>

              - Plugin VSC

                - Instalación

                  - Biome VS Code extension
                    - Biome
                      - biomejs biomejs.dev

                - Conf.

                  - Disable workspace

                    - Eslint
                    - Prettier

                  - **biome.json**

                    ```json
                    {
                      "$schema": "https://biomejs.dev/schemas/1.5.2/schema.json",
                      "organizeImports": {
                        "enabled": true
                      },
                      "linter": {
                        "enabled": true,
                        "rules": {
                          "recommended": true
                        }
                      },
                      "formatter": {
                        "enabled": true
                      },
                      "javascript": {
                        "formatter": {
                          "semicolons": "asNeeded"
                        }
                      }
                    }
                    ```

                  - Ir a algún archivo "App.tsx" y validar errores son de biome.

                  - Crear en raíz archivo .vscode/settings.json

                    ```json
                    {
                      "editor.formatOnSave": true,
                      "editor.codeActionsOnSave": {
                        "source.fixAll.biome": true,
                        "source.organizeImports": true
                      },
                      "[javascript]": {
                        "editor.defaultFormatter": "biomejs.biome"
                      },
                      "[javascriptreact]": {
                        "editor.defaultFormatter": "biomejs.biome"
                      },
                      "[typescript]": {
                        "editor.defaultFormatter": "biomejs.biome"
                      },
                      "[typescriptreact]": {
                        "editor.defaultFormatter": "biomejs.biome"
                      }
                    }
                    ```
