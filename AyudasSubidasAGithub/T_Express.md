- express.urlencoded

  - [¿Qué podemos hacer con el express.urlencoded?](https://keepcoding.io/blog/que-podemos-hacer-con-el-express-urlencoded/)

    - Actúa como middelware al procesar los datos enviados desde el cliente al servidor a través de formularios HTML o solicitudes POST.
    - Se encarga de analizar los datos enviados en el cuerpo (body) de una solicitud y convertirlos en un formato utilizable
    - Utilización

      ```javascript
      import express from "express";
      const app = express();
      // Configuración de express.urlencoded como middleware
      app.use(express.urlencoded({ extended: false }));

      // extended: false --> para indicar que solo se analizarán datos simples, no objetos complejos
      // extended: true --> para indicar que también se analizarán objetos anidados
      ```

    - Observaciones

      - Si no se lo pone, por ejemplo en la ruta que recibe el **post** al tratar de hacer un <code>console.log(req.body);</code> me indicará que es **undefined**

    - TODO
      - Ver como se lo hace sin esa utilidad.

- Variables globales (express global variables)

  - [How to Create Global Variables Accessible in all Views using Express/NodeJS ?](https://www.geeksforgeeks.org/how-to-create-global-variables-accessible-in-all-views-using-express-nodejs/)
    - Indice
      - Using app.locals
      - Utilizing res.locals
      - Implementing Custom Middleware
  - [Flatz](https://www.youtube.com/watch?v=qJ5R9WTW0_E)
    - En minuto 1.58.00
    - En minuto 3.22.45

- Seguridad

  - Express desabilitar header
    - Cuando se usa <code>app.use(cors())</code> este agrega de manera automática un header 'x-powered-by' por lo que por seguridad para no informar que usamos express hay que dabilitarlo con <code>app.disable('x-powered-by')</code>

- cors

  - https://github.com/midudev/curso-node-js/blob/main/clase-4/middlewares/cors.js

    - Crear un archivo **middlewares/cors.js**

      ```javascript
      import cors from "cors";
      const ACCEPTED_ORIGINS = [
        "http://localhost:8080",
        "http://localhost:1234",
        "https://movies.com",
        "https://midu.dev",
      ];
      export const corsMiddleware = ({
        acceptedOrigins = ACCEPTED_ORIGINS,
      } = {}) =>
        cors({
          origin: (origin, callback) => {
            if (acceptedOrigins.includes(origin)) {
              return callback(null, true);
            }
            if (!origin) {
              return callback(null, true);
            }
            return callback(new Error("Not allowed by     CORS"));
          },
        });
      ```

    - Agregar **middlewares/cors.js** en **index.js**

      ```javascript
      import { corsMiddleware } from "./middlewares/cors.js";

      app.use(corsMiddleware())``;
      app.disable("x-powered-by"); // deshabilitar el header X-Powered-By: Express
      ```
