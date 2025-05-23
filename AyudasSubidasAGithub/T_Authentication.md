- Formas de implementar autenticación

  - JSON Web Tokens (JWT)
  - Sessions
  -

- CSRF

  - Read about CSRF: https://owasp.org/www-community/attacks/csrf

- JWT

  - ByteGyteGo: Why is JWT popular?

    - https://www.youtube.com/watch?v=P2CPd9ynFLg

      - Content
      - 1.- {"what" : "json"}
      - 2.- JWT Structure
      - 3.- Working?
      - 4.- Sinning Alg
      - 5.- Attack Scenario

      - 1.- {"what" : "json"}

        - JSON Web Tokens let your identity travel the web securely.
        - But like losing your passpord, a stolen JWT gives hackers full access.
        - In this video, we'll unlock the immense potential of JWTs, and the dangers lurking withing.
        - JWT are a robust method for secureley transmitting information between parties as JSON objets.
        - JSON is a lightweight data interchange format that´s easy to read and write for humans and simple for machines to parse and generate.
        - Claims

          - They are stored inside the payload (carga útil) of a JWT
          - Claims are statements about an entity, whici is typically the user with some additional data.
          - Types

            - Public
            - Registered
            - Private

          - Registered Claims
            - They are predefined, like the issuer, expiration time, and subject.

        - Signing these tokens

          - Signing is like sealing an envelope with a wax stamp to ensure it hasn´t been tampered with.

          - Signing algorithms Types
            - Symmetric algorithms: HMAC SHA256
              - Use a shared secret key for both signing and verification.
            - Asymmetric algorithms: RSA
              - Use a pubic/private key pair where the private key signs the token and the public key verifies it.
          - Signed JWT provide

            - Authentication
            - Authorizacion
            - Information Exchange

          - Login

            - User send login request
            - Server creates a signed JWT with user details and send it back (Validate credentials)
            - Client uses this to access protected resources by sending the token in the HTTP header.

              1.  User Login / username, password
              2.  Server Validate credentias
              3.  Server Create & sign JWT with secret
                  Send Authorization: Bearer JWT
              4.  User Store JWT locally
              5.  User request /resource/user
                  Authorization: Bearer JWT
              6.  Server Validate signature
                  OK
                  return data.

        - When do not use JWT

          - The payload (carga útil) is not encrypted by default so should not contain highly sensitive data.
          - JWTs aren´t ideal for managing user sessions since they are stateless. Revoking JWT access can be challenging.
          - Some common vulnerabilities to be aware of include token hijacking, where an attacker steals a valid JWT to impersonate a user.
          - JWT´s also could be vulnerable to cryptographic weaknesses if using weak hashing algorithms. Automated brute force attacks may try to crack token signatures.

        - Mitigate risks when using JWT
          - Keeping JWT payloads (carga útil) with only the necessary user claims;
          - Using short token expiration times when possible
          - Storing tokens securely and invalidating any leaked tokens.
          - Using strong signature algorithms

  - Midudev: Aprende Autenticación de Usuario, Sesión, Cookies y JWT con Node.js

    - https://www.youtube.com/watch?v=UqnnhAZxRac&t=13s

      - Contenido
        - Instalación del proyecto
        - Usuarios en base de datos
      - Registro de usuarios
      - Autenticación básica con login y password
      - Verificación de autenticación - Usando hashes y salts
      - Sesión de usuario con cookie
      - Rutas protegidas
      - Json Web Tokens
      - Refactorizar con un middleware
      - Cerrar sesión
      - Refresh token
      - Más adelante: Passport y Outh 2.0

      - Instalación del proyecto

        - pnpm init
        - package.json
          - type: module
          - script: "dev": "node --watch index.js"
          - Ejecutar: pnpm run dev / pnpm dev / node --run dev
        - crear index.js
        - pnpm add express
        - Slint
          - pnpm add -D standard
          - "eslintConfig": {
            "extends": "standard"
            }
        - Variables

          - Crear un "config.js"
            export const {
            PORT = 3000
            } = process.env

          - En el index.js
            import { PORT } from "./config.js"

        - Para End points usaremos Yaak.
          - https://yaak.app/download

      - Usuarios en base de datos

        - Conceptos

          - ORM (Object Relational Mapper)

            - Un ORM es la capa entre la base de datos y su aplicación. Usándolo gran parte del trabajo de un CRUD viene hecho.
            - En un ORM se trabaja con objetos como su mayor punto de referencia. Cuando se trabaja con objetos en nuestras aplicaciones, trabajamos con un único objeto que almacena todas las propiedades del objeto y relaciones (Pese a que la data es almacenada en valores individuales a través de varias tablas en una DB).

            - Tipos de implementación de ORMs

              - Data mapper pattern
              - Active Record pattern

            - Data mapper pattern vs Active Record pattern

              - https://en.wikipedia.org/wiki/Data_mapper_pattern
              - What's the difference between Active Record and Data Mapper?
                - https://culttt.com/2014/06/18/whats-difference-active-record-data-mapper
              - How We Code: ORMs and Anemic Domain Models by Chris Fidao.

            - Active Record pattern

              - Es el más popular (Laravel lo usa)
              - Uso

                - Crea un nuevo objeto "User"
                  - $user = new User();
                - Asigna valores a propiedades del objeto "User"
                  - $user->username = "philipbrown";
                - Mapea el objeto "User" a una fila de la tabla "users"
                  - $user->save();

              - Características

                - El objeto "User" no tiene que tener especificado las propiedades y como estas se relacionan con la base de datos. Esto lo hace automáticamente "Active Record stype ORMs", el modelo es capaz de determinar las propiedades del modelo automáticamente solo con mirar el schema de la base de datos.

              - Ventajas
                - Se puede tan solo llamar al método save() del objeto para actualizar la DB. Cada model object hereda del objeto base Active Record y de esa forma tiene acceso a todos los métodos de persistencia.
                - Le hace que sea muy fácil para iniciar por ser muy intuitivo.

            - Data mapper pattern

              - La gran diferencia con Active Record es que separa completamente su "dominio" de la "capa de persistencia", esto significa que ninguno de los objetos sabe nada sobre la DB.

              - Uso

                - Crea un nuevo objeto "User"
                  - $user = new User();
                - Asigna valores a propiedades del objeto "User"

                  - $user->username = "philipbrown";

                - NO tiene ningún conocimiento sobre la base de datos, esto es no se puede llamar al método "save()" en el objeto para persistirlo en la DB por que no existe.

                - Usar un servicio completamente diferente conocido como "Entity Manager"
                  - EntityManager::persist($user);

              - Ventajas
                - Sus objetos del dominio NO necesitan saber nada sobre como están almacenados en la DB.
                - Sus objetos serán más livianos porque no tendrán que heredar el ORM completo.
                - Habrá que ser más estricto y tener un proceso más formal para interactuar con la DB porque no se puede llamar simplemente al método "save()" en ninguna parte de su código.

            - Diferencias entre Data mapper pattern vs Active Record pattern

              - El tipo de aplicación a ser construída.

                - Hay dos tipos

                  - Aplicaciones basadas en CRUD
                  - Aplicaciones basadas en Dominio (Domain).

                - Aplicaciones basadas en CRUD

                  - Código mapea limpiamente a la DB
                  - Typicamente para CRUD
                  - Se pueden tener relaciones entre los modelos, pero la mayor parte, no hay reglas estrictas alrededor de esas relaciones que deban ser reforzadas.
                  - Ideal para "Active Record"

                - Aplicaciones basadas en Dominio (Domain).
                  - Enfocada en satisfacer las reglas y procedimientos del negocio.
                  - Permite reforzar ciertas restricciones hacer cumplir ciertas restricciones en el manejo de datos y la persistencia
                  - Ideal para "Data mapper"

              - Aplicación y entorno en que se está construyendo

                - "Active Record"

                  - Minimum viable product

                - "Data mapper"
                  - Negocio existente para crear una nueva aplicación a partir de un sistema heredado.
                  - Una empresa existente ya tendrá reglas y procedimientos sobre cómo funciona su negocio. Al utilizar el patrón Active Record, terminará intentando forzar que esas reglas comerciales funcionen bien con la "mentalidad de base de datos" de Active Record. El patrón Data Mapper te permitirá encapsular las reglas de dominio del negocio para que trabajar con la aplicación sea claro e intuitivo.

        - Validaciones

          - Usar zod

        - Usaremos base de datos en memoria.
          - pnpm install db-local
        - Crear user-repository.js
          - importar db-local
          - crear clase UserRepository y crear métodos estáticos.
            import DBLocal from 'db-local'
            export class UserRepository{
            static create ({username, password}){}
            static login ({username, password}){}
            }
          - Crear un Schema
            const { Schema } = new DBLocal({ path: './db/'})
            const User = Schema('user', {
            \_id: {type: String, required: true},
            username: {type: String, required: true},
            password: {type: String, required: true},
            })

      - Sesión de usuario con cookie

        - Cookies

          - Las cookies no van a desaparecer, tan solo las third party cookies (analíticas, publicidad, traqueo, etc), las del propie dominio no pasa nada.
          - Menos vulnerables a ataques XSS
          - no se pueden leer desde java script
          - Colocar la vandera de la cookie httpOnly
          - Poner tiempo de expiración
          - Se pueden configurar envío solo por https
            - Evitar man in the middle
          - Se puede hacer que la cookie solo se envíe a domineos que son del tuyo propio.
          - Se envía
          - Uso:

            - pnpm install cookie-parser
            - import cookieParser from "cookie-parser"
            - app.use(cookieParser())
            - res
              .cookie("access_token", token, {
              httpOnly:true, // la coodie solo se puede acceder en el servidor.
              secure: process.env.NODE_ENV === "production", // la coodie solo se puede acceder en https
              sameSite: "strict", //la cookie sole se puede acceder en el mismo dominio
              maxAge: 1000*60*60 //la cookie tiene un timepo de validez de 1 hora.
              })
            - Agregar un middleware
              app.use((req, res, next) =>{
              const token = req.cookies.access_token
              //let data = null
              req.session = {user: null}
              try{
              const data = jwt.verify(token, SECRET_JWT_KEY)
              req.session.user = data
              } catch { }
              next()
              })
              app.get("/",(req,res) => {
              /\*
              const token = req.cookies.access_token
              if(!token) return res.render("index")

                  try{
                  	const data = jwt.verify(token, SECRET_JWT_KEY)
                  	res.render("index", data)
                  } catch(error) { res.render("index")}
                  next()
                  */
                  const {user} = req.session
                  res.render("index", user)

              })

            - cerrar session
              res
              .clearCokkie("access_token")
              .json({message: "Logout successful"})

        - Session y Locage storage
          - Son suceptibles a ataque "enviar solicitud desde navegador del usuario, sin que el usuario se entere" se hace mucho en css, se llama CSRF "Cross Site Request forgery"
          - Son accesibles de java script
          -

  - https://www.youtube.com/watch?v=8RiDRdHPcxA&list=PL4cUxeGkcC9iqqESP8335DA5cRFp8loyp&index=8
  - Debuger
    - https://jwt.io/
  - Partes

    - Header
      - Le dice al servidor que tipo de firma está siendo usada (meta)
    - Payload (carga útil)
      - Usado para identificar el usuario (ejem: contiene user id)
    - Signature
      - Hace el token seguro (like a stampo of authenticity / como un sello de autenticidad)

  - Ciclo Vida JWT

    - 🔐Ciclo de vida de JWT | SEGURIDAD INFORMÁTICA🛡️

      - https://www.youtube.com/watch?v=capnr5ULxGQ

        - Ciclo vida jwt

          - Creación
          - Trasmisión
          - Validación
          - Uso de Claims
          - Actualización
          - Expiración

        - Explicación: Ciclo vida jwt
          - Creación
            - Usuario "inicia Sesión" en Cliente
            - FrontEnd (Cliente) hace "petición de token"
            - Servidor "Genera JWT"
            - Usuario "Recibe jwt" del cliente.
          - Trasmisión
            - Usuario "Envía solicitud con JWT" dentro de la cabecera
            - Cliente "Envía solicitud con JWT"
            - Servidor "Procesa solicitud con JWT"
            - Usuario "Recibe una respuesta" desde el cliente.
          - Validación
            - Usuario "Envía solicitud con JWT" a través del cliente directamente al servidor.
            - Servidor "Valida firma y expiración"
            - Usuario "Respuesta con validación exitosa" desde servidor.
          - Uso de Claims
            - Servidor "utiliza información de claims" enviada con anterioridad
              - Claims vienen en el "payload" / carga útil
            - Usuario "realiza acción autorizada" desde servidor.
          - Actualización
            - Usuario "inicia sesión nuevamente" al cliente
            - Cliente "Petición de nuevo token"
            - Servidor "Genera nuevo JWT"
            - Usuario "Recibe nuevo JWT" del cliente.
          - Expiración
            - Servidor "Verifica fecha de expiración"
            - Servidor "JWT ha expirado"
            - Usuario "Respuesta de expiración de JWT" desde servidor.

  - Autenticación JWT

    - ¿Cómo se autentica un servidor en otro? Server-To-Server Auth con JWT y RSA

      - https://www.youtube.com/watch?v=0NiyW9XINRA

        - curl -H "Authorization: token <>" https://api.github.com/user/repos
        - RSA (25.24)

          - Clave público privada
          - Criptografía asimétrica

            - En servidor se guardan "claves públicas de los clientes
            - En clientes se guardan "claves privadas"
            - Clientes firmaran un JWT con sus "claves privadas" al llegar al servidor podremos validar las firmas utilizando sus "claves públicas"
            - Si te hakean la "clave pública" no sirve de nada ya que solo se usan para validar "claves privadas" que las almacenan los clientes. Es decir deberían hakear a un servidor cliente y sacarle la "privada" solo podrían hacerse pasar por ese cliente y no por todos como pasaría en JWT auto firmado.

              - Generar claves privada-pública
                - s s h-k e y g e n -t rsa -b 4096 -m PEM -f jwtRS256.key
                  - Genera dos archivos .key que es la privada y un . pub que es la pública.
              - Sobre escribir la pública generada al mismo formato de la .key

                - o p e n s s l r s a -in <la key> -pubout -outform PEM -out <la key pub>

              - javascript
                const privateKey = await fs.readFile('la key', 'utf-8')

                const token = jwt.sign({}, privateKey, {algorithm: 'RS256'})

                const response = await axios.get('htp://localhost:8000/api/rsa/repos', {
                headers: {
                Authorization: `token ${token}`
                }
                })

                res.json(response.data)

  - [DOMINICODE: ¿Access token, RefreshToken? - API NodeJS #8](https://www.youtube.com/watch?v=pM5T5RbUDzo&t=186s)
    - Access Token (6.21)
      - Contiene toda la información que necesita el servidor para saber si el usuario/dipositivo que nos hace la petición es quien dice ser. Por ejemplo saber si es un admin o no lo es.
      - Tienen un período de valiz corto
    - Refresh Token (7.01)
      - Es utilizado para generar un nuevo access token, por ejemplo si nuestros usurios hacen login y reciben el access token normalmente como tienen una validez puede ser que el token caduque, si pasa esto, el procedimiento será que el usuario tendrá que volver a loguearse en la aplicación, con el refresh token evitamos este paso. El back end devolverá un nuevo access token al usuario.

103 k suscriptores

- pnpm add -g typeorm
- pnpm list -g

- npx typeorm init --name MyProject --database postgres
- typeorm init --name test_uno --database mysql --express

- Quitar
  - body-parser
  - typescript
- Instalar
  - dependencies
    pnpm add cors jsonwebtoken bcryptjs class-validator
  - devDependencies
    pnpm add -D ts-node-dev typescript @types/bcryptjs @types/cors @types/jsonwebtoken @types/express @types/node

mysql://avnadmin:AVNS_o8DhGOB553w2LUHkdwU@mysql-node-bgva2005-5985.h.aivencloud.com:26885/defaultdb?ssl-mode=REQUIRED

mysql://avnadmin:AVNS_o8DhGOB553w2LUHkdwU@mysql-node-bgva2005-5985.h.aivencloud.com:26885/defaultdb?ssl-mode=REQUIRED

defaultdb

code: 'ER_NOT_SUPPORTED_AUTH_MODE',
errno: 1251,
sqlMessage: 'Client does not support authentication protocol requested by server; consider upgrading MySQL client',
sqlState: '08004',
fatal: true

connect to Aiven for Mysql with nodejs

- Formas de implementar autenticación
  - JSON Web Tokens (JWT)
  - Sessions
  -

🤣🤣🤣🤣 de verdad? que animal, gracias por decírmelo voy a borrar y volverlo a poner.

- Envío de emails

  - pnpm install nodemailer
  - En Google
    - Ir a google: google.com
    - Presionar en "Cuenta de Google"
    - Seleccionar "Gestionar tu cuenta de Google"
    - Seleccionar "Seguridad"
    - En "Cómo inicias sesión en Google" seleccionar "Verificación en dos pasos"
    - Poner teléfono
    - Volver a "Seguridad"
    - Tus conexiones con aplicaciones y servicios de terceros
    - myaccount.google.com/apppasswords
    - Nombre de la aplicación: AdminApi
      - Crear
    - Tu contraseña de aplicación para el dispositivo
      - lbwa nrce axoy apjt

- mailer.ts
  import nodemailer = requiere("nodemailer");

  const transporter = nodemailer.createTransport({
  host: "smtp.gmail.com",
  port: 465,
  secure: true, // Use `true` for port 465, `false` for all other ports
  auth: {
  user: "byron.valdivieso2020@gmail.com",
  pass: "lbwa nrce axoy apjt",
  },
  });

  transporter.verify().then(() => {
  console.log("Ready for send emails.");
  });

- AuthController.ts
  import config from "./../config/mailer";

  class AuthController {
  static forgotPassword = async(req: Request, res: Response) => {
  ....
  try{
  const info = await transporter.sendMail({
  from: '"Forgot password 👻" <maddison53@ethereal.email>', // sender address
  to: user.username // list of receivers
  subject: "Forgot password ✔", // Subject line
  text: "Hello you have forgoten your password?", // plain text body
  html: `	<b>Please click on the following link, or paste this into your browser to complete the process:</b>
<a href="${verificationLink}">${verificationLink}</a>`
  "", // html body
  });
  console.log("Message sent: %s", info.messageId);
  } catch(error){
  emailStatus = error;
  return res.status(400).json({ message: 'Something goes wrong!' });
  }

                      }

  }

- Stack tecnológico

  - servidor en nodejs
  - express
  - typescript
  - typeORM
  - mysql
  - jwt
  - roles: Admin, reader
  - Thunder Client (api tester)
  - Extensión REST client
    - Para probar APIS.
    - crear archivo api.http
    - Ejemplo
      - ### para recuperar x cosas.
        GET http://localhost:1234/movies

- pasos

  - pnpm i typeorm -g
  - typeorm init --name login_roles --database mysql --express
  - Actualizar dependencias a última versión
  - Añadir/Quitar dependencias

    - Quitar
      - body-parser
      - typescript
    - Instalar

      - dependencies
        pnpm add cors jsonwebtoken bcryptjs class-validator dotenv helmet nodemailer - bcryptjs: Encriptar el password - class-validator: Validaciones campos de la base de datos. - cors: Aceptar todas las peticiones hechas desde un front end - jsonwebtoken: Para crear y leer JWT

      - devDependencies
        pnpm add -D ts-node-dev typescript @types/bcryptjs @types/cors @types/jsonwebtoken @types/express @types/node - Tipos para typescript - @types/bcryptjs: - @types/cors: - @types/express: - @types/jsonwebtoken: - ts-node-dev: Reiniciar servidor

  - tsconfig.json

    - "outDir": "./dist",
    - "rootDir": "./src",

  - update package.json

    - crear scripts
      - "tsc": "tsc",
      - "dev": "ts-node-dev --respawn --transpile-only ./src/index.ts"

  - DataBase

    - Configuración

      - Agregar archivo ".env" a raíz proyecto.
        DB_DATABASE_URL= "xxxx"
        DB_DATABASE_PORT = 3306
        DB_DATABASE_USERNAME= "xxxx"
        DB_DATABASE_PASSWORD= "xxxx"
        DB_DATABASE_NAME= "xxxx"
      - Agregar paquete "dotenv"

        - pnpm add dotenv

      - data-source.ts
        - Importar variables entorno a "data-source.ts"
          - const dotenv = require("dotenv");
        - dotenv.config();
        - host: process.env.DB_DATABASE_URL,

    - Crear

      - mysql -uroot -p
      - show databases;
      - create database login_node;
      - use login_node;

    - Error

      - sqlMessage: 'Client does not support authentication protocol requested by server; consider upgrading MySQL client',

        - SOLUCIÓN
          - ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '123456';

      - Type 'string' has no properties in common with type 'FindOneOptions<User>'
        - ## SOLUCIÓN

    -Testear - pnpm dev - http://localhost:3000/users

    - Seguridad
      - Deshabilitar el header X-Powered-By: Express
        - app.disable("x-powered-by");

  - Encriptar password

    - pnpm i bcript
    - import \* as bcrypt from "bcryptjs";
    - Crear funciones para encriptar y comparar
      hashPassword(): void {
      const salt = bcrypt.genSaltSync(parseInt(process.env.PASS_SALT, 10));
      this.password = bcrypt.hashSync(this.password, salt);
      }

      checkPassword(password: string): boolean {
      return bcrypt.compareSync(password, this.password);
      }

    - Actualizar UserController.newUser
      - user.hashPassword();
    - Actualizar authController.Login

      if (!user.checkPassword(password)) {
      return res
      .status(400)
      .json({ message: "Username or Password are incorrect!" });
      }

  - Agregar JWT

    - Crear carpeta middlewares
    - Agregar jwt.ts
    - Crear la función checkJwt como middleware
    - Error: Cannot set headers after they are sent to the client
      - hay un res.send(user); luego de un res.json()

  - Class-Validate

    - Controlar lo que devuelve.
      - const errors = await validate(user);
        - Devuelve
          - un array con un ValidationError que tiene un target que a su vez tiene x ejemplo el password.
          - un value
      - Corregir:
        - const validationOpt = { validationError: { target: false, value: false } };
          const errors = await validate(user, validationOpt);

  - Usuario Cambiar contraseña

  - Conceptos

    - REST API (otra SOAT)

      - Representetional State Transfert
      - Arquitectura de software
      - Nace en año 2000 - Roy Fielding
      - Principios
        - Escabilidad
        - Simplicidad
        - Visibilidad
        - Portabilidad
        - Fiabilidad
        - Modificabilidad (fácil de modificar)
      - Fundamentos
        - Resources
          - Todo es considerado un recurso
          - Cada recurso se va a identificar con una URL
            - Ejemp: Todos los recursos que sean MOVIES se identifican con /movies
        - Verbos HTTP
          - Para definir las operaciones que se pueden realizar con los recursos.
        - Representaciones
          - JSON, XML, HTML, etc
          - El cliente debería poder dicidir la representación del recurso.
          - Ejemp: Podría en en parámetros que me indique si quiere que me devuelva JSON u otro.
        - Staleless
          - El cliente debe enviar toda la información necesaria para procesar la request.
          - Servidor NO guarda información para responder al cliente (osea para saber como debe hacerlo). Todo debe estar incluído en el URL.
        - Interfaz uniforme
        - Separación de conceptos
          - Permite que cliente y servidor evolucionen de forma separada.

    - path-to-regexp

      - "/movies/:id/:mas/:otro"
      - const {id, mas, otro}
      - express usa path-to redexp al igual que react router
      - convierte el path directamente a expresiones regulares
      - "/ab+cd/" -> abcd, abd ...
      - "/ab(cd)e/" -> abe, abce ...
      - "dev$" -> que termine en dev.

    - POST VS PATCH VS PUT

      - Idempotencia
        - Propiedad de realizar una acción determinada varias veces y aún así conseguir siempre el mismo resultado que se obtendría al hacerlo una vez.
        - Funciones puras son idempotentes.
      - POST
        - Propósito: Crear un nuevo elemento/recurso en el servidor.
        - /movies
        - NO es idempotente
      - PUT
        - Propósito: Actualizar totalmente un elemento/recurso ya existente o crearlo si no existe.
        - /movies/123
        - SI es idempotente el resultado siempre será el mismo. pero depende, por si tiene un updateAt.
      - PATCH
        - Propósito: Actualizar parcialmente un elemento/recurso.
        - /movies/123
        - SI es idempotente en principio, pero depende, por si tiene un updateAt.

    - Validaciones
      - Zod, superStruct, io, yup, ....
      - Typescript NO sirve para tiempo de run time.
      - ZOD
        - pnpm i zod
        - Crear carpeta schemas
        - Crear carpeta movies
        - const z = require("zod")
        - Crear esquema
          - const movieSchema = z.object({
            title: z.string({
            invalid_type_error: "Movie title must be a string",
            required_error: "Movie title is required"
            }),
            year: z.number().int().min(1900).max(2024).positive(),
            poster: z.string().url({invalid_type_error: "Movie title must be a string",}),
            genre: z.array(
            z.enum(["","",""],{opciones de error})
            )
            })
        - Crear funciones
          - functio validateMovie(object) {
            return movieSchema.parse(object)
            // MEJOR
            return movieSchema.safeParse(object)
            // retorna un objeto resolve que te va a decir si hay un error o datos.
            }
            module.exports = {validateMovie}
        - Usar el servicio de validación
          - app.post("/movies", () => {
            const result = validateMovie(req.body)
            if(result.error){retornar error}
            const newMovie = {
            id: crypto.randomUUID(),
            ...result.data
            }
            movies.push(newMovie)
            })

  - CORS

    - Cross origin resource sharing (error de uso compartido de recursos entre dominios)
    - BackEnd responde sin headers
    - No hay una cabecera que diga que el dominio solicitante localhost:8000 puede solicitar al dominio orignen localhost:3000
    - Solución

      - Se lo hace en la parte el backend ya sea en la api, proxy, enrutador, en lo que sea que tengas que pueda añadir esa cabecera.
      - Todos los orígenes son permitidos.

        - res.header("Access-Control-Allow-Origin", "\*")

      - Un origen específico.
        - res.header("Access-Control-Allow-Origin", "http://localhost:8000")
      - Detectar el origen y ver que es lo que se hace.

        - const ACCEPTED_ORIGINS = [
          "http://localhost:8000",
          "http://localhost:8001"
          ]

        - app.get("", () => {
          const origin = req.headers("origin")

              ver si está en lista de orígenes aceptados.

              if(ACCEPTED_ORIGINS.includes(origin) || !origin) {....}

          })

        - No siempre solicitante envía el origen.

          - Cuando
            - Si la petición es del mismo origen.
              - http://localhost:1234 -> http://localhost:1234

        - CORS PRE-Flight

          - método normales: GET/HEAD/POST
          - Métodos complejos: PUT/PATCH/DELETE
            - Generan el CORS PRE-Flight
            - Requiere una petición especial que se llama OPTIONS
            - lo que va a hacer es preguntarle a la API utilizando el verbo OPTIONS y ve si tiene la cabecera CORS
          - SOLUCIÓN

            - Agregar en el API un

              - app.options("/movies/:id", (req, res) => {
                const origin = req.header("origin")

                    if(ACCEPTED_ORIGINS.includes(origin) || !origin) {
                    	res.header("Access-Control-Allow-Origin", origin)
                    	res.header("Access-Control-Allow-Methods", "GET, POST, PUT, PATCH, DELETE")
                    }

                    res.send(200)

                })

            - app.use(cors({
              origin: (origin, callback) => {
              const ACCEPTED_ORIGINS = [
              "http://localhost:8000",
              "http://localhost:8001"
              ]
              }

              if(ACCEPTED_ORIGINS.includes(origin) || !origin) { return callback(null, true)}

              if(!origin) { return callback(null, true)}

              return callback(new Error("Not allowed by CORS"))
              }))

    - **Explicación de CORS**

      - [Oleks Gorpynich: CORS Finally Explained — Simply](https://levelup.gitconnected.com/cors-finally-explained-simply-ae42b52a70a3)

        - **ERROR**: Access to fetch at "https...." from origin "http://localhost:3000" has been blocket by **CORS** policy: No "Access-Control-Allow-Origin" header is present on the requested resource. If an opaque response serves your needs, set the request´s mode to "no-cors" to fetch the resource with **CORS** disabled

        ¿Ha visto lo anterior antes? Probablemente... y probablemente bastante...

        Hay millones de artículos que explican cómo solucionar el error anterior, pero ¿qué es exactamente este "intercambio de recursos de origen cruzado" (**CORS**) y por qué existe?

        ¿Por qué?

        Empecemos por responder la pregunta de por qué a través de un escenario y cómo se desarrollaría en diferentes momentos.

        Imagine esto: inicia sesión en **bank.com**, que es su servicio bancario. Después de iniciar sesión, se almacena una "cookie de sesión" en su navegador. (Las cookies de sesión básicamente le dicen al servidor detrás de **bank.com** que su navegador ahora está conectado a su cuenta). Todas las futuras solicitudes a **bank.com** ahora contendrán esta cookie, y puede responder correctamente sabiendo que ha iniciado sesión.

        Bien, entonces ahora decide revisar su buzón de correo. Ve un correo electrónico sospechoso y, por supuesto, decide hacer clic en el enlace que lo envía a **attack.com**. A continuación, este sitio web envía una solicitud a **bank.com** para obtener sus datos bancarios. Tenga en cuenta que **bank.com** sigue pensando que ha iniciado sesión debido a esa cookie de sesión... esa cookie se almacena en su navegador. Para los servidores detrás de **bank.com**, parece que usted solicitó sus datos bancarios normalmente, por lo que los envía de vuelta. Ahora **attack.com** tiene acceso a ellos y los almacena en otro lugar de forma maliciosa.

        La gente se dio cuenta de que esto era malo, por lo que los navegadores adoptaron una **SOP** (Política del mismo origen) según la cual, si su navegador detecta que está intentando realizar solicitudes a **bank.com** desde cualquier otro lugar que no sea **bank.com**, se bloquearán. Ahora bien, esto es algo clave que hay que tener en cuenta: se trata de una política basada en el navegador. **bank.com** realmente no tiene forma de saber de dónde proviene una solicitud, por lo que no puede proteger mucho contra ataques como **CSRF**. El navegador que está utilizando interviene y básicamente dice que si parece que está intentando solicitar detalles de un origen (esquema + nombre de dominio + puerto, https//foo.com:4000, http//bar.org:3000, etc... Básicamente la URL), solo enviará esas solicitudes para los mismos orígenes.

        Ahora bien, esto era genial y todo eso, pero era increíblemente limitante. Quiero decir, las API públicas no funcionarían en absoluto. No podría solicitarles datos a menos que utilice algún tipo de solución proxy.

        **CSRF**

        El problema es que los servidores pueden saber de dónde proviene una solicitud. Existe el encabezado **“Origin”**, que deben tener las solicitudes, que muestra el origen de la solicitud. Por ejemplo, en el ejemplo anterior, la solicitud se vería así:

        ```bash
          Request to -----> bank.com
          {
            Headers: { Origin: http://attack.com }
          }
        ```

        En teoría, **bank.com** debería comprobar esto para asegurarse de que solo responde a solicitudes cuyo origen tenga sentido. Y normalmente lo hace, por lo que el procedimiento operativo estándar parece algo limitante.
        Aquí es donde entra en juego el CORS.

        **CORS**

        Cuando una aplicación web de **example.com** intenta solicitar recursos de **bank.com**, el navegador incluye automáticamente un encabezado Origin en la solicitud, indicando de dónde proviene la solicitud (**example.com**). Esta es la parte crucial: en lugar de bloquear directamente dichas solicitudes de origen cruzado según el **SOP**, el servidor de **bank.com** puede inspeccionar este encabezado Origin y decidir si permite o rechaza la solicitud según su propia política **CORS**.

        Si **bank.com** considera que **example.com** es confiable o el recurso solicitado está destinado a ser de acceso público, puede responder con encabezados **CORS** específicos, como **Access-Control-Allow-Origin**, indicando qué orígenes tienen permiso para acceder al recurso. Este encabezado puede configurarse como **http://example.com**, lo que permite explícitamente este origen, o **\*** para recursos públicos a los que cualquier origen puede acceder.

        Por supuesto, el navegador facilita todo esto. Si algo es incorrecto, obtendrá ese desagradable error.

        Ahora bien... ¿qué sucede si la solicitud no tiene el encabezado **Origin**? ¿Qué sucede si tiene muchos otros encabezados y no utiliza uno de los métodos HTTP básicos?

        En estas situaciones, el manejo de **CORS** se vuelve un poco más complejo, ya que ya no es una "solicitud simple". Aquí es donde entra en juego el concepto de **"preflight (solicitudes previas)"** en **CORS**.

        **preflight (solicitudes previas)**

        Para ciertos tipos de solicitudes que podrían modificar potencialmente los datos en el servidor (aquellas que usan métodos **HTTP como PUT, DELETE** o usan encabezados que no se incluyen automáticamente en cada solicitud), los navegadores primero enviarán una solicitud de "verificación previa" **preflight** antes de realizar la solicitud real. Esta solicitud de verificación previa es una solicitud **HTTP OPTIONS** y su propósito es verificar con el servidor si es seguro enviar la solicitud real.

        La solicitud de verificación previa **preflight** incluye encabezados que describen el método **HTTP** y los **encabezados de la solicitud real**. Esto es lo que sucede a continuación:

        1.- **Respuesta del servidor**: si el servidor admite la política **CORS** y la solicitud real, responde a la solicitud de verificación previa con encabezados que indican qué métodos y encabezados están permitidos. Esto puede incluir encabezados como **Access-Control-Allow-Methods** y **Access-Control-Allow-Headers**.

        2.- **Decisión del navegador**: según la respuesta del servidor a la solicitud de verificación previa, el navegador decide si continuar con la solicitud real. Si la respuesta del servidor indica que la solicitud está permitida, el navegador la envía; De lo contrario, el navegador bloquea la solicitud y verás un error relacionado con **CORS**.

        **Conclusion**

        Ahora, con suerte, entiendes un poco más sobre **CORS**. Creo que lo más importante que debes entender es que todo esto es una política del navegador y tu servidor debe estar codificado para cumplirla. Está ahí para mantenerte seguro. Si usas Chrome, no deberías preocuparte tanto por hacer clic en los enlaces incorrectos (por supuesto, aún deberías preocuparte un poco :D). Sin embargo, esta no es una política infalible. Si usas un navegador de terceros que no cumple con los estándares, todo esto se echaría a perder. ¡Es por eso que uno debe tener cuidado con el software que usa!
