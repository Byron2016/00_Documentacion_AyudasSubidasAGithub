- javaScript

  - **Pila de ejecución**

    - [La Cocina del Código: 1. La PILA DE EJECUCIÓN (Call Stack) de JAVASCRIPT | JS en ESPAÑOL](https://www.youtube.com/watch?v=ygA5U7Wgsg8&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB)

      - [Github: leonardomso / 33-js-concepts](https://github.com/leonardomso/33-js-concepts)

      - **Pila de ejecución**
        - Otros nombres: Pila de ejecución, call stack o pila de contextos de ejecución.
      - **Contexto de ejecución (scope)**
        - Son las variables y funciones que se pueden acceder desde esa función cuando se está ejecutando una función.
        - En **firefox** (chrome no lo muestra) podemos ver en el scope local de la función, aparece un objeto particular llamado **arguments**
          - **arguments** no es un array pero es un objeto muy similar a los arrays que tienen casi todas las funciones en su scope local, las array functions o funciones flecha NO lo tienen disponible.
          - Este objeto contiene todos los parámetros que recibe la función cuando fue invocada
          - En la función anónima que engloba todo programa no tenemos **arguments** porque todavía no se llamó a ninguna función pero si tenemos otra cosa, una referencia al **objeto global** que en el caso del navegador es **window** y en el caso de nodejs se llama **global**
          - El conjunto de variables que tiene acceso la función, el contexto (**this**), arguments u objeto global (window o global)
      - **This**
        - **This** es una variable muy especial que tiene la función en el contexto local, hace referencia al objeto que sería como el "_dueño_" de la función
        - El valor que tiene **This** determina el **contexto** de la función.
          - Nota: **contexto** y **Contexto de ejecución (scope)** no es lo mismo.

  - **Tipos de datos**

    - [La Cocina del Código: 2. TIPOS DE DATOS PRIMITIVOS en JAVASCRIPT | JS en ESPAÑOL](https://www.youtube.com/watch?v=cC65D2q5f8I&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB&index=2)

      - **Tipado**

        - **Tipado estático**: Es necesario definir el tipo cuando se asigna un valor.

        - **Tipado dinámico** : javaScript al igual que PHP o Ruby tienen un **tipado dinámico** es decir los tipos se asignan conforme se asigna un valor, pero además javaScript tiene **tipado débil**

        - **tipado débil**: Se puede realizar operaciones entre variables de distintos tipos <code>2 + "4" = "24"</code>, asignar a una variable otro tipo independientemente de lo que ya se asignó antes.

      - **Coerción de tipos**

        - Conversión implícita de tipos que realiza el motor de javaScript para poder concretar una operación. <code>2 + "4" = "24"</code>

      - **Tipo de una variable**

        - Se determina cuando se ejecuta la línea de código que contiene a esa variable y depende de la operación que se esté realizan con ella. <code>2 - "3" = -1</code>

      - **Grupos de tipos de datos en javaScript**

        - **Tipos de datos primitivos**

          - Primitivo quiere decir básico
          - Tienen dos características importantes

            - No poseen ni métodos ni propiedades
            - Son inmutables

              ```js
              var texto = "Cocina";
              texto[0] = "B"; // tratamos modificar C x B
              console.log(texto);
              // Cocina
              // La única forma de cambiarlo es asignarle un nuevo valor
              texto = "Bocina";
              ```

          - Listado
            - strings
              - Para representarlos javaScript usa UTF16 lo que nos permite muchos alfabetos e incluso emogis
            - number
              - <code>var numero = +(0.1 + 0.2).toFixed(2)</code>
                - <code>Number.MIN_SAFE_INTEGER</code>
                - <code>Number.MAX_SAFE_INTEGER</code>
                - <code>Number.isSafeNumber(900)</code>
              - Rango: <code>-(2 ** 53) + 1 - +(2 ** 53) - 1</code>
              - Más allá de esos límites son aproximaciones.
              - NaN (not a number) es de tipo number y es el resultado de cómputos inválidos.
            - boolean
            - null
            - undefined
            - symbol (ES2015)
            - En javaScript todo valor que no sea uno de los anteriores es un **Objeto**

        - **Objetos**

          - Listado
            - funciones
            - fechas
            - expresiones regulares
            - objeto literal

  - **Herencia por Prototipos**

    - [La Cocina del Código: 17. HERENCIA POR PROTOTIPOS EN JAVASCRIPT](https://www.youtube.com/watch?v=a2tp64Vtzxs&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB&index=11)

      - **¿Q**

    - **jonmircha**

      - [ jonmircha: 22. Prototipos - #jonmircha ](https://www.youtube.com/watch?v=nS5FmAx4u_0)

        - JavaScript es un lenguaje **multi paradigma**, es decir podemos utilizar programación orientada a objetos, funcional, javaScript no maneja los objetos con clases sino que usa **herencia prototípica**, es decir basada en **prototipos**, las clases las convierte a **funciones prototípicas**

        - Un **prototipo** en javaScript es un mecanismo por el cual un objeto puede heredar de un objeto padre atributos y métodos.

        - **Cadena de prototipos**

          ```js
            // Entendiendo con objeto literal (ojo: nombre con a minúscula)
            const animal = {
              nombre: "Snoopy",
              sonar():{
                console.log("Hago sonidos por que estoy vivo")
              }
            }
            const animal2 = {
              nombre: "LolaBoony",
              sonar():{
                console.log("Hago sonidos por que estoy vivo")
              }
            }
            console.log(animal); // Vemos que hay una propiedad __proto__ que apunta al prototipo más elemental que tiene javaScript Object
            console.log(animal2); // tuvimos que copiar y pegar código, esto no es funcional, para eso usamos las clases/funciones prototípicas.
          ```

        - **Generando funciones prototípicas**

          ```js
          // función constructora y a partir de ella generar nuevas instancias. (ojo: nombre con A mayúscula)
          function Animal(nombre, genero) {
            // TIP: tanto atributos como métodos deben colgar de this.
            // atributos
            this.nombre = nombre;
            this.genero = genero;
            // metodos
            this.sonar = function () {
              console.log("Hago sonidos por que estoy vivo");
            };
            this.saludar = function () {
              console.log(`Me llamo ${this.nombre}`);
            };
          }
          // Heredamos
          const snoopy = new Animal("Snoopy", "macho");
          const lolaBunny = new Animal("LolaBoony", "hembra");
          console.log(snoopy);
          console.log(lolaBunny);
          // Ojo, que tengo repetido la función sonar, lo que no es correcto x q me está consumiendo memoria. Lo correcto es enviarle la función al prototipo.
          ```

          - Mejor uso de manera más eficiente.

            ```js
            // función constructora y a partir de ella generar nuevas instancias. (ojo: nombre con A mayúscula)
            function Animal(nombre, genero) {
              // TIP: tanto atributos como métodos deben colgar de this.
              // atributos
              this.nombre = nombre;
              this.genero = genero;
            }
            // sacamos la función sonar al prototipo de Animal.
            Animal.prototype.sonar = function () {
              console.log("Hago sonidos por que estoy vivo");
            };
            Animal.prototype.saludar = function () {
              console.log(`Me llamo ${this.nombre}`);
            };

            // Heredamos
            const snoopy = new Animal("Snoopy", "macho");
            const lolaBunny = new Animal("LolaBoony", "hembra");
            console.log(snoopy);
            console.log(lolaBunny);
            // Ojo, ya no tenemos repetidos los métodos sino que están en el prototipo.
            ```

      - [jonmircha: Curso JavaScript: 23. Herencia Prototípica - #jonmircha ](https://www.youtube.com/watch?v=1-m7xtwvH1E)

        - Mejor uso de manera más eficiente.

          ```js
          // constructor
          function Animal(nombre, genero) {
            this.nombre = nombre;
            this.genero = genero;
          }
          // Asignación de funciones a prototipo de constructor.
          Animal.prototype.sonar = function () {
            console.log("Hago sonidos por que estoy vivo");
          };
          Animal.prototype.saludar = function () {
            console.log(`Me llamo ${this.nombre}`);
          };
          // Herencia prototípica
          function Perro(nombre, genero, tamanio) {
            this.super = Animal; // creamos una variable que cuelga del this de la función y le asignamos el prototipo de cual estamos heredando.
            this.super(nombre, genero);
            this.tamanio = tamanio;
          }
          // asignar al prototipo de perro que sea una instancia de Animal.
          Perro.prototype = new Animal(); // no especifíco los parámetros x q lo hago en el constructor de perro.
          Perro.prototype.constructor = Perro;
          // Sobre escritura.
          Perro.prototype.sonar = function () {
            console.log("soy un perro y mi sonido es un ladrido ");
          };
          // Nuevo método
          Perro.prototype.ladrar = function () {
            console.log("wouu wauuu");
          };

          const snoopy = new Perro("Snoopy", "macho", "mediano");
          const lolaBunny = new Animal("LolaBoony", "hembra");
          console.log(snoopy);
          snoopy.sonar();
          snoopy.saludar();
          snoopy.ladrar();
          ```

    - [Carlos Azaustre - Aprende JavaScript: JavaScript ¿Qué es la HERENCIA de PROTOTIPOS?](https://www.youtube.com/watch?v=h_n_UIOycgM)

      - **¿Qué es? y ¿Cómo funciona?**

        - Es un mecanismo de javaScript, que permite a los objtetos, heredar propiedades y métodos de otros objetos.
        - No utiliza clases, en javaScript ESC2015 se añade clases pero como **azúcar sintáctica** a la final todo el código es transformado a **herencia prototípica**
        - Cada objeto en javaScript tiene una propiedad interna conocida como **prototype** y es una referencia a otro objeto al cual se lo conoce como el **prototipo del objeto**
        - Orden de búsqueda de propiedades y métodos en javaScript

          - Busca primero en el propio objeto
          - Busca en su **cadena de prototipos** hasta que encuentra la propiedad o alcanza el final de la cadena en donde su prototipo es **null**

      - **Su aplicación en situaciones reales**

        - **Ejemplo 1**

          ```js
          // vehiculo funcionará como clase y recibe argumento marca
          function Vehiculo(marca) {
            this.marca = marca;
          }
          // añadimos una función a este prototipo
          Vehiculo.prototype.informacion = function () {
            return `Marca del vehículo: ${this.marca}`;
          };
          // crearemos otro objeto
          function Coche(marca, modelo) {
            // como marca es una propiedad de Vehiculo y queremos que Coche herede de Vehiculo
            Vehiculo.call(this, marca); // this es la referencia del objeto
            this.modelo = modelo;
          }
          // Ahora para unir todo esto
          Coche.prototype = Object.create(Vehiculo.prototype);
          // El método constructor
          Coche.prototype.constructor = Coche;
          // Añadimos una función a Coche
          Coche.prototype.mostrarModelo = function () {
            return `Modelo del Coche: ${this.modelo}`;
          };
          // crear un objeto de esta clase Coche
          let miCoche = new Coche("Tesla", "Model Y");
          console.log(miCoche.mostrarModelo());
          ```

        - **Ejemplo 2**

          ```js
          // Constructor usuario que será la base para propiedades y métodos comunes a todos los usuarios.
          function Usuario(nombre, email) {
            this.nombre = nombre;
            this.email = email;
          }
          // añadimos una función a este prototipo
          Usuario.prototype.informacion = function () {
            return `Nombre: ${this.nombre}, Email: ${this.email}`;
          };
          // extendemos la funcionalidad a un usuario de tipo administrador y otro de tipo moderador.
          // creamos los constructores para administrador y moderador, y que extiendan la funcionalidad del constructor usuario.
          function Administrador(nombre, email) {
            // Llamamos al constructor de Usuario y le pasamos la referencia this y los argumentos
            Usuario.call(this, nombre, email); // this es la referencia del objeto
          }
          // Ahora para unir todo esto
          Administrador.prototype = Object.create(Usuario.prototype);
          // El método constructor sea el propio administrador
          Administrador.prototype.constructor = Administrador;
          // Añadimos un método propio de Administrador
          Administrador.prototype.accesoTotal = function () {
            return `El usuario ${this.nombre} tiene acceso total al sistema`;
          };
          // ****************
          // Moderador
          // creamos el constructores para moderador, y que extienda la funcionalidad del constructor usuario.
          function Moderador(nombre, email) {
            // Llamamos al constructor de Usuario y le pasamos la referencia this y los argumentos
            Usuario.call(this, nombre, email); // this es la referencia del objeto
          }
          // Ahora extendemos el prototipo, que herede de Usuario.
          Moderador.prototype = Object.create(Usuario.prototype);
          // El método constructor sea el propio Moderador
          Moderador.prototype.constructor = Moderador;
          // Añadimos un método propio de Moderador
          Moderador.prototype.moderarContenido = function () {
            return `El usuario ${this.nombre} puede moderar contenido`;
          };
          // USO
          let administrador = new Administrador(
            "nom_administrador",
            "email_administrador"
          );
          console.log(administrador.informacion());
          console.log(administrador.accesoTotal());
          let moderador = new Moderador("nom_moderador", "email_moderador");
          console.log(moderador.informacion());
          console.log(moderador.moderarContenido());
          ```

  - **Closures**

    - [La Cocina del Código: 21. CLAUSURAS (Closures) EN JAVASCRIPT](https://www.youtube.com/watch?v=JXG_gQ0OF74)

      - Entorno léxico

        ```js
        function error(str) {
          console.log(
            `%c Error: ${str} `,
            "background:red; color:        white;"
          );
        }
        function warning(str) {
          console.log(
            `%c Warning: ${str} `,
            "background:orange;        color: white;"
          );
        }
        function exito(str) {
          console.log(
            `%c Exito: ${str} `,
            "background:green;         color: white;"
          );
        }
        ```

        ```js
        function mensaje(str) {
          console.log(`%c ${tipo}: ${str} `, estilos);
        }
        ```

        ```js
        function crearImpresoraDeMensajes(tipo, estilos) {
          function mensaje(str) {
            console.log(`%c ${tipo}: ${str} `, estilos);
          }
        }
        const error = crearImpresoraDeMensajes(
          "Error",
          "background:red; color: white;"
        );
        const warning = crearImpresoraDeMensajes(
          "Warning",
          "background:orange; color: white;"
        );
        const exito = crearImpresoraDeMensajes(
          "Exito",
          "background:green; color: white;"
        );
        ```

        ```js
        error("El usuario no inició sesión");
        warning("El usuario no tiene dirección");
        exito("Usuario registrado");
        ```

      - Uso Memoria (26.0)

        ```js
        function crearImpresoraDeMensajes(tipo, estilos) {
          const estilosPorDefecto = "color: white;";
          function mensaje(str) {
            console.log(`%c ${tipo}: ${str} `, estilosPorDefecto + estilos);
          }
        }
        const error = crearImpresoraDeMensajes("Error", "background:red;");
        const warning = crearImpresoraDeMensajes(
          "Warning",
          "background:orange;"
        );
        const exito = crearImpresoraDeMensajes("Exito", "background:green;");
        const info = crearImpresoraDeMensajes("Info", "background:blue;");
        const js = crearImpresoraDeMensajes(
          "JS",
          "background:yellow; color: black;"
        );
        ```

        - Estamos almacenando el mismo string en el entorno de cada clousere que creemos, como es un string que ocupa 13 caracteres <code>color: white;</code>, cada uno de estos ocupa 2 bytes; para cada impresora que creamos estamos ocupando 26 bytes de memoria fijos a parte del tipo y los estilos que puede ir variando de tamaño para cada una de ellas.
        - Para resolver esta situación lo que se hace es mover esta variable **afuera de la fábrica**, pero dejarla cerca a donde declaramos nuestra fábrica para saber que están íntimamente relacionadas. Moviendo la variable al entorno léxico global en donde todas pueden acceder ahorrándonos un poco de espacio en la memoria.

          ```js
          const estilosPorDefecto = "color: white;";
          function crearImpresoraDeMensajes(tipo, estilos) {
            function mensaje(str) {
              console.log(`%c ${tipo}: ${str} `, estilosPorDefecto + estilos);
            }
          }
          const error = crearImpresoraDeMensajes("Error", "background:red;");
          const warning = crearImpresoraDeMensajes(
            "Warning",
            "background:orange;"
          );
          const exito = crearImpresoraDeMensajes("Exito", "background:green;");
          const info = crearImpresoraDeMensajes("Info", "background:blue;");
          const js = crearImpresoraDeMensajes(
            "JS",
            "background:yellow; color: black;"
          );
          ```
