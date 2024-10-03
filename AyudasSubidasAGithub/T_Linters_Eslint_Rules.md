- Eslint V9
  - ESLint 9 Flat config tutorial
    - https://dev.to/aolyang/eslint-9-flat-config-tutorial-2bm5

      - Crear un archivo de configuración, se recomienda eslint.config.mjs para usar ESM module.

          ```js
            export default [
              // your config here
            ]
          ```
      - En ESLint 9, el analizador (parser) y el DSL soportan actualizadiones al languageOptions, esto es más claro.

          ```js
            ...
          ```

      - Configurando globales para los entornos de ejecución.

          ```js
            import glogals from "globals"
            export default [
                {
                    languageOptions: {
                        globals: {
                            ...globals.browser,
                            ...globals.node
                        }
                    }
                }
            ]
          ```

      - Agregar configuraciones preestablecidas

          ```js
            import jsLint from "@eslint/js"
            import tsLint from "typescript-eslint"
            import vueLint from "eslint-plugin-vue"

            export default [
                jsLint.configs.recommended,
                ...tsLint.configs.recommended,
                ...vueLint.configs["flat/essential"],
            ]
          ```
      - Arreglar configuraciones viejas y cambiar algunas reglas.

          ```js
            import { fixupConfigRules } from "@eslint/compat"

            // Step 1: Import your rule
            import pluginReactConfig from "eslint-plugin-react/configs/recommended.js"

            // // Step 3 (optional): Export fixed rule
            export default [
                // Step 2: Create backwards-compatible rule
                ...fixupConfigRules(pluginReactConfig),
                {
                  rules: {
                      "react/react-in-jsx-scope": "off"
                  }
                }
            ]
          ```
      - Agregar plugins de terceros
        - Usar palabra clave "plugin"
        - revisar las propiedades del objeto "plugin"

          ```js
            import pluginSimpleImportSort from  "eslint-plugin-simple-import-sort"

            export default [
                {
                    plugins: {
                        // key "simple-import-sort" is the plugin             namespace
                        "simple-import-sort": pluginSimpleImportSort
                    },
                    rules: {
                        "simple-import-sort/imports": [
                            "error",
                            { groups: [ "..." ] }
                        ]
                    }
                }
            ]
          ```


      - Usar "stylistic" para manejar formato de estilo de código sin sintaxis.

          ```js
            import stylistic from "@stylistic/eslint-plugin"

            export default [
                // disable legacy conflict rules about code style
                stylistic.configs["disable-legacy"],
                // you can customize or use a preset
                stylistic.configs.customize({
                    indent: 4,
                    quotes: "double",
                    semi: false,
                    commaDangle: "never",

                    jsx: true
                })
            ]
          ```


      -

          ```js
            d
          ```


      -

          ```js
            d
          ```


      -

          ```js
            d
          ```


      -

          ```js
            d
          ```


      -

          ```js
            d
          ```





- Eslint V. 9.7.6
    - No permitir retornos "Any"
        - https://stackoverflow.com/questions/77840308/why-doesnt-eslint-complain-about-implicit-any-returned-from-function-call#answer-77843223

        - https://typescript-eslint.io/getting-started/typed-linting/
            - Linting with Type Information
                - Add TypeChecked to the name of any preset configs you're using, namely recommended, strict, and stylistic.
                - Add languageOptions.parserOptions to tell our parser how to find the TSConfig for each source file.

            ```js
              import tsParser from "@typescript-eslint/parser";
              export default [
                ...tseslint.configs.recommendedTypeChecked,
                {
                  files: ["**/*.ts", "**/*.tsx"],
                  languageOptions: {
                    ecmaVersion: "latest",
                    sourceType: "module", // The type of JavaScript source code. "script" for traditional script              files, "module" for ECMAScript modules (ESM), and "commonjs" for CommonJS files. (default:              "module" for .js and .mjs files; "commonjs" for .cjs files)
                    globals: {
                      ...globals.browser,
                      ...globals.node,
                    },
                    parser: tsParser, //An object containing a parse() method or a parseForESLint() method.               (default: espree)
                    // parserOptions: {
                    //   project: "tsconfig.json", //lo mismo.
                    // }, //An object specifying additional options that are passed directly to the parse() or              parseForESLint() method on the parser. The available options are parser-dependent.
                    parserOptions: {
                      project: true,
                      tsconfigRootDir: import.meta.dirname,
                    },
                  },
                  rules: {},
                },
              ]
            ```
