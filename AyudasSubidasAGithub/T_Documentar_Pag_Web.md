- **Documentar APIs**

  - [Leonardo Jose: Aprende a Documentar tu API Node.js con Swagger Autogen y Swagger UI Express 🚀](https://www.youtube.com/watch?v=3EMLqQ6ny80)

    - **Nodejs**

      - **Instalar paquetes**

        - <code>npm install swagger-ui-express</code>
        - <code>npm install -D swagger-autogen</code>

      - **Configurando a Swagger Autogen**

        - <code>touch swagger.js</code>

          ```js
          import swaggerAutogen from "swagger--autogen";
          // Destino
          const outputFile = "./swagger.json";
          const endPointsFiles = ["./app.js"];
          const doc = {
            info: {
              title: "API de Adpción de mascotas",
              description: "Esta API permite gestionar mascotas y usuarios ",
            },
            host: "localhost:5100",
            schema: ["http"],
          };
          swaggerAutogen()(outputFile, endPointsFiles, doc);
          ```

      - **Generación de documentación**

        - <code>node swagger.js</code> // despliega mensaje Success.

      - **Usando a Swagger UI Express**

        - En **App.js** luego de <code>const app = express();</code>

          ```js
            // App.js
            ....
            const app = express();
            import swaggerUI from "swagger-ui-express";
            import swaggerDocumentation from "./swagger.json" assert {type: "json"};
            app.use("/doc", swaggerUI.serve, swaggerUI.setup(swaggerDocumentation));
          ```

        - **Ejecutando**
          - <code>node app.js</code>
          - <code>localhost:5100/doc/</code>
