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

  - csurf (cors) **deprecado**
    - (A_TODO) Alternativa y recomendación de usar **Bearer**
      - [Secure alternative to csurf npm package](https://security.stackexchange.com/questions/271190/secure-alternative-to-csurf-npm-package#answers-header)
    - (A_TODO) tried to implement manually with two simple examples by using Synchronizer Token Pattern and Double Submit Cookie techniques.
      - [CSRF Prevention on Node.js Express without csurf](https://medium.com/@brakdemir/csrf-prevention-on-node-js-express-without-csurf-da5d9e6272ad)

- Unir los **chunks** en express
  - formas
    - [Express JS— body-parser and why may not need it](https://medium.com/@mmajdanski/express-body-parser-and-why-may-not-need-it-335803cd048c)
  
    ```javascript
      app.use(express.json()); //Used to parse JSON bodies
      // app.use(bodyParser.urlencoded({extended: true}));
    ```

  - [Parsing JSON in Express without BodyParser](https://stackoverflow.com/questions/34915179/parsing-json-in-express-without-bodyparser#answer-34915723)
    ```javascript
      app.use(function(req, res, next){
        var data = "";
        req.on('data', function(chunk){ data += chunk})
        req.on('end', function(){
            // console.log(data);
            req.rawBody = data;
            req.jsonBody = JSON.parse(data);
            next();
        })
      })
      // And you need catch the error when parse the string to json and need to judge the Content-type of the Req.
    ```

    otra forma 

    ```javascript
      app.use("/", (req, res, next)=>{
      
          const body = [];
          req.on("data", (chunk) => {
              console.log(chunk);
              body.push(chunk);
          });
          req.on("end", () => {
              const parsedBody = Buffer.concat(body).toString();
              const message = parsedBody.split('=')[1];
              console.log(parsedBody);
              console.log(message);
          });
          console.log(body);
      });
    ```
- Invocar un  **HTML** desde express
  - [How to handle form data in Express ?](https://www.geeksforgeeks.org/how-to-handle-form-data-in-express/)

    ```html
      // HTML
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>Handle Form Data</title>
          <link rel="stylesheet" href="style.css" />
        </head>

        <body>
          <h1>Handle Form Data</h1>
          <form action="/submit" method="post">
            <label for="name">Name:</label>
            <input
              type="text"
              id="name"
              name="name"
              value="John Doe"
              placeholder="Enter Your Name"
              required
            />
            <br />
            <label for="email">Email:</label>
            <input
              type="email"
              id="email"
              name="email"
              value="john@yahoo.com"
              placeholder="Enter Your Email"
              required
            />
            <br />
            <button type="submit">Submit</button>
          </form>
        </body>
      </html>
    ```

    ```javascript
      // index.js
      import express from 'express';
      import bodyParser from 'body-parser';
      import path from 'path';
      import { fileURLToPath } from 'url';
      const __filename = fileURLToPath(import.meta.url);
      const __dirname = path.dirname(__filename);

      const app = express();
      const PORT = 3000;

      // Use body-parser middleware
      app.use(bodyParser.urlencoded({ extended: true }));
      app.use(express.static('public'));


      // HTML form
      app.get('/', (req, res) => {
          res.sendFile(__dirname + '/index.html');
      });

      // To Handle form submission
      app.post('/submit', (req, res) => {
          const data = req.body;
          console.log(data);
          res.send(`<h1 style="text-align: center; 
          margin-top: 50vh; transform: translateY(-50%);">
          Form submitted successfully!</h1>`);
      });

      // Server Listen to this PORT
      app.listen(PORT, () => {
          console.log(`Server is running on http://localhost:${PORT}`);
      });
    ```
