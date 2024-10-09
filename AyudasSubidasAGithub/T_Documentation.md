- JSDOC

  - [JSDoc, Documentación en Javascript | Curso Práctico](https://www.youtube.com/watch?v=r0H-acWQS6c)

    - Documentación
      - [npm](https://www.npmjs.com/package/jsdoc)
      - [jsdoc](https://jsdoc.app/)
      - [github](https://github.com/jsdoc/jsdoc/tree/main)
    - Instalación
      - pnpm i -D jsdoc
    - configuration file

      - [jsdoc.json](https://jsdoc.app/about-configuring-jsdoc)
        - Si no se lo crea, tendrá el siguiente configuración por defecto.

      ```json
      {}
      ```

    - Ejecutar
      - npx jsdoc -c jsdoc.json
      - Script en package.json
        ```json
        {
          "script": {
            "jsdoc": "jsdoc -c jsdoc.json"
          }
        }
        ```
      - Generará una carpeta con toda la documentación.
