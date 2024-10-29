- ## Acciones
- Pasos

  - init
    - git init
    - pnpm init
  - Crear un ".editorconfig"
  - Crear un ".gitignore"
  - Linters

    - Prettier
      - pnpm i -D prettier
      - Crear un ".prettierignore"
      - Crear un "prettier.config.js"
    - Eslint

      - instalación

        - pnpm create @eslint/config

          - instalará: eslint@9.x, globals, @eslint/js, typescript-eslint

            - OJO: Pero "typescript-eslint" tiene una peer dependency con eslint 8.57.0
            - hay que reeinstalar "typescript-eslint" con

              - pnpm i -D typescript-eslint@8.0.0-alpha.44

        - Sin el anterior
          - pnpm i -D eslint globals @eslint/js typescript-eslint@8.0.0-alpha.44

      - Crear un ".eslintignore"
      - Crear un ".eslintrc"

      - eslint-plugin-prettier

        - pnpm i -D eslint-plugin-prettier

        - Runs Prettier as an ESLint rule and reports differences as individual ESLint issues.

        - Requiere:

          - Eslint
          - eslint-config-prettier
          - prettier

        - agréguelo como último elemento de la matriz de configuración en su archivo eslint.config.js para que eslint-config-prettier tenga la oportunidad de anular otras configuraciones:

      - eslint-config-prettier

        - pnpm i -D eslint-config-prettier

      - eslint-plugin-simple-import-sort

        - NO USAR si se usan otros "sorting rules" al mismo tiempo.

          - sort-imports
          - import/order

        - pnpm i -D eslint-plugin-simple-import-sort

      - eslint-plugin-unicorn

        - pnpm i -D eslint-plugin-unicorn

      - eslint-plugin-vitest

        - pnpm i -D eslint-plugin-vitest

        - Ojo se instala sola
          - install

      - eslint-plugin-node (YA NO USARLO)

        - pnpm i -D eslint-plugin-node

        - YA NO USARLO, EN SU LUGAR "eslint-plugin-n"

      - eslint-plugin-n

        - pnpm i -D eslint-plugin-n

        - YA NO USARLO, EN SU LUGAR "eslint-plugin-n"

        - package.json
          ```json
          {
            "type":"commonjs",
            {
              "engines": {
                 "node": "^18.18.0"
              }
            }
          }
          ```

      - pnpm i -D eslint globals @eslint/js typescript-eslint@8.0.0-alpha.434eslint-plugin-prettier eslint-plugin-simple-import-sort eslint-plugin-unicorn eslint-plugin-vitest eslint-config-prettier eslint-plugin-prettier eslint-plugin-n

  - test

    - nock

      - pnpm i -D nock

      - HTTP server mocking and expectations library for Node.js

    - nyc

      - pnpm i -D nyc

      - HTTP server mocking and expectations library for Node.js

  - Paquetes extras

    - dependencies

      - express
      - dotenv
      - http-status-codes

      - pnpm i express dotenv http-status-codes

    - devDependencies

      - typescript

        - pnpm i -D typescript

      - rimraf

        - pnpm i -D rimraf

        - The UNIX command rm -rf for node in a cross-platform implementation.

      - concurrently

        - pnpm i -D concurrently

      - tsconfig-paths

        - pnpm i -D tsconfig-paths

        - Usado en el script del package.json

          - "dev": "tsnd -r tsconfig-paths/register --inspect=0.0.0.0:9229 --respawn src/main.ts",

          - Use this to load modules whose location is specified in the paths section of tsconfig.json or jsconfig.json. Both loading at run-time and via API are supported.

      - fs-extra

        - pnpm i -D fs-extra

        - fs-extra adds file system methods that aren't included in the native fs module and adds promise support to the fs methods. It also uses graceful-fs to prevent EMFILE errors. It should be a drop in replacement for fs.

      - Para pruebas

        - ts-node-dev
          - pnpm i -D ts-node-dev

      - swc

        - @swc/cli

          - pnpm i -D @swc/cli

          - A command line interface for swc.

        - @swc/core

          - pnpm i -D @swc/core

          - SWC (stands for Speedy Web Compiler) is a super-fast TypeScript / JavaScript compiler written in Rust. It's a library for Rust and JavaScript at the same time.

          - scripts
            - "generate-dist": "swc ./src -d dist --strip-leading-paths",

        - unplugin-swc

          - pnpm i -D unplugin-swc

          - SWC plugin for Vite and Rollup.

          - Uso
            - En la configuración de vitest.config.ts

      - Tipos

        - @types/express

          - This package contains type definitions for express (http://expressjs.com).

        - @types/fs-extra

          - This package contains type definitions for fs-extra (https://github.com/jprichardson/node-fs-extra).

        - @types/supertest

          - This package contains type definitions for supertest (https://github.com/visionmedia/supertest)

        - @types/eslint\_\_js

          - This package contains type definitions for @eslint/js

        - pnpm i -D @types/express @types/fs-extra @types/supertest @types/eslint\_\_js

- Template de Alberto Fernandez

  - https://github.com/AlbertHernandez/express-typescript-service-template

        - editorconfig
            - Mirar **T_EditorConfig.md**

        - gitignore
            - .gitignore
                node_modules/
                dist/
                .tmp
                .idea
                .env
                coverage/
                .npm
                .vscode
                .nyc_output
                k6-results


        - Entorno
            - .env
                PORT=3000

            - .env.test
                NODE_ENV=test
                PORT=0

            - .env.example
                PORT=3000

    - npm

      - .npmignore

        - https://dev.to/franqsanz/como-funciona-npmignore-jhf

          - Quieres un paquete para publicar en npm
          - Preguntas

            - ¿Cómo hago para ignorar X archivo para que no se publique en npm?
            - ¿Con .gitignore es suficiente?
            - ¿Cuándo debo usar un .npmignore?

          - Con .gitignore si puedes ignorar archivos, pero a veces no quieres ignorar X archivo y ahí es donde entra .npmignore.

            - Ejemplo: Desarrollaste un paquete y a su vez un sitio web para su documentación. Si deseas tener todo en un mismo proyecto, es ahí donde es necesario un .npmignore porque no vas a publicar todos los archivos de la web en npm, solo el paquete.

          - Validar si tu paquete ignorará los archivos que están en .npmignore

            - npm pack
              - éste comando generará un tarball localmente que sería exactamente lo mismo que hace npm al publicarlo.

          - Se lo ubica en el directorio raíz.

        - .npmignore
          node_modules/
          dist/
          .tmp
          .idea
          .env
          coverage/
          .npm
          .vscode

      - .npmrc

        - https://medium.com/@pmmanav/what-is-a-npmrc-file-e7bd40bff3f0

          - Es un archivo de configuración usado por npm
          - Permite personalizar varios settings relativos al comportamiento de npm en el manejo de paquetes y dependencias.
          - Se lo ubica en el directorio raíz.

          - Configuraciones:

            - Registry Configuration: Especificar el registry donde npm podrá hacer un fetch de paquetes.

              - Por ejemplo podría querer usar un registry privado o mirror del registry por defecto.

            - Scoped Package Configuration: Si usa "scoped packages" (paquetes con nombres que empiezan con @scope/), puede poner opciones de configuración específicos para esos paquetes.

            - Authentication: Puede usarlo para guardar tokens de autentificación o credenciales para registros privados o servicios.

            - Proxy Configuration: Si se encuentra detrás de un proxy corporativo, puede configurar npm para trabajar através del proxy, poniendo las opciones relativas al proxy en este archivo.

            - Cache Control: Controlar como npm cachea paquetes a través de configuraciones específicas para el cache de los paquetes.

            - Global vs. Local Configuration: Se puede tener diferentes archivos .npmrc para configuraciones globales y locales.

              - Configuraciones globales son aplicadas a todos los proyectos de su sistema.
              - Configuraicones locales son específicas para el directorio del proyecto.

            - Package Installation Behavior:
              - Se puede configurar npm para guardar paquetes como dependencias "dependencies" o "devDependencies" por defecto cuando se ejecuta "npm install".
              - También controlar cuando npm automáticamente guarda paquetes en el archivo "package.json".

          - Consideraciones

            - Algunas opciones en el .npmrc pueden ser sobreescritas por argumentos en línea de comandos. Ver documentación.

            - Información sensible
              - .npmrc es amenudo almacenado en sistemas de control de versión junto con su código. Por tal motivo se debe considerar el uso de variables de entorno u otros métodos seguros para manejar información sensible.

          - Ejemplo
            registry=https://registry.npmjs.org/
            loglevel=warn
            save-exact=true

            - En este ejemplo:
              - Se coloca el registro por defecto al registro de npm público.
              - El nivel de log a "warm"
              - Configura npm para guardar la versión exacta del paquete.

        - .npmrc
          engine-strict=true

    - nvm / fnm

      - .nvmrc

        - https://www.freecodecamp.org/news/fnm-fast-node-manager/

          - --version-file-strategy=recursive: Esta bandera y el valor recursivo de esta le dice a fnm que use la versión específica de node de los archivos ".node-version(or .nvmrc)" ....

        - .nvmrc
          20.9

    - Linters

      - Prettier

        - .prettierignore
          dist/
          coverage/
          node_modules/
          tsconfig.json
          tsconfig.prod.json

        - prettier.config.js

          ```javascript
          module.exports = {
            printWidth: 80,
            tabWidth: 2,
            useTabs: false,
            semi: true,
            singleQuote: false,
            trailingComma: "all",
            bracketSpacing: true,
            arrowParens: "avoid",
          };
          ```

        - Eslint

          - .eslintrc

          ```json
          {
            "root": true,
            "parser": "@typescript-eslint/parser",
            "parserOptions": {
              "project": "tsconfig.json",
              "sourceType": "module",
              "ecmaVersion": 2022
            },
            "plugins": ["@typescript-eslint", "simple-import-sort"],
            "extends": [
              "eslint:recommended",
              "plugin:@typescript-eslint/recommended",
              "plugin:@typescript-eslint/recommended-type-checked",
              "plugin:prettier/recommended",
              "plugin:unicorn/recommended",
              "plugin:node/recommended"
            ],
            "rules": {
              "simple-import-sort/imports": "error",
              "simple-import-sort/exports": "error",
              "unicorn/prefer-module": "off",
              "unicorn/prefer-top-level-await": "off",
              "unicorn/prevent-abbreviations": "off",
              "no-console": "warn",
              "node/no-missing-import": "off",
              "node/no-unsupported-features/es-syntax": [
                "error",
                { "ignores": ["modules"] }
              ],
              "node/no-unpublished-import": "off",
              "no-process-exit": "off"
            },
            "overrides": [
              {
                "files": ["*.ts"],
                "rules": {
                  "simple-import-sort/imports": [
                    "error",
                    {
                      "groups": [
                        [
                          "^(assert|buffer|child_process|cluster|console|constants|crypto|dgram|dns|domain|events|fs|http|https|module|net|os|path|punycode|querystring|readline|repl|stream|string_decoder|sys|timers|tls|tty|url|util|vm|zlib|freelist|v8|process|async_hooks|http2|perf_hooks)(/.*|$)"
                        ],
                        [
                          "^node:.*\\u0000$",
                          "^@?\\w.*\\u0000$",
                          "^[^.].*\\u0000$",
                          "^\\..*\\u0000$"
                        ],
                        ["^\\u0000"],
                        ["^node:"],
                        ["^@?\\w"],
                        ["^@/tests(/.*|$)"],
                        ["^@/src(/.*|$)"],
                        ["^@/app(/.*|$)"],
                        ["^@/shared(/.*|$)"],
                        ["^@/contexts(/.*|$)"],
                        ["^"],
                        ["^\\."]
                      ]
                    }
                  ]
                }
              },
              {
                "files": ["scripts/**"],
                "rules": {
                  "no-console": "off"
                }
              },
              {
                "files": ["tests/**"],
                "plugins": ["vitest"],
                "extends": ["plugin:vitest/recommended"],
                "rules": {
                  "@typescript-eslint/unbound-method": "off",
                  "vitest/expect-expect": "off",
                  "vitest/no-standalone-expect": "off"
                }
              },
              {
                "files": ["tests/performance/**"],
                "rules": {
                  "unicorn/numeric-separators-style": "off",
                  "unicorn/no-anonymous-default-export": "off",
                  "@typescript-eslint/no-unsafe-call": "off",
                  "@typescript-eslint/no-unsafe-assignment": "off",
                  "@typescript-eslint/no-unsafe-member-access": "off",
                  "no-undef": "off"
                }
              }
            ],
            "env": {
              "node": true
            }
          }
          ```

          - .eslintignore
            dist/
            node_modules/
            coverage/

          - commitlint

            - https://commitlint.js.org/

              - Ayuda al equipo a seguirlas convenciones de commits.

              - Template de "commitlint.config.ts"

                - https://commitlint.js.org/reference/configuration.html

              - Instalación (https://commitlint.js.org/guides/getting-started.html)

                - npm
                  - npm install --save-dev @commitlint/{cli,config-conventional}
                - pnpm

                  - pnpm add --save-dev @commitlint/{cli,config-conventional}

                - Tipos

                  - npm
                    - npm install -D @commitlint/types
                  - pnpm
                    - pnpm add -D @commitlint/types

                - Para Typescript

                  - https://commitlint.js.org/reference/configuration.html#typescript-configuration

                - Paquetes
                  - @commitlint/cli
                  - @commitlint/config-conventional

            - commitlint.config.ts
              import type { UserConfig } from "@commitlint/types";

              const config: UserConfig = {
              extends: ["@commitlint/config-conventional"],
              };

              export default config;

          - Yamllint

            - https://yamllint.readthedocs.io/en/stable/
            - Validador

              - https://www.yamllint.com/

            -
            - Es una herramienta linter versátil diseñada específicamente para archivos YAML .
            - Comprueba si hay discrepancias de formato, problemas de pares clave-valor y errores de sintaxis, lo que garantiza que sus archivos YAML sean sintácticamente correctos y cumplan con las mejores prácticas.

            - .yamllint.yml

              ```YAML
                    ---

                    extends: default

                    ignore: |
                      node_modules/

                    rules:
                    line-length:
                        ignore: |
                          /.github/actions/**/*.yml
                          /.github/workflows/*.yml
                          /.github/settings.yml
                          /docker-compose.yml
                    truthy:
                        ignore: |
                          /.github/workflows/*.yml
              ```

            - - lint-staged.config.js

                ```javascript
                const config = {
                  "**/*.ts?(x)": () => "tsc -p tsconfig.prod.json --noEmit",
                  "*.{js,jsx,ts,tsx}": ["npm run lint", "vitest related --run"],
                  "*.{md,json}": "prettier --write",
                  "*": "npm run typos",
                };

                module.exports = config;
                ```

    - Docker (pendiente)

      - Dockerfile (pendiente)
      - Docker-compose.yml (pendiente)
      - .dockerignore

        ```
          *
          !/package.json
          !/package-lock.json
          !/tsconfig.prod.json
          !/tsconfig.json
          !/.swcrc
          !/src
        ```

    - Vite (pendiente)

      - Vite
      - ViteTest

        - create-vitest-test-config.ts (pendiente)
        - vitest.config.e2e.ts
        - vitest.config.ts
        - vitest.config.unit.ts

        - scripts

          ```json
          {
            "scripts": {
              "test:unit": "vitest run --coverage --config vitest.config.unit.ts",
              "test:e2e": "vitest run --coverage --config ./vitest.config.e2e.ts"
            }
          }
          ```

    - Typescript

      - tsconfig.json

        ```json
        {
          "compilerOptions": {
            "baseUrl": ".",
            "module": "commonjs",
            "target": "es2022",
            "esModuleInterop": true,
            "strict": true,
            "outDir": "dist",
            "sourceMap": true,
            "inlineSources": true,
            "skipLibCheck": true,
            "resolveJsonModule": true,
            "paths": {
              "@/src/*": ["src/*"],
              "@/app/*": ["src/app/*"],
              "@/contexts/*": ["src/contexts/*"],
              "@/shared/*": ["src/contexts/shared/*"],
              "@/tests/*": ["tests/*"]
            },
            "types": ["vitest/globals"]
          },
          "exclude": ["node_modules", "dist"]
        }
        ```

      - tsconfig.prod.json

        ```json
        {
          "extends": "./tsconfig.json",
          "include": ["src"]
        }
        ```

    - nyc (Istanbul)

      - https://www.npmjs.com/package/nyc

        - Instrumenta su código javaScript ES5 and ES2015+ con líneas contadas, así pude rastrear que tan bien sus test unitarios (unit-test) JavaScript code with line counters, así puede rastrear qué tan bien sus pruebas unitarias recorren su código base.

        - Instalación

          - npm i -D nyc

        - Uso
          - scripts
            - Instalando nyc
              ```json
              {
                "scripts": {
                  "test": "mocha",
                  "coverage": "nyc npm run test"
                }
              }
              ```
            - Con npx
              ```json
              {
                "scripts": {
                  "test": "npx nyc@latest mocha"
                }
              }
              ```

      - nyc.config.js (OJO: CommonJS export / pero hay para otros)

        ```javascript
        const MIN_COVERAGE = 80;

        const config = {
          all: true,
          "check-coverage": false,
          branches: MIN_COVERAGE,
          lines: MIN_COVERAGE,
          functions: MIN_COVERAGE,
          statements: MIN_COVERAGE,
          reporter: ["lcov", "json", "text"],
        };

        module.exports = config;
        ```

    - SWC

      - swcrc

        - https://swc.rs/docs/configuration/swcrc

          - La compilación funciona de inmediato con SWC y no requiere personalización. Opcionalmente, puede sobre escribir la configuración.

          - .swcrc
            ```json
            {
              "$schema": "https://json.schemastore.org/swcrc",
              "sourceMaps": true,
              "jsc": {
                "parser": {
                  "syntax": "typescript",
                  "decorators": true,
                  "dynamicImport": true
                },
                "baseUrl": "./",
                "paths": {
                  "@/src/*": ["src/*"],
                  "@/app/*": ["src/app/*"],
                  "@/contexts/*": ["src/contexts/*"],
                  "@/shared/*": ["src/contexts/shared/*"],
                  "@/tests/*": ["tests/*"]
                },
                "target": "es2022"
              },
              "module": {
                "type": "commonjs"
              },
              "minify": false
            }
            ```
