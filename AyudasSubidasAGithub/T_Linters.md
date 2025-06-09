-  [Gentleman Programming: Configuramos ESLint + Prettier y luego lo miramos a Biome #programacion #frontend #backend](https://www.youtube.com/watch?v=8ZjAy0U_pVg)
  - (V >= 9.19.0)
    -  package.json 
       -  "devDependencies"
          -  @eslint/compat
          -  @eslint/js
          -  eslint
          -  eslint-plugin-react
          -  eslint-plugin-react-hooks
          -  globals
          -  prettier
          -  typescript
          -  typescript-eslint
          -  typescript-eslint/parser
    -  **Prettier**
       -  src/.prettierignore
       -  src/.prettierrc
        ```javascript
          {
            "singleQuote": true,
            "printWidth": 80,

          }
        ```
    - **Eslint** 
      - ./eslint.config.mjs
        
        ```javascript
          import {fixupConfigRules} from '@eslint/compat';
          import js from '@eslint/js';
          import reactHooks from 'eslint-plugin-react-hooks';
          import reactJsx from 'eslint-plugin-react/configs/jsx-runtime.js';
          import react from 'eslint-plugin-react/configs/recommended.js';
          import globals from 'globals';
          import ts from 'typescript-eslint';
          import tsParser from 'typescript-eslint/parser';

          // Utilizamos un Default configuration a la cual vamos a ir incrementando las cosas
          export default [
            { languageOptions: {globals: globals.browser} },
            js.configs.recomended, // todas las recomendadas para javascript
            ...ts.configs.recomended, // todas las recomendadas para typescript
            ...fixupConfigRules([
              {
                ...react,
                settings: {
                  react: {version:'detect'},
                },
              },
              reactJsx,
            ]),
            {
              plugins: {
                // esto es para poder utilizar los plugins que importamos.
                'react-hooks':reactHooks,
              },
              rules: {
                // todas las reglas que vienen de 
                ...reactHooks.configs.recommended.rules,
              },
            },
            {ignores: ['dist/']},
          ];
        ```
    - **Biome** 


- MonoRepo

  - Tips para automatizar
    - https://dev.to/vinomanick/create-a-monorepo-using-pnpm-workspace-1ebn
  - enolcasielles

    - https://github.com/enolcasielles/monorepo
    - https://dev.to/enolcasielles/construyendo-un-monorepo-en-typescript-utilizando-pnpm-2144

  - Basem Emara
    - https://medium.com/hike-medical/ditching-yarn-creating-a-monorepo-with-pnpm-workspaces-6fa7e3bfe19c
      - (muy bueno paso por paso pero eslintrc)


- **Configurar neostandard**
  - **Eslint**
    - Instalar dependencia: <code>npm init @eslint/config</code>
    - Agregar "neostandard": <code>pnpm i -D neostandard</code>
    - Agregar "eslint.config.mjs":
      ```js
        import neostandard from 'neostandard'

        export default [...neostandard()]
      ```
    - **Scripts** 
      - <code>"lint": "eslint . ",</code>
      - <code>"lintfix": "eslint --fix",</code>
    
  - **Prettier**
    - Instalar dependencia: <code>pnpm add -D -E prettier</code>
    - Agregar ".prettierrc": <code>node --eval "fs.writeFileSync('.prettierrc','{}\n')"</code>
    - Agregar ".prettierignore":<code>node --eval "fs.writeFileSync('.prettierignore','# Ignore artifacts:\nbuild\ncoverage\n')"</code>
    - **Scripts** 
      - <code>"pre": "prettier . --check",</code>
      - <code>"prewri": "prettier . --write",</code>
    
  - **Testear**
    - **Eslint**
      - Crear un archivo "./src/js/main.js" 
        ```js
          let a = "hola";
          let b = "mundo";
        ```
      - Ejecutar <code>npm run lint</code>
        ```js
          C:\Users\...\src\js\main.js
            1:5   error  'a' is never reassigned. Use 'const' instead  prefer-const
            1:9   error  Strings must use singlequote                  @stylistic/quotes
            1:15  error  Extra semicolon                               @stylistic/semi
            2:5   error  'b' is never reassigned. Use 'const' instead  prefer-const
            2:9   error  Strings must use singlequote                  @stylistic/quotes
            2:16  error  Extra semicolon                               @stylistic/semi
            4:15  error  Strings must use singlequote                  @stylistic/quotes
            4:22  error  Extra semicolon                               @stylistic/semi
            5:15  error  Extra semicolon                               @stylistic/semi
        ```
      - Ejecutar <code>npm run lintfix</code>
    - **Prettier**
      - Crear un archivo "./src/js/main.js" 
        ```js
          let a = "hola";
          let b = "mundo";
        ```
      - Ejecutar <code>npm run lint</code>
        ```js
          C:\Users\...\src\js\main.js
            1:5   error  'a' is never reassigned. Use 'const' instead  prefer-const
            1:9   error  Strings must use singlequote                  @stylistic/quotes
            1:15  error  Extra semicolon                               @stylistic/semi
            2:5   error  'b' is never reassigned. Use 'const' instead  prefer-const
            2:9   error  Strings must use singlequote                  @stylistic/quotes
            2:16  error  Extra semicolon                               @stylistic/semi
            4:15  error  Strings must use singlequote                  @stylistic/quotes
            4:22  error  Extra semicolon                               @stylistic/semi
            5:15  error  Extra semicolon                               @stylistic/semi
        ```
      - Ejecutar <code>npm run prewri</code>
        - Colocará comillas dobles y puntos y comas.


  - **eslint-config-prettier**
    - Instalar dependencia: <code>pnpm add -D -E eslint-config-prettier</code>
    - Agregar "eslint.config.mjs":
      ```js
        import neostandard from 'neostandard'
        import eslintConfigPrettier from 'eslint-config-prettier/flat'

        export default [...neostandard(), eslintConfigPrettier];
      ```
    - **Al testear nuevamente**
      - Ya no se pondrá con el lint la comilla simple.
      - Ya no se quitarán los ";"

  - **Incorporando @eslint/js**
      ```js
        import neostandard from 'neostandard'
        import eslintConfigPrettier from 'eslint-config-prettier/flat'
        import js from '@eslint/js'
        import globals from 'globals'
        import { defineConfig } from 'eslint/config'

        const RULES = {
          OFF: 'off',
          WARN: 'warn',
          ERROR: 'error'
        }

        export default [...neostandard(), eslintConfigPrettier];
        export default [
          ...defineConfig([
            {
              files: ['**/*.{js,mjs,cjs}'],
              plugins: { js },
              extends: ['js/recommended'],
              rules: {
                'no-unused-vars': RULES.off,
              },
            },
            {
              files: ['**/*.{js,mjs,cjs}'],
              languageOptions: { globals: { ...globals.browser, ...globals.node } },
            },
          ]),
          ...neostandard(),
          eslintConfigPrettier,
        ]
      ```

		- eslint.config.js ✅
			```javascript
          // github.com/eslint/eslint/discussions/19257#discussioncomment-13035062
          // github.com/eslint/eslint/discussions/19689
          // usa recomended rules, neostandar, css, desabilita regla de esltin/js pero la tiene activa en neostandard.
          import js from "@eslint/js";
          import globals from "globals";
          import css from "@eslint/css";
          import { defineConfig } from "eslint/config";
          import neostandard from "neostandard";
          import eslintConfigPrettier from "eslint-config-prettier/flat";

          const RULES = {
            OFF: "off",
            WARN: "warn",
            ERROR: "error",
          };

          export default defineConfig([
            {
              files: ["**/*.{js,mjs,cjs,ts}"],
              plugins: { js },
              languageOptions: { globals: { ...globals.browser, ...globals.node } },
              extends: ["js/recommended", neostandard(), eslintConfigPrettier],
              rules: {
                "@/no-unused-vars": RULES.WARN,
              },
            },

            {
              files: ["**/*.css"],
              plugins: { css },
              language: "css/css",
              extends: ["css/recommended"],
              rules: {
                "css/no-empty-blocks": RULES.WARN,
              },
            },
          ]);
			```
  - **Testear**
    - Prueba 1
      - Condiciones
        - Poner en off la regla "no-unused-vars" en el "defineConfig"
        - Hacer el import de "eslint-config-prettier/flat"
        - Comentar el "eslintConfigPrettier" 
      - Resultado 
        - "defineConfig" no la toma en cuenta 
        - "neostandard" si la toma en cuenta

- **Prettier**

  - Instalar dependencia

    ```bash
        pnpm add -D -E prettier
    ```

  - Agregar ".prettierrc"

    ```bash
        node --eval "fs.writeFileSync('.prettierrc','{}\n')"

        echo "{
          \"semi\": false,
          \"singleQuote\": true
        }" > .prettierrc
    ```

  - Agregar ".prettierignore"

    ```bash
        node --eval "fs.writeFileSync('.prettierignore','# Ignore artifacts:\nbuild\ncoverage\n')"

        # Ignore artifacts:
        build
        coverage

        dist
        pnpm-lock.yaml
        pnpm-workspace.yaml
        package.json
        .prettierrc
        vite.config.ts
        tsconfig.json
        eslint.config.mjs
        eslint.config.cjs
        eslint.config.js
    ```

  - Agregar scripts a "package.json"
    ```bash
        npm pkg set scripts.format:check="prettier . --check"
        npm pkg set scripts.format:fix="prettier . --write"
    ```

- eslint-config-prettier

  - https://github.com/prettier/eslint-config-prettier#readme

  - Esto hacer luego de ESLint

  - Instalar dependencia

    ```bash
        pnpm add -D -E eslint-config-prettier
    ```

  - Actualizar al "eslint.config.xx"

    ```js
        ....
        import eslintConfigPrettier from 'eslint-config-prettier'
        ....

        export default tseslint.config({
          extends: [
            js.configs.recommended,
            ...tseslint.configs.recommended,
            eslintConfigPrettier,
          ],
          ....
    ```

- Eslint

  - (V >= 9)

    - [Syntax: Lint como un desarrollador senior con eslint + husky + lint staged + acciones de github](https://www.youtube.com/watch?v=Kr4VxMbF3LY)
      - [antfu eslint-config](https://github.com/antfu/eslint-config) 
      - [Configuración de CJ para antfu eslint-config](https://gist.github.com/w3cj/21b1f1b4857ecd13d076075a5c5aaf13/) 
      - [ESLint Stylistic](https://eslint.style/) 
      - [Husky](https://typicode.github.io/husky/) 
      - [lint-staged](https://www.npmjs.com/package/lint-staged) 
      - [Compilación y pruebas de Node.js](https://docs.github.com/en/actions/use-cases-and-examples/building-and-testing/building-and-testing-nodejs) 
      - [Activación de un flujo de trabajo](https://docs.github.com/en/actions/writing-workflows/choosing-when-your-workflow-runs/triggering-a-workflow) 
      - [act](https://nektosact.com/) 

    - Soportar Json & Markdown

      - Soportar [Json](https://github.com/eslint/json)

        - [ESLint now officially supports linting of JSON and Markdown](https://eslint.org/blog/2024/10/eslint-json-markdown-support/)

          - Instalar dependencias

            ```bash
              npm install @eslint/json -D
              pnpm install @eslint/json -D
            ```

          - Actualizar archivo de configuración

            ```javascript
            import json from "@eslint/json";
            export default [
              {
                plugins: {
                  json,
                },
              },
              // lint JSON files
              {
                files: ["**/*.json"],
                language: "json/json",
                rules: {
                  "json/no-duplicate-keys": "error",
                },
              },
            ];
            ```

      - Soportar [Markdown](https://github.com/eslint/markdown)

        - [ESLint now officially supports linting of JSON and Markdown](https://eslint.org/blog/2024/10/eslint-json-markdown-support/)

          - Instalar dependencias

            ```bash
              npm install @eslint/markdown-D
              pnpm install @eslint/markdown -D
            ```

          - Actualizar archivo de configuración

            ```javascript
            // eslint.config.js
            import markdown from "@eslint/markdown";
            export default [
              // lint MARKDOWN files
              {
                files: ["**/*.md"],
                plugins: {
                  markdown,
                },
                language: "markdown/commonmark",
                rules: {
                  "markdown/no-html": "error",
                },
              },
            ];
            ```

    - Ejemplo

      - **eslint.config.mjs**

        ```javascript
        // eslint.config.mjs
        // https://github.com/eslint/code-explorer/blob/main/eslint.config.mjs
        import globals from "globals"; // instalado con el CLI
        import pluginJs from "@eslint/js"; // instalado con el CLI
        import tseslint from "typescript-eslint"; // instalado con el CLI
        import pluginReact from "eslint-plugin-react"; // instalado con el CLI
        import pluginReactHooks from "eslint-plugin-react-hooks";
        import pluginJsxA11y from "eslint-plugin-jsx-a11y";
        export default [
          pluginJs.configs.recommended,
          ...tseslint.configs.recommended,
          pluginReact.configs.flat.recommended,
          {
            files: ["**/*.{js,mjs,cjs,ts,jsx,tsx}"],
            plugins: {
              react: pluginReact,
              "react-hooks": pluginReactHooks,
              "jsx-a11y": pluginJsxA11y,
            },
            languageOptions: {
              globals: globals.browser,
              sourceType: "module",
            },
            rules: {
              "react/react-in-jsx-scope": "off", // React 17+ doesn't require React to be in scope
              "react/prop-types": "off", // TypeScript handles type checking
              "@typescript-eslint/ban-ts-comment": "off",
              "jsx-a11y/anchor-is-valid": "warn",
              "jsx-a11y/alt-text": "warn",
              "react-hooks/rules-of-hooks": "error",
              "react-hooks/exhaustive-deps": "warn",
            },
            settings: {
              react: {
                version: "detect",
              },
            },
          },
          {
            ignores: ["**/*.config.js", "build/**"],
          },
        ];
        ```

      - **Prettier**

        - **.prettierignore**

          ```javascript
            // .prettierignore
            node_modules/
            dist/
            build/
            *.min.js
          ```

        - **.prettierignore**

          ```json
          {
            "useTabs": true,
            "tabWidth": 4,
            "arrowParens": "avoid",
            "overrides": [
              {
                "files": ["*.json"],
                "options": {
                  "tabWidth": 2,
                  "useTabs": false
                }
              }
            ]
          }
          ```

    - Entendiendo versionado (Current, Active, Maintenance )

      - https://eslint.org/version-support/

        - Las principales líneas de lanzamiento de ESLint se designan según el nivel de soporte que reciben del equipo de ESLint. Los estados de lanzamiento son:

          - Actual (Current): recibe mantenimiento y desarrollo activos del equipo de ESLint.
          - Mantenimiento (Maintenance): recibe correcciones de errores críticos, incluidos problemas de seguridad, y correcciones de compatibilidad para garantizar la interoperabilidad entre las principales líneas de lanzamiento. No se implementan otras correcciones o características de la línea de lanzamiento actual.
          - Fin de vida útil (EOL) (End of Life (EOL)): cuando una línea de lanzamiento deja de estar en modo de mantenimiento, no recibe más actualizaciones del equipo de ESLint.

      - https://github.com/eslint/eslint#user-content-semantic-versioning-policy

    - [Introducing ESLint Config Inspector](https://eslint.org/blog/2024/04/eslint-config-inspector/#:~:text=Visit%20http%3A%2F%2Flocalhost%3A7777,that%20are%20enabled%20or%20disabled.)

      - [Enterder](https://eslint.org/docs/latest/use/command-line-interface#--inspect-config)

        - Flat Config Mode Only. This option runs npx @eslint/config-inspector@latest to start the config inspector. You can use the config inspector to better understand what your configuration is doing and which files it applies to. When you use this flag, the CLI does not perform linting.

      - Ejecutarlo

        - eslint --inspect-config
        - npx @eslint/config-inspector

      - Usarlo
        - Una vez esté ejecutado visitar [inspector](http://localhost:7777/)
        - Nota: cuando se ejecuta el comando de ejecutarlo, el browser se abre solo.

    - Instalar - Ejecutar según el empaquetador que usemos:

      - Ejecutar **@eslint/config@latest**

        ```bash
          npm init @eslint/config@latest
          yarn create @eslint/config@latest
          pnpm create @eslint/config@latest
        ```

        - How would you like to use ESLint?

          - To check syntax only
          - **--> To check syntax and find problems**

        - What type of modules does your project use?

          - **--> JavaScript modules (import/export)**
          - CommonJS (require/exports)
          - None of these

        - Which framework does your project use?

          - **--> React**
          - Vue.js
          - None of these

        - Does your project use TypeScript?

          - No
          - **--> Yes**

        - Where does your code run?

          - **--> Browser**
          - Node

        - Would you like to install them now?

          - No
          - **--> Yes**

        - Which package manager do you want to use?

          - npm
          - yarn
          - **--> pnpm**
          - bun

      - Dependencias - Con @eslint/config@latest

        ```json
          {
            "devDependencies": {
              "@eslint/js": "^9.11.1",
              "eslint": "9.11.1",
              "eslint-plugin-react": "^7.37.1",
              "globals": "^15.10.0",
              "typescript-eslint": "^8.8.0"
            }
          }
          Nota: Vitest instala "eslint-plugin-react-hooks" y "eslint-plugin-react-refresh" y eslint instala "eslint-plugin-react"
        ```

        - Con vite (habría que actualizarse las versiones)

          ```json
          {
            "devDependencies": {
              "@eslint/js": "^9.8.0",
              "eslint": "^9.8.0",
              "eslint-plugin-react-hooks": "^5.1.0-rc.0",
              "eslint-plugin-react-refresh": "^0.4.9",
              "globals": "^15.9.0",
              "typescript-eslint": "^8.0.1",


              "@types/react": "^18.3.3",
              "@types/react-dom": "^18.3.0",
              "@vitejs/plugin-react-swc": "^3.7.0",
              "typescript": "^5.5.4",

              "vite": "^5.4.0"
            }
          }
          Nota: Vitest instala "eslint-plugin-react-hooks" y "eslint-plugin-react-refresh" y eslint instala "eslint-plugin-react"
          ```

        - eslint.config.xx

          - Si el "package.json" NO tiene "type" creará un "eslint.config.mjs"
          - Si el "package.json" SI tiene "type" creará un "eslint.config.js"

        - eslint.config.mjs

          - JavaScript modules/No framework/No TypeScript/browser

            - Package.json
              - @eslint/js, eslint, globals
            - Original:

              ```javascript
              import globals from "globals";
              import pluginJs from "@eslint/js";
              export default [
                {
                  languageOptions: {
                    globals: globals.browser,
                  },
                },
                pluginJs.configs.recommended,
              ];
              ```

          - JavaScript modules/No framework/No TypeScript/Node

            - Package.json
              - @eslint/js, eslint, globals
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                export default [
                  {
                    languageOptions: {
                      globals: {
                        globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                ];
              ```

          - JavaScript modules/No framework/No TypeScript/Node y Browser

            - Package.json
              - @eslint/js, eslint, globals
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                export default [
                  {
                    languageOptions: {
                      globals: {
                        ....globals.node,
                        ...globals.browser
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                ];
              ```

          - JavaScript modules/No framework/SI TypeScript/browser

            - Package.json
              - eslint@9.x, globals, @eslint/js, typescript-eslint
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                import tseslint from "typescript-eslint";
                export default [
                  {
                    {files: ["**/*.{js,mjs,cjs,ts}"]},
                    languageOptions: {
                      globals: {
                        globals.browser
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                  ...tseslint.configs.recommended,
                ];
              ```

          - JavaScript modules/No framework/SI TypeScript/node

            - Package.json
              - eslint@9.x, globals, @eslint/js, typescript-eslint
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                import tseslint from "typescript-eslint";
                export default [
                  {
                    {files: ["**/*.{js,mjs,cjs,ts}"]},
                    languageOptions: {
                      globals: {
                        globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                  ...tseslint.configs.recommended,
                ];
              ```

          - JavaScript modules/No framework/SI TypeScript/Node y Browser

            - Package.json
              - eslint@9.x, globals, @eslint/js, typescript-eslint
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                import tseslint from "typescript-eslint";
                export default [
                  {
                    {files: ["**/*.{js,mjs,cjs,ts}"]},
                    languageOptions: {
                      globals: {
                        ...globals.browser,
                        ...globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                  ...tseslint.configs.recommended,
                ];
              ```

          - CommonJS (require/exports)/No framework/No TypeScript/Browser

            - Package.json
              - @eslint/js, eslint, globals
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                export default [
                  {
                    {files: ["**/*.js"]},
                    languageOptions: {
                      sourceType: "commonjs"
                    }
                  },
                  {
                    languageOptions: {
                      globals: {
                        ...globals.browser
                      }
                    }
                  },
                  pluginJs.configs.recommended
                ];
              ```

          - CommonJS (require/exports)/No framework/No TypeScript/Node

            - Package.json
              - @eslint/js, eslint, globals
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                export default [
                  {
                    {files: ["**/*.js"]},
                    languageOptions: {
                      sourceType: "commonjs"
                    }
                  },
                  {
                    languageOptions: {
                      globals: {
                        ...globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended
                ];
              ```

          - CommonJS (require/exports)/No framework/No TypeScript/Node y Browser

            - Package.json
              - @eslint/js, eslint, globals
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                export default [
                  {
                    {files: ["**/*.js"]},
                    languageOptions: {
                      sourceType: "commonjs"
                    }
                  },
                  {
                    languageOptions: {
                      globals: {
                        ...globals.browser,
                        ...globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended
                ];
              ```

          - CommonJS (require/exports)/No framework/Si TypeScript/Browser

            - Package.json
              - @eslint/js, eslint, globals, typescript-eslint
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                import tseslint from "typescript-eslint";
                export default [
                  {files: ["**/*.{js,mjs,cjs,ts}"]},
                  {
                    {files: ["**/*.js"]},
                    languageOptions: {
                      sourceType: "commonjs"
                    }
                  },
                  {
                    languageOptions: {
                      globals: {
                        ...globals.browser
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                  ...tseslint.configs.recommended,
                ];
              ```

          - CommonJS (require/exports)/No framework/Si TypeScript/Node

            - Package.json
              - @eslint/js, eslint, globals, typescript-eslint
              - pnpm i -D @eslint/js eslint globals typescript-eslint
              - "typescript-eslint": "8.0.0-alpha.35"
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                import tseslint from "typescript-eslint";
                export default [
                  {files: ["**/*.{js,mjs,cjs,ts}"]},
                  {
                    {files: ["**/*.js"]},
                    languageOptions: {
                      sourceType: "commonjs"
                    }
                  },
                  {
                    languageOptions: {
                      globals: {
                        ...globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                  ...tseslint.configs.recommended,
                ];
              ```

          - CommonJS (require/exports)/No framework/Si TypeScript/Node y Browser

            - Package.json
              - @eslint/js, eslint, globals
              - pnpm i -D @eslint/js eslint globals
            - Original:

              ```javascript
                import globals from "globals";
                import pluginJs from "@eslint/js";
                import tseslint from "typescript-eslint";
                export default [
                  {files: ["**/*.{js,mjs,cjs,ts}"]},
                  {
                    {files: ["**/*.js"]},
                    languageOptions: {
                      sourceType: "commonjs"
                    }
                  },
                  {
                    languageOptions: {
                      globals: {
                        ...globals.browser,
                        ...globals.node
                      }
                    }
                  },
                  pluginJs.configs.recommended,
                  ...tseslint.configs.recommended,
                ];
              ```

      - Agregar **eslint-config-prettier**

        - Mirar el apartado específico para esto.

      - PROBLEMAS
        - JavaScript modules/No framework/SI TypeScript/Node y Browser

- *Pruebas con <code>npm init @eslint/config</code>*
	- **Opción 1**
		- What do you want to lint? *JavaScript*
		- How would you like to use ESLint? *To check syntax only* 
		- What Type of modules does your project use? *JavaScript modules (import/export)*
		- which framework does your project use? *None of these*
		- Does your project use TypeScript? *no*
		- Where does your code run? *Browser and Node* 
		- Package.json
  		- DevDependencies
    		- globals
    		- eslint
		- eslint.config.js 
			```javascript
				import globals from 'globals';
				import { defineConfig } from 'eslint/config';
					
				export default defineConfig([
          { files: ["**/*.{js,mjs,cjs}"], languageOptions: { globals: {...globals.browser, ...globals.node} } },
        ]);
			```
	- **Opción 2**
		- What do you want to lint? *JavaScript*
		- How would you like to use ESLint? *To check syntax and find problems* 
  		- Se agregó que también encuentre problemas, entonces agrega *@eslint/js*
		- What Type of modules does your project use? *JavaScript modules (import/export)*
		- which framework does your project use? *None of these*
		- Does your project use TypeScript? *no*
		- Where does your code run? *Browser and Node* 
		- Package.json
  		- DevDependencies
    		- @eslint/js
    		- globals
    		- eslint
		- eslint.config.js 
			```javascript
				import js from "@eslint/js";
				import globals from 'globals'
				import { defineConfig } from 'eslint/config'
					
				export default defineConfig([
          // { files: ["**/*.{js,mjs,cjs}"], plugins: { js }, extends: ["js/recommended"] },
          {
            files: ["**/*.{js,mjs,cjs}"],  // ▶ Define qué archivos afecta esta configuración
            plugins: { js },               // ▶ Carga un plugin (en este caso, '@eslint/js')
            extends: ["js/recommended"]    // ▶ Hereda reglas recomendadas del plugin
          },
          { files: ["**/*.{js,mjs,cjs}"], languageOptions: { globals: {...globals.browser, ...globals.node} } },
        ]);
			```
	- **Opción 3**
		- What do you want to lint? *JavaScript, json, jsonc, json5, md, css*
		- How would you like to use ESLint? *To check syntax and find problems* 
		- What Type of modules does your project use? *JavaScript modules (import/export)*
		- which framework does your project use? *None of these*
		- Does your project use TypeScript? *no*
		- Where does your code run? *Browser and Node* 
		- What flavor of Markdown do you want to lint? *gfm* (CommonMark/GitHub Flavored Markdown)
		- Package.json
  		- DevDependencies
    		- @eslint/js
    		- globals
    		- eslint
    		- @eslint/css
    		- @eslint/json
    		- @eslint/markdown
		- eslint.config.js 
			```javascript
          import js from "@eslint/js";
          import globals from "globals";
          import json from "@eslint/json";
          import markdown from "@eslint/markdown";
          import css from "@eslint/css";
          import { defineConfig } from "eslint/config";


          export default defineConfig([
            { files: ["**/*.{js,mjs,cjs}"], plugins: { js }, extends: ["js/recommended"] },
            { files: ["**/*.{js,mjs,cjs}"], languageOptions: { globals: {...globals.browser, ...globals.node} } },
            { files: ["**/*.json"],         plugins: { json },     language: "json/json",    extends: ["json/recommended"] },
            { files: ["**/*.jsonc"],        plugins: { json },     language: "json/jsonc",   extends: ["json/recommended"] },
            { files: ["**/*.json5"],        plugins: { json },     language: "json/json5",   extends: ["json/recommended"] },
            { files: ["**/*.md"],           plugins: { markdown }, language: "markdown/gfm", extends: ["markdown/recommended"] },
            { files: ["**/*.css"],          plugins: { css },      language: "css/css",      extends: ["css/recommended"] },
          ]);
			```
	- **Opción 4**
		- What do you want to lint? *JavaScript, json, jsonc, json5, md, css*
		- How would you like to use ESLint? *To check syntax and find problems* 
		- What Type of modules does your project use? *JavaScript modules (import/export)*
		- which framework does your project use? *None of these*
		- Does your project use TypeScript? *no*
		- Where does your code run? *Browser and Node* 
		- What flavor of Markdown do you want to lint? *CommonMark* (CommonMark/GitHub Flavored Markdown)
  		- Se cambia a *CommonMark*
		- Package.json
  		- DevDependencies
    		- @eslint/js
    		- globals
    		- eslint
    		- @eslint/css
    		- @eslint/json
    		- @eslint/markdown
		- eslint.config.js 
			```javascript
          import js from "@eslint/js";
          import globals from "globals";
          import json from "@eslint/json";
          import markdown from "@eslint/markdown";
          import css from "@eslint/css";
          import { defineConfig } from "eslint/config";


          export default defineConfig([
            { files: ["**/*.{js,mjs,cjs}"], plugins: { js }, extends: ["js/recommended"] },
            { files: ["**/*.{js,mjs,cjs}"], languageOptions: { globals: {...globals.browser, ...globals.node} } },
            { files: ["**/*.json"],         plugins: { json },     language: "json/json",    extends: ["json/recommended"] },
            { files: ["**/*.jsonc"],        plugins: { json },     language: "json/jsonc",   extends: ["json/recommended"] },
            { files: ["**/*.json5"],        plugins: { json },     language: "json/json5",   extends: ["json/recommended"] },
            //{ files: ["**/*.md"],           plugins: { markdown }, language: "markdown/gfm", extends: ["markdown/recommended"] },
            { files: ["**/*.md"],           plugins: { markdown }, language: "markdown/commonmark", extends: ["markdown/recommended"] },
            { files: ["**/*.css"],          plugins: { css },      language: "css/css",      extends: ["css/recommended"] },
          ]);
			```
	- **Opción 5**
		- What do you want to lint? *JavaScript, css*
		- How would you like to use ESLint? *To check syntax and find problems* 
		- What Type of modules does your project use? *JavaScript modules (import/export)*
		- which framework does your project use? *None of these*
		- Does your project use TypeScript? *yes*
		- Where does your code run? *Browser and Node* 
		- What flavor of Markdown do you want to lint? *gfm* (CommonMark/GitHub Flavored Markdown)
		- Package.json
  		- DevDependencies
    		- @eslint/js
    		- globals
    		- eslint
    		- @eslint/css
    		- neostandard
    		- typescript-eslint
		- eslint.config.js 
			```javascript
          // github.com/eslint/eslint/discussions/19257#discussioncomment-13035062
          // usa recomended rules, neostandar, css, desabilita regla de esltin/js pero la tiene activa en neostandard.
          import js from "@eslint/js";
          import globals from "globals";
          import css from "@eslint/css";
          import { defineConfig } from "eslint/config";
          import neostandard from "neostandard";
          import eslintConfigPrettier from "eslint-config-prettier/flat";

          const RULES = {
            OFF: "off",
            WARN: "warn",
            ERROR: "error",
          };

          export default defineConfig([
            {
              files: ["**/*.{js,mjs,cjs,ts}"],
              plugins: { js },
              languageOptions: { globals: { ...globals.browser, ...globals.node } },
              extends: ["js/recommended", neostandard(), eslintConfigPrettier],
              rules: {
                "@/no-unused-vars": RULES.WARN,
              },
            },

            {
              files: ["**/*.css"],
              plugins: { css },
              language: "css/css",
              extends: ["css/recommended"],
              rules: {
                "css/no-empty-blocks": RULES.WARN,
              },
            },
          ]);
			```

