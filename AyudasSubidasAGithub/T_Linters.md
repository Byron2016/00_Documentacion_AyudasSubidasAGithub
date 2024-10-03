- MonoRepo

  - Tips para automatizar
    - https://dev.to/vinomanick/create-a-monorepo-using-pnpm-workspace-1ebn
  - enolcasielles

    - https://github.com/enolcasielles/monorepo
    - https://dev.to/enolcasielles/construyendo-un-monorepo-en-typescript-utilizando-pnpm-2144

  - Basem Emara
    - https://medium.com/hike-medical/ditching-yarn-creating-a-monorepo-with-pnpm-workspaces-6fa7e3bfe19c
      - (muy bueno paso por paso pero eslintrc)

- Prettier

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
