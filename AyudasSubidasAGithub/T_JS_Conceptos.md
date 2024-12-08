- javaScript

  - **Pila de ejecución**

    - [La Cocina del Código: 1. La PILA DE EJECUCIÓN (Call Stack) de JAVASCRIPT | JS en ESPAÑOL](https://www.youtube.com/watch?v=ygA5U7Wgsg8&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB)

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

        - **tipado débil**: Se puede asignar a una variable otro tipo independientemente de lo que ya se asignó antes.

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
