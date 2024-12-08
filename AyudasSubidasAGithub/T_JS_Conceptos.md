- javaScript

  - closures

    - [21. CLAUSURAS (Closures) EN JAVASCRIPT](https://www.youtube.com/watch?v=JXG_gQ0OF74)

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
