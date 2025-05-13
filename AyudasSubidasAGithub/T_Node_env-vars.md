- **Variables de Entorno.**
    - **dotenv**
      - **Forma 1**
        - env.ts
          ```js
            import dotenv from "dotenv";
					  import * as env from "env-var";

					  const envFound = dotenv.config();

					  if (envFound.error) {
					    throw new Error(`Coundn´t find .env file!!`);
					  }
          ```

        - **Forma 2**
          - ./src/app/config/load-env-vars.ts
            ```js
              import { config } from "dotenv";
              config();
            ```
          - ./src/app/config/config.ts
            ```js
              export const config = {
                server: {
                    port: process.env.PORT || 3000,
                },
              };
            ```
          - **Invocación**
            - <code>import "./app/config/load-env-vars";</code>

          - **Uso**
            ```js
              import { config } from "./config/config";
              const port = config.server.port
            ```

    - **Validadores**
      - **env-var**
        - **instalación**
          - <code>pnpm i env-var</code>

        - **uso**
          - Seguir "Forma 1" del "dotenv"
          - **Agregar**
            ```js
              import dotenv from "dotenv";
              import * as env from "env-var";

              const envFound = dotenv.config();

              if (envFound.error) {
                throw new Error(`Coundn´t find .env file!!`);
              }
              const port: number = env.get("PORT").required().asPortNumber();
              const mongo_url: string = env.get("MONGO_URL").required().asString();
              const mongo_url_db: string = env.get("MONGO_DB_NAME").required().asString();

              export const envs = {
                port,
                mongo_url,
                mongo_url_db
              };

            ```
          - **Validador email**:
              ```js
                export class Validators {
                  static get email() {
                    return /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
                  }
                }
              ```

          - **invocar**
            - <code>import { envs } from "./config";</code>

          - **Usar**
            - <code>dbName: envs.mongo_url_db</code>


        - **Convict**
            - [Tutorial Node.js | Como usar variables de entorno | Convict](https://www.youtube.com/watch?v=gbxVxYAOVv4)
                - **instalación**
                    - <code>pnpm i Convict</code>

                - **uso**
                    - PENDIENTE HASTA QUE LO USE.

  - **Generar claves**
    - [Node.js Full Course for Beginners | Complete All-in-One Tutorial | 7 Hours](https://www.youtube.com/watch?v=f2EqECiTBL8&t=12228s)
      - Abrir una sesión de nodejs ejecutando
        - <code>node</code>
      - Ejecutar el comando
        - <code>require('crypto').randomBytes(64).toString('hex')</code>
      - Salir
        - CRTL + C dos veces.
