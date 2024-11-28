- Bindings

  - Ojo también hay una referencia en: "T_ReactCurso_001.md" línea 687 como: 01:38:55 - ¿Qué es el método bind y para qué sirve?

  - [La Cocina del Código: 15. THIS EN JAVASCRIPT (bind, call, apply y más)](https://www.youtube.com/watch?v=bS71_W_BDFE)

    - **Tipos de Binding**

      - Lexical Binding (Arrow Functions)(7.31)
        - Aparece en EScript2015, Es el tipo de binding que usa javaScript cuando utilizamos arrow functions.
      - New Binding (Instanciar Objetos)(7.25)
        - Es el tipo de binding que usa javaScript cuando instanciamos objetos
      - Explicit binding (Invocación Indirecta)(7.16)
        - El que hacemos explícito nosotros cuando invocamos una función pero indirectamente con los métodos de invocación que tienen las funciones.
      - Implicit Bindig (Invocación de Método)(7.10)
        - El que está implícito cuando invocamos al método de un objeto.
      - Default Binding (Invocación Directa) (7.07)
        - Tipo de enlazamiento que usa javaScript por defecto cuando invocamos una función directamente.

    - **Contexto / Context** (0.48)(3.13)

      - Es el <code>objeto</code> que está ejecutando una función _en un momento específico_
      - NO se debe confundir <code>contexto</code> con <code>contexto de ejecución</code> ya que son dos cosas distintas
        - Contexto
          - Tiene que ver con el valor de <code>this</code> (this: el objeto que está ejecutando la función en un momento específico)
        - Contexto de ejecución (3.30)
          - Tiene que ver con la <code>pila de ejecución</code>
            - Cada vez que javaScript ejecuta un método o una función, crea un <code>contexto de ejecución</code> para esa ejecución del método cargando en memoria todo lo necesario para ejecutarla (parámetros, nombre del archivo al que pertenece la función, número próxima línea de código a ejecutar, crea un nuevo <code>scope</code> o mejor dicho <code>entorno léxico</code> para las variables declaradas en la función, y por último determina que valor tiene <code>this</code> para esta ejecución de la función)

    - **This**

      En esta función no podemos saber que devolverá saludar hasta que la ejecutemos con un parámetro

      ```js
      function saludar(nombre) {
        console.log(`Hola, ${nombre}`);
      }

      saludar("Sofi");
      ```

      ```js
      function saludar() {
        console.log(`Hola, ${this.nombre}`);
      }
      ```

      ```js
      const yo = {
        nombre: "Sofi",
        saludar: function () {
          console.log(`Hola, ${this.nombre}`);
        },
      };
      ```

      Cambiar el valor de <code>this</code> nos permite reutilizar métodos _entre distintos objetos_

      - Pensar en <code>this</code> como un "parámetro especial" que reciben las funciones.
      - Preguntar el valor que tiene <code>this</code> es preguntar por el objeto que está ejecutando la función en esta vez. En otras palabras estamos preguntando en que <code>contexto</code> se está ejecutando la función.
      - Si tenemos el objeto que ejecuta la función y nuestra función, nuestro objetivo es enlazar el objeto con la función. Esto se llama <code>enlazamiento</code> o <code>binding</code>
      - Si no enlazamos ningún valor javaScript lo va a decidir por nosotros, y podemos terminar con errores en nuestros programas.

      - **Errores que se encuentran al usar <code>this</code>**

        - **harry potter y el misterio de this**

          ```js
          const harry = {
            nombre: "Harry",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          harry.saludar();
          // el método de un objeto accesa a una propiedad interna del mismo para imprimirla por consola.
          // Hola, me llamo Harry!
          ```

          Pero si lo ejecutamos de esta manera

          ```js
          const harry = {
            nombre: "Harry",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          const saludar = harry.saludar;
          saludar();
          //
          // Hola, me llamo undefined!
          ```

        - **this y los eventos, el caso del boton**

          ```js
          const harry = {
            nombre: "Harry",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          const boton = document.getElementById("miBoton");
          boton.addEventListener("click", harry.saludar);
          //
          // Hola, me llamo undefined!
          // Recuerda que this es el objeto que está ejecutando la función, si vemos undefined es porque ese objeto no tiene la propiedad nombre.
          // es decir el objeto harry NO ES el que está ejecutando la función.
          ```

    - **Binding**

      - **Tipos de Binding**

        1.- Lexical Binding (Arrow Functions)(7.31)

        - Aparece en EScript2015, Es el tipo de binding que usa javaScript cuando utilizamos arrow functions.

          2.- New Binding (Instanciar Objetos)(7.25)

        - Es el tipo de binding que usa javaScript cuando instanciamos objetos

          3.- Explicit binding (Invocación Indirecta)(7.16)

        - El que hacemos explícito nosotros cuando invocamos una función pero indirectamente con los métodos de invocación que tienen las funciones.

          4.- Implicit Bindig (Invocación de Método)(7.10)

        - El que está implícito cuando invocamos al método de un objeto.

          5.- Default Binding (Invocación Directa) (7.07)

        - Tipo de enlazamiento que usa javaScript por defecto cuando invocamos una función directamente.

      - **Caracteristicas**
        - El orden del análisis para su aplicación es estricto y se analiza según está enumerado antes. (7.50)
      - **¿Cómo sabe qué binding aplicar?**

        - observa:
          - como fue escrita la función.
          - si se ha realizado alguna modificación desde la creación.
          - mira el lugar de invocación o <code>call site</code> en inglés, el último lugar donde podemos cambiar el valor que va a tener <code>this</code>

      - **Explicación de cada uno**

        - **Default Binding (Invocación Directa)** (8.29)

          - Si javaScript ve que no puede aplicar ninguno de los anteriores, aplicará este por defecto.

          ```js
          function quienSoy() {
            console.log(`Hola, yo soy: `, this);
          }
          quienSoy();
          // se da cuando tenemos una función normal, invocada directamente
          // this es el objeto global que en los navegadores es "windows" y en nodejs es "objeto global"
          // Hola, yo soy: Windows {........}
          ```

          Si lo ejecutamos en <code>modo estricto</code>

          ```js
          "use strict";

          function quienSoy() {
            console.log(`Hola, yo soy: `, this);
          }
          quienSoy();
          // Ahora this no está definido es undefined
          // En modo estricto las funciones sueltas quedan realmente sueltas
          // En ESModule2015 al usar imports y exports el modo estricto viene habilitado por defecto, así que this no va a estar definido.
          // Hola, yo soy: undefined
          ```

        - **Implicit Bindig (Invocación de Método)**(9.46)

          - Es el más fácil de recordar, ya que es intuitivo
          - Se produce cuando invocamos al método de un objeto.

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
            hermano: {
              nombre: "Eric",
              saludar: function () {
                console.log(`Yo, el hermano, me llamo ${this.nombre}`);
              },
            },
          };
          sacha.saludar();
          sacha.hermano.saludar();
          // el "." antes de la invocación de la función "saludar" produce el "enlazamiento implícito"
          // cuando se ejecute cada función, this será el primer objeto que esté a la izquierda del ".", en el primer caso "sacha", y en el segundo "hermano"
          // Hola, me llamo Sacha
          // Yo, el hermano, me llamo Eric
          ```

          - Combiando los dos tipos anteriores para entender como javaScript realiza el encadenamiento:

          ```js
          "use strict";
          const sacha = {
            nombre: "Sacha",
            twitter: "@sachalifs",
            saludar: function () {
              function seguimeEnTwitter() {
                console.log(`Seguime en Twitter: ${this.twitter}!`);
              }
              console.log(`Hola, me llamo ${this.nombre}!`);
              seguimeEnTwitter();
            },
          };
          sacha.saludar();
          // Hola, me llamo Sacha!
          // Error: cannot read property "twitter" of undefined.
          // cuando JavaScript trata de ejecutar "seguimeEnTwitter();" trata de determinar que valor va a tomar this dentro de esa ejecución, y para eso busca el "." y el "objeto" antes de la invocación; lo cual no existe, entonces NO aplica el enlazamiento implícito, aplica el que sigue "el por defecto" y como estamos en "modo estricto" en las funciones sueltas, this es undefine.
          // Por lo anterior es importante cómo escribimos nuestro código en javaScript y dónde escribimos nuestras funciones.
          // Para resolverlo debemos escribir la función como método del objeto en lugar de una función suelta.
          ```

          ```js
          "use strict";
          const sacha = {
            nombre: "Sacha",
            twitter: "@sachalifs",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
              this.seguimeEnTwitter();
            },
            seguimeEnTwitter: function seguimeEnTwitter() {
              console.log(`Seguime en Twitter: ${this.twitter}!`);
            },
          };
          sacha.saludar();
          // Hola, me llamo Sacha!
          // Seguime en Twitter: @sachalifs
          //
          ```

          Otro caso a tener en cuenta (13.30) es cuando a un objeto le soltamos un método

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          const saludar = sacha.saludar;
          saludar();
          // Hola, me llamo undefined!
          // No estamos en modo estricto, this es el objeto global, y este no tiene una propiedad nombre.
          //
          ```

          Y si agregamos algún evento (14.00)

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
              console.log(this);
            },
          };
          const boton = document.getElementById("miBoton");
          boton.addEventListener("click", sacha.saludar);
          // Hola, me llamo undefined!
          // No estamos en modo estricto, this es el mismo button "<button id="miBoton">SALUDAR</button>"
          // Cuando trabajamos con eventos del DOM, this por defecto, es el elemento que dispara el evento. (15.12)
          ```

        - **Explicit binding (Invocación Indirecta)**(15.27)

          - Sirve para que **nosotros elijamos** exáctamente **que objeto queremos que sea** <code>this</code> cuando se ejecuta la función.
          - Básicamente nos permite cambiar el contexto de manera explícita.
          - Cuando pasamos métodos como call backs / métodos como parámetros de otras funciones pero queremos que <code>this</code> siga enlazado al objeto correcto.
          - O también cuando tenemos el método de un objeto que usa <code>this</code> pero queremos ejecutarlo sobre otro objeto o sea queremos cambiarlo de contexto.
          - Existen tres métodos (bind, call, apply)

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function (gritando, conDespedida) {
              const saludoNormal = `Hola, me llamo ${this.nombre}!`;
              const despedidaNormal = "Chau!";
              const saludo = gritando
                ? saludoNormal.toUpperCase()
                : saludoNormal;
              const despedida = gritando
                ? despedidaNormal.toUpperCase()
                : despedidaNormal;
              console.log(saludo);
              if (conDespedida) {
                console.log(despedida);
              }
            },
          };
          sacha.saludar(true, true);
          // HOLA, ME LLAMO SACHA!
          // CHAU!
          ```

          ¿cómo hacer para invocar este mismo método pero sobre otro objeto que también tenga la propiedad nombre?

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function (gritando, conDespedida) {
              const saludoNormal = `Hola, me llamo ${this.nombre}!`;
              const despedidaNormal = "Chau!";
              const saludo = gritando
                ? saludoNormal.toUpperCase()
                : saludoNormal;
              const despedida = gritando
                ? despedidaNormal.toUpperCase()
                : despedidaNormal;
              console.log(saludo);
              if (conDespedida) {
                console.log(despedida);
              }
            },
          };
          const pepe = { nombre: "Pepe" };
          pepe.saludar = sacha.saludar; // 1ra opción, funcionaría correctamente.
          pepe.saludar();
          // Hola, me llamo Pepe!
          // this será Pepe pq javaScript va a aplicar el enlazamiento implícito.

          // Queremos llamar a la función saludar de sacha pero EN OTRO CONTEXTO.
          // Llamar a la función: todas las funciones en javaScript son objetos y por lo tanto tienen propiedades y métodos que podemos usar, entre ellos se encuentra call.
          // call es un método que nos permite **invocar una función** cambiándole el contexto.
          // call el primer parámetro será el contexto, y luego viene una lista de parámetros separados por "," que serán los parámetros de la función.
          sacha.saludar.call(pepe, true, true);
          // HOLA, ME LLAMO PEPE!
          // CHAU!

          // apply es un método que nos permite **invocar una función** cambiándole el contexto.
          // apply el primer parámetro será el contexto, y luego viene un array con una lista de parámetros separados por "," que serán los parámetros de la función.
          sacha.saludar.apply(pepe, [true, true]);
          // HOLA, ME LLAMO PEPE!
          // CHAU!

          // En lugar de pasarle la función suelta podríamos decirle que lo invoque en el contexto que queremos en el mismo objeto.
          ```

          En lugar de pasarle la función suelta podríamos decirle que lo invoque en el contexto que queremos en el mismo objeto, es decir que no lo cambie por el del botón. pero con <code>call</code> y <code>apply</code> la función se ejecuta automáticamente sin presionar el botón, ahí es cuando aparece <code>bind</code>

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          const boton = document.getElementById("miBoton");
          boton.addEventListener("click", sacha.saludar.call(sasha));
          // Hola, me llamo Sacha!
          // Sin haber presionado el botón.
          ```

          con <code>bind</code>, que es otro método que tienen todas las funciones de javaScript que nos retorna **una nueva** función con el **contexto enlazado al objeto que le digamos**. Osea nos devuelve una nueva función con el valor de <code>this</code> que nosotros le digamos pero no la invoca todavía.

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          const boton = document.getElementById("miBoton");
          boton.addEventListener("click", sacha.saludar.bind(sasha));
          // Hola, me llamo Sacha!
          // Cada vez que le demos click al botón.
          ```

          Recordar que <code>bind</code> nos devuelve una nueva función que parece que está suelta pero en realidad está enlazada al objeto que le dijimos.

          ```js
          const sacha = {
            nombre: "Sacha",
            saludar: function () {
              console.log(`Hola, me llamo ${this.nombre}!`);
            },
          };
          const boundSaludar = sacha.saludar.bind(sasha);
          boundSaludar();
          // Hola, me llamo Sacha!
          // Cada vez que le demos click al botón.
          ```

          Una función que fue creada con <code>bind</code> **no puede volver a ser enlazada a otro objeto**
          <code>bind</code> se lo conoce también por lo anterior como el método de enlazamiento fuerte, no se puede cambiar el contexto de ninguna forma ni con call ni con apply, también sirve para algo que se llama <code>currying</code> o aplicación parcial de funciones.

        - **New Binding (Instanciar Objetos)**(21.22)

          - javaScript es un lenguaje multiparadigma, podemos programar usando el paradigma de la programación funcional, o el paradigma de la programación orientada a objetos.

          - Instanciación de objetos

            - Función constructora

              ```js
              function Persona(nombre) {
                this.nombre = nombre;
              }
              ```

            - ES2015 Classes

              ```js
              class Persona {
                constructor(nombre) {
                  this.nombre = nombre;
                }
              }
              ```

            - Al instanciar producimos un <code>biding</code>

              ```js
              function Persona(nombre) {
                this.nombre = nombre;
              }

              const sacha = new Persona("Sacha");
              // con new javaScript crea un nuevo objeto vacío
              // invoca a la función constructora con este objeto como valor de this, ejecuta la función, en este caso agrega la propiedad nombre con su valor al objeto vacío.
              // Y como la invocamos con new no hace falta que escribamos return this ya que javaScript lo hace por nosotros implícitamente y luego ese objeto se guarda en la variable sacha.
              ```

            - NO se puede mezclar con <code>bind / call / apply</code> ya que no está permitido.

        - **Lexical Binding (Arrow Functions)**(22.52)

          - Aparece en EScript2015, Es el tipo de binding que usa javaScript cuando utilizamos arrow functions.
          - Se llama de esta forma por que tiene que ver con como escribimos las funciones, con la parte léxica, con que caracteres usamos para escribir una función y se produce justamente cuando las funciones las escribimos como funciones flecha o arrow functions.

          En un ejemplo anterior teníamos esta que nos daba un error

          ```js
          "use strict";
          const sacha = {
            nombre: "Sacha",
            twitter: "@sachalifs",
            saludar: function () {
              function seguimeEnTwitter() {
                console.log(`Seguime en Twitter: ${this.twitter}!`);
              }
              console.log(`Hola, me llamo ${this.nombre}!`);
              seguimeEnTwitter();
            },
          };
          sacha.saludar();
          // Hola, me llamo Sacha!
          // Error: cannot read property "twitter" of undefined.
          ```

          Pero si usamos una <code>arrow function</code>

          ```js
          "use strict";
          const sacha = {
            nombre: "Sacha",
            twitter: "@sachalifs",
            saludar: function () {
              const seguimeEnTwitter = () => {
                console.log(`Seguime en Twitter: ${this.twitter}!`);
              };
              console.log(`Hola, me llamo ${this.nombre}!`);
              seguimeEnTwitter();
            },
          };
          sacha.saludar();
          // Hola, me llamo Sacha!
          // Seguime en Twitter: @sachalifs!
          // This tomará el valor que queríamos, esto es porque las arrow functions, se ejecutan en el mismo contexto en el que fueron creadas.
          // Esto quiere decir que la función seguimeEnTwitter es creada / cargada en memoria recién cuando se ejecuta el método saludar de sacha cuando la ejecución pasa por la línea <code>const seguimeEnTwitter = () => {</code> y cuando la crea javaScript va a ver que valor tiene this ese momento y será ese con el que quede enlazada en la arrow function.
          // Es un enlazamiento fuerte, si javaScript detecta que la función es un arrow function va a establecer el valor de this de esta manera, no va a seguir viendo si aplica a otro tipo de enlazamiento.
          // No se puede cambiar el contexto con bind, call, apply no se verá error pero tampoco tendrá efecto.
          ```

          - **Errores comunes con las arrow functions**

            - **Error 1**: Escribir la función principal como una <code>arrow function</code>

            ```js
            "use strict";
            const sacha = {
              nombre: "Sacha",
              twitter: "@sachalifs",
              saludar: () => {
                const seguimeEnTwitter = () => {
                  console.log(`Seguime en Twitter: ${this.twitter}!`);
                };
                console.log(`Hola, me llamo ${this.nombre}!`);
                seguimeEnTwitter();
              },
            };
            sacha.saludar();
            // tenemos que preguntarnos que valor tiene this cuando se crea la función.
            // La función se carga en memoria cuando se crea el objeto sacha que valor tiene this en ese momento lo podemos ver imprimiendo por consola el valor de this console.log(this) que es el objeto global. Fuera de toda función this es el objeto global.
            // Los objetos NO CREAN nuevos contextos.
            // Hola, me llamo undefined!
            // Seguime en Twitter: undefined
            ```

            - **Error 2**: Cuando usamos las clases de esmascript2015, los métodos de instancia no están fuertemente enlazados a los objetos que creemos. Es decir si creamos un objeto de la Persona, vamos a tener el mismo problema que teníamos antes con el botón.

            ```js
            class Persona {
              constructor(nombre) {
                this.nombre = nombre;
              }
              saludar() {
                console.log(`Hola, me llamo ${this.nombre}!`);
              }
            }
            const sacha = new Persona("Sacha");
            //
            ```

            Solucionarlo forma 1

            ```js
            class Persona {
              constructor(nombre) {
                this.nombre = nombre;
                this.saludar = this.saludar.bind(this);
              }
              saludar() {
                console.log(`Hola, me llamo ${this.nombre}!`);
              }
            }
            const sacha = new Persona("Sacha");
            ```

            Solucionarlo forma 2

            ```js
            class Persona {
              constructor(nombre) {
                this.nombre = nombre;
              }
              saludar = () => {
                console.log(`Hola, me llamo ${this.nombre}!`);
              };
            }
            const sacha = new Persona("Sacha");
            ```
