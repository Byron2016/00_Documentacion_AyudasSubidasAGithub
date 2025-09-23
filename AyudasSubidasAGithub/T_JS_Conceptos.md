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

  
  
  - **Sistema de Tipos**

    - [La Cocina del Código: 4. EL SISTEMA de TIPOS DE JAVASCRIPT | JS en ESPAÑOL](https://www.youtube.com/watch?v=0ei4nb49GKo&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB&index=4)

      - **Sistema de Tipos**
        - Las **reglas que impone un lenguaje** para clasificar qué tipos de valores existen, cómo podemos manipularlos y cuáles son las operaciones válidas para realizar con ellos. Y tienen las siguientes características: 
          - Chequeo de tipos
          - Exigencia de tipos
          - Conversión de tipos 
          - Equivalencia y compatibilidad de tipos
        
        - **Chequeo de tipos**
          - Es el proceso de **verificar y hacer cumplir** las restricciones de tipos que existen en un lenguaje. Básicamente es verificar que si una variable dijimos que va a ser un número entero luego no le asignemos un string. O que si un método esperaba recibir un string no le estemos pasando un número.
          - **Cuando ocurre**
            - ANTES: chequeo **estático** de tipos (C#, Java, Scala, Kothin, Rust, Go)
            - DURANTE: chequeo **dinámico** de tipos (JavaScript, php, ruby, python)
        - **Exigencia de tipos** 
          - Qué tan exigente es un lenguaje para considerar que estamos cometiendo un error de tipos.
          - Mientras más extricto es un lenguaje con estas reglas decimos que es **más fuertemente tipado** mientras más relajado es con estas reglas decimos que es **más debilmente tipado**
          - **Ejemplos en js**
            - <code>2 + 'a' //'2a'</code>
            - <code>true + true + true //3</code>
            - <code>'Tengo ' + ['hambre', 'sueño'] + "!" //'Tengo hambre, sueño!</code>
            - <code>[] + {} //'[objetc Object]'</code>
            - <code>[1, 2, 3] + ' hola' //'1,2,3 hola'</code>
            - <code>2 + true //3</code>
            - <code>true + true //2</code>
            - <code>(true + true) * 50 //100</code>
            - <code>2 + BigInt(2) //ERROR</code>
            - <code>var a='hola'; a() //ERROR</code>
            - <code>var user; user.email //ERROR user es undefined o null</code>
        - **Conversión de tipos**
          - **Coerción de Tipos (Type coercion)** Es la **conversión implícita** de tipos que realiza el motor de javaScript para poder concretar una operación.
          - JavaScript es super relajado, permite realizar operaciones entre diferentes tipos sin problema, pero para hacerlo va a tomar ciertas decisiones por nosotros.
            - Num + string: Num transforma a string y concatena.
            - Num - string: string transforma a número y resta.
          - **Conversión explícita de tipos**
            - **string**
              - <code>String(123) //"123"</code>
              - <code>123 + '' //"123"</code>
              - <code>true + '' //"true"</code>
              - <code>null + '' //"null"</code>
              - Si no es NULL o UNDEFINE
                - <code>(2019).toString() //"2019"</code>
                - <code>var valor=true; valor.toString() //"true"</code>
            - **number**
              - <code>Number("123") //123</code>
              - <code>+"123" //123</code>
              - <code>+true //1</code>
              - **Operación no se puede concretar** Se obtiene **NaN**
                - <code>3 - 'a' //NaN</code>
                - <code>Number("123a") //NaN</code>
            - **boolena**
              - <code>Boolea(null) //false</code>
              - **Doble signo exclamación** el primero lo convierte al opuesto y el segundo da el valor real al negar el opuesto.
                - <code>var text='hola'; !texto; !!texto //false true</code>
          - **FALSY**
            - <code>!!'' //false</code>
            - <code>!!0 //false</code>
            - <code>!!null //false</code>
            - <code>!!undefined //false</code>
            - <code>!!NaN //false</code>
          - [WAT: A lightning talk by Gary Bernhardt from CodeMash 2012 ](https://www.destroyallsoftware.com/talks/wat)
        - **Equivalencia y compatibilidad de tipos**
          - Cómo un lenguaje determina que un tipo es **compatible** con otro tipo o **equivalente** a otro tipo.
          - **Tipado Nominal**: Dos tipos son compatibles cuando **tienen el mismo nombre o cuando uno **es un subtipo del otro** (por herencia) 
            - Con los lenguajes que tiene un tipado nominal se suelen crear programas escribiendo múltiples clases y utilizando muchos patrones de diseño de programación orientada a objetos lo que da lugar a soluciones elegantes y reconocibles fácilmente en la ingeniería del software (Singleton, Observer, Proxy, Builder, Adapter, Abstract Factory, Decorator, Memento, Strategy, Null Object), lo malo es que si modificamos algún tipo ya sea una clase o una interfaz agregando un método, probablemente terminemos modificando varias partes del programa para que los tipos sigan siendo compatibles, pero al mismo tiempo lo bueno es que vamos a tener muchos menos errores de tipo 
          - **Sistema de tipos estructural**: Con los lenguajes que tiene un sistema de tipos estructural para que dos tipos sean compatibles **solo basta que compartan la estructura** que nos interesa.
            - Función que recibe por parámetro variable persona que debe ser un objeto con un atributo de edad de tipo number. Pero esta función también podría recibir animales, edificios o cualquier cosa que tenga un atributo edad pero si le pasamos algo que no tenga el atributo edad tendremos un error de tipos 
              - <code>!function esMayorDeEdad(persona: {edad: number}){ return persona.edad > 18 }</code>
          - ANTES: Tanto el **Tipado Nominal** como **Tipado estructural** se realizan antes de ejecutar el programa en el **chequeo estático de tipos**
          - DUCK TYPING: En los lenguajes **chequeo dinámico de tipos** se usa el **Duck Typing**
            - Si camina como pato, nada como pato, y hace cuack como pato, entonces si es un pato. En programación yo no sé si es un pato, pero puedo tratarlo como tal.
            - **No nos importa de qué tipo es un objeto**, siempre y cuando tenga los atributos y métodos a los cuales queremos acceder.
          - Los **Lenguajes dinámicos** incentivan a **mantener una documentación actualizada** y **escribir mushos test** para asegurarnos de que el código funciona como debería antes de lanzar una **nueva versión** de un programa.
  
  
  - **== vs ===**

    - [La Cocina del Código: 5. == vs === en JAVASCRIPT | JS en ESPAÑOL](https://www.youtube.com/watch?v=FCkhDBsXsFg&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB&index=5)
      - **===**
        - Cuando comparamos **valores primitivos**, este nos dirá si son del **mismo tipo** y si tienen el **mismo valor**.
        - <code>'2' === 2 // false</code>
        - Operador de igualdad estricta (strict equality)
        - Comparación de **objetos / arrays o funciones**
          - No van a ser iguales ni con el doble igual.
          - Esto es debido a que en la variable se guardan referencias a memoria.
            - <code>{} === {} // false</code>
            - <code>{nombre: Ana} === {nombre: Ana} // false</code>
            - <code>var a= {nombre: Ana}; var b=a; a === b // true</code>
            - lo mismo pasa para funciones y arrays.
            - También se lo conoce como el **Operador de Identidad**: Cuando lo usamos para comparar objetos, este nos dice si estamos hablando del **mismo espacio de memoria**, del mismo objeto en la memoria.
            - Para comparar dos objetos en diferentes partes de la memoria, es un proceso bastante costoso que debería en lo posible evitarse. Formas: 
              - <code>JSON.stringify(a) === JSON.stringify(b) // true</code>
              - <code>_.isEqual(a, b) // true con lodash esto es mejor de stringify</code>
      - **==**
        - JavaScript realiza internamente una **coerción de tipos**
          - **coerción de tipos**: Cuando realizamos ciertas operaciones entre valores de **distinto tipos**, javaScript internamente convierte uno de ellos o ambos para que sean del mismo tipo y pueda concretar la operación.
            - <code>'2' == 2 // true</code>
            - <code>'  ' == 0 // true</code>
            - <code>'\n' == 0 // true</code>
        - Operador de igualdad débil (loose equality)
      - **!==**
        - Diferencia estricta **! dos iguales**
      - **!=**
        - Diferencia debil **! un igual**


  - **Scope**

    - [La Cocina del Código: 6. EL SCOPE en JAVASCRIPT | JS en ESPAÑOL](https://www.youtube.com/watch?v=s-7C09ymzK8&list=PLfWyZ8S-XzecAttp3QU-gBBXvMqEZTQXB&index=6)
      - Es uno de los conceptos que más confuciones genera en javaScript y a la vez es una de las características más importantes que tiene este lenguaje de programación.
      - Cuando hacemos referencia a una variable <code>if(true){console.log('comiendo ' + fruta)}</code> java script va a empezar buscando su definición en el entorno más cercano mirar numeración y orden de búsqueda.

          ```javascript 
            <script>
              //3.- como no la encuentra en 2 busca en este entorno
              var aafruta = 'manzana';
              function comer(){
                //2.- como no la encuentra en 1 busca en este entorno
                if(true){
                  //1.- busca dentro de este bloque
                  console.log('lavando ' + aafruta);
                }
              }
            <script>
          ```
      - Cada uno de estos entornos de búsqueda recibe el nombre de **scope** en javaScript.
      - el **scope** es lo que le da significado a las variables y además determina el conjunto de variables que podemos acceder desde una línea de código.
      - El **scope** en el que va a entrar cada variable depende de dónde y como la declaremos.
        - *Cómo* 
          - var (forma antigüa)
          - let o Const
        - *Por dónde* 
          - Manera libre fuera de toda función o bloque de código
          - Dentro de una función
          - Dentro de un bloque de código como un if pero solo con **let o const**
      - javaScript tiene un **scope léxico (lexical scoping)**: El scope de cada variable se determina leyendo el código del programa, sin ejecutarlo. Por eso a este modelo también se lo conoce como **scope estático (static scoping)**
      - Temas a cubrir 
        - Diferenciar entre **scope** vs **contexto**
        - Tipos de scope y características
        - Cadena de scopes (scope chain)
        - Scope en las herramientas del navegador
      - **Definición de scope**
        - Es el contexto actual de ejecución. El contexto en el que los valores y las expresiones son "visibles" o pueden ser referenciados.
          - Lo que quiere decir es que una palabra puede tener un significado en un contexto u otro totalmente distinto en otro contexto (ejemp: me puedo comer una manzana o salir a dar una vuelta a la manzana).

          ```javascript 
          //Ejemplo de dos contextos diferentes para aafruta
          //El mismo identificador tiene un valor de acuerdo al contexto.
          function comer(){
            var aafruta = 'manzana';
            console.log('comiendo ' + aafruta);
          }
          function lavar(){
            var aafruta = 'banana';
            console.log('lavando ' + aafruta);
          }
          ```
        - **Contexto vs Contexto de ejecución**
          - Las palabras se parecen pero son dos cosas totalmente distintas.
          - **Contexto** en javascript es: El valor que tiene la variable **this** en algún momento de la ejecución. Con cuál es el objeto que está ejecutando una función.
          - Te debe quedar claro que cuando hablamos de **scope** hablamos de **Contexto de ejecución** o mejor aún de **entorno**, de lo que le da significado a las variables.
      - **Tipos de scope y características**
        - Dependiendo de como escribamos nuestras variables, decidiremos si una variable va a vivir en un **scope global** o en un **scope local**
          - **scope global** 
            - Las **variables globales** pueden ser accedidas desde cualquier lugar de nuestro programa.
              - <code>var/let/const fruta='manzana' //como está fuera de toda función, bloque independientemente de como se declare tendrá un scope global.</code>
              - Lo mismo pasa con las funciones. Se podrán acceder desde cualquier lugar del código.
              - Resumiendo: Las variables declaradas fuera de toda función o bloque de código son variables globales sin importar si las declaramos con **var, let o const**
              - Están en memoria durante toda la ejecución del programa
          - **scope local** 
            - Las **variables locales** pueden ser accedidas desde una parte de nuestro programa.
            - Existen dos tipos 
              - **scope de función**
              - **scope de bloque**
            - **scope de función**
              - Son declaradas dentro de una función
              - Solo pueden ser accedidas desde esa función
              - Si tratamos de accederlas desde afuera se tendrá un error de referencia.
              - Lo mismo pasa con los parámetros que recibe una función, estos tienen un scope de función.
              - Si estamos en un bloque dentro de una función y declaramos una variable con **var** esta se va a poder acceder desde cualquier parte de la función que la contiene debido al **hosting**
            - **scope de bloque**
              - Es toda función de código encerrada entre llaves. (if, else, while, for, )
              - Si se declara una variable con **let / const** dentro de un bloque, desde fuera de ese bloque no se podrá acceder.
              - Están en memoria durante toda la ejecución de la función o bloque al que pertenece, a menos que se trate de un **clousure**.
            - **Cuál scope usar**
              - Buena práctica, es declararla en el scope más reducido posible.
      - **Cadena de scopes (scope chain)**
          ```javascript 
            <script>
              var aafruta = 'manzana';
              function comer(){
                var aaotraFruta = 'banana';
                function lavar(){
                  console.log('lavando ' + aaotraFruta);
                }
                lavar();
                console.log('comiendo ' + aaotraFruta);
              }
              comer();
            <script>
          ```
        - función lavar es hija de la función comer debido a que está declarada directamente  dentro de ella y a su vez la función comer es hija de la función global.
        - Entender la jerarquía que se genera entre los distintos scopes que existen de acuerdo a como escribamos nuestro código, es la clave para entender como funciona este mecanismo.
        - Para aaotraFrua dentro de lavar, primero la busca en función lavar, no la encuentra va a la función comer, la encuentra, detiene la búsqueda.
        - Si encambio sería aaFruta, no la encontraría en la función comer, entonces fuera al scope de la función global donde está.
        - Este mecanismo descrito anteriormente es lo que se llama cadena de scope o scope chaining en inglés y es lo que permite que las variables globales se puedan acceder desde cualquier lugar del programa.
        - Si por equivocación tipamos más una variable la búsqueda igual se dará y generará un error (La variable x no está definida)
        - OJO: si en vez de escribir una variable que no existía, queremos agregar un valor sobre ella, lo que javaScript hace es realizar la búsqueda hasta llegar al scope global y al no encontrarla **crearía en el scope global**
          - Esto NO queremos que pase
          - Lo evitamos agregando **'use strict'** al inicio de la codificación. Y nos mostrará un error (ReferenceError: x is not defined)
        - Hagamos la prueba de tanto en la función comer creamos y llamamos a variable con mismo nombre que la definida en la función global. Igualmente en la función lavar invocamos a la misma función.
          - Va a buscar en el scope de la función, como no la encuentra va a función comer y detiene la búsqueda, tomando ese valor. Produciéndose un ocultamiento de variables
          - **Ocultamiento de variables (variable shadowing)**
            - Se produce cuando una variable que está en un scope más reducido tiene **el mismo nombre** que otra que está en un scope superior siguiendo su cadena de scopes.
          - Si queremos referirnos específicamente a la variable global, deveríamos poner **window.fruta** dado que fruta fue declarada con var, lo que la agrega en la propiedad del objeto global window del navegador
      - **Scope en las herramientas del navegador**
        - en chrome si la variable global está declarada con **let o const** en lugar de **var** 
          - Esta no se agrega como propiedad del objeto window
          - Se agrega en un scope **Script**, ahí van a estar las variables globales que *no son propiedades de window*, pero no por eso dejan de ser globales.
          - Y si ponemos un break point, veremos que aparece en scope algo nuevo **Clsure (comer)**

  - **This**

    - [La Cocina del Código: 15. THIS EN JAVASCRIPT (bind, call, apply y más)](https://www.youtube.com/watch?v=bS71_W_BDFE)
    
      - Cambiar el valor de *this* nos permite reutilizar métodos entre distintos objeto reutilizando la misma lógica.
      - Pensar a *this* como un "parámetro especial"
      - Preguntar ¿quién es this? o ¿qué valor tiene this? es lo mismo que preguntar ¿qué objeto está ejecutando la función esta vez? en otras palabras estamos preguntando *en que contexto se está ejecutando la función*
        - *Contexto* es el *objeto* que está ejecutando una función  <u>en un momento específico</u>.
        - *Contexto* es diferente a *Contexto de ejecución*
          - *Contexto* tiene que ver con el valor de *this*, el *objeto* que está ejecutando una función en un momento específico.
          - *Contexto de ejecución* tiene que ver con la *pila de ejecución*
            - Cada vez que javaScript ejecuta un método o una función, crea un *Contexto de ejecución* para esa ejecución del método o de la función cargando en memoria todo lo necesario para ejecutarla: nombre de la función, parámetros que recibe, nombre del archivo, número próxima fila de ejecución, también crea un *entorno léxico* para las variables declaradas de la función y por último determina que valor tiene *this* para esta ejecución de la función y lo hace cada vez que ejecuta una función.  
      
      - **Errores**
        - **HP y el misterio de this**
          ```javascript 
            const harry = {
              nombre: "Harry",
              saludar: function() {
                console.log(`Hola, me llamo ${this.nombre}!`);
              }
            }
            harry.saludar()
            // Hola, me llamo Harry!
          ```

          Pero si lo guardamos en una variable:

          ```javascript 
            const harry = {
              nombre: "Harry",
              saludar: function() {
                console.log(`Hola, me llamo ${this.nombre}!`);
              }
            }
            const saludar = harry.saludar()
            saludar();
            // Hola, me llamo undefinde!
            // this es el objeto que está ejecutando la función, entonces el objeto harry no es el que lo está ejecutando.
          ```
          
        - **This y los eventos**
          ```javascript 
            const harry = {
              nombre: "Harry",
              saludar: function() {
                console.log(`Hola, me llamo ${this.nombre}!`);
              }
            }
            const boton = document.getElementById("miBoton")
            boton.addEventListener("click",harry.saludar)
            // Hola, me llamo undefinde!
          ```
        
      - **Enlazamiento (binding)** 
        - *Enlazamiento (binding)* es asignar el valor que va a tomar *this* <u>cuando se ejecute la función</u>
        - **Tipos de Binding**
          - *Lexical Binding (Arrow Functions)*
          - *New Binding (Instanciar Objetos)*
          - *Explicit Binding (Invocación Indirecta)*
          - *Implicit Binding (Invocación de Método)*
          - *Default Binding (invocación Directa)*
          
          - El orden en que mira javaScript es desde el Léxical al Default Binding en ese orden.
          - ¿Cómo sabe qué enlazamiento aplicar?
            - Mira cómo fue escrita la función
            - Modificaciones desde la creación.
            - El lugar de invocación (call site)

        - Desarrollo de cada tipo 

          - *Default Binding (invocación Directa)*
          ```javascript 
            function quienSoy() {
              console.log('Soy el archivo index.js: ', this);
            }

            quienSoy();
            // En las funciones sueltas, this es el objeto global / window
            // Si trabajamos en modo estricto: use strict, veremos que this no está definido.
            // esto mismo pasa en ES2015 (cuando usamos imports/export) que viene modo estricto por default.
          ```

        - *Implicit Binding (Invocación de Método)*
          - Se produce cuando invocamos al método de un objeto.
          ```javascript 
            const sasha = {
              nombre: "Sasha",
              saludar: function() {
                  console.log(`Hola, soy ${this.nombre}`);
              },
              hermano: {
                nombre: "Eric",
                saludar: function() {
                  console.log(`Hola, soy el hermano y mi nombre es ${this.nombre}`);
                }
              }
            }

            sasha.saludar();
            sasha.hermano.saludar();
            // this es el primer objeto que este a la izquierda del punto. sasha y hermano respectivamente.
          ```
        - *Análisis de estos dos casos y como se aplica.*
          - Se produce cuando invocamos al método de un objeto.
          ```javascript 
            "use strict";
            const sasha = {
              nombre: "Sasha",
              x: "@sachalifs",
              saludar: function() {
                function seguimientoX(){
                  console.log(this);
                  console.log(`Sigueme en ${this.x}`);
                };
                console.log(`Hola, soy ${this.nombre}`);
                seguimientoX(); // Es una funcion suelta, por tanto this será windows / global.
              }
            }

            sasha.saludar();
            // Inicialmente imprime "Hola soy Sasha" correctamente x que aplica el enlazamiento implícito en "sasha.saludar()" entonces this es el objeto sasha, x que estamos ejecutando un método de un objeto.
            // Pero al llegar a "seguimientoX()" determina qué valor tendrá this dentro de esa ejecución. No aplica enlazamiento implícito pq no hay punto antes de una función, entonces aplica el enlazamiento por defecto, y como estamos en modo estricto this es undefine.
          ```
          - Se resuelve escribiendo la función como método del objeto y luego invocándolo con this y un punto.
          ```javascript 
            "use strict";
            const sasha = {
              nombre: "Sasha",
              x: "@sachalifs",
              saludar: function() {
                console.log(`Hola, soy ${this.nombre}`);
                this.seguimientoX(); 
              },
              seguimientoX: function (){
                console.log(this);
                console.log(`Sigueme en ${this.x}`);
              };
            }

            sasha.saludar();
          ```
          - Caso de asignar la ejecución a una variable..
          ```javascript 
            const sasha = {
              nombre: "Sasha",
              saludar: function() {
                console.log(`Hola, soy ${this.nombre}`);
              }
            }
            
            let saludar = sasha.saludar;

            saludar(); 
            // no estamos en modo stricto, saludar es una función suelta, this es el objeto global / window
          ```
          - Caso de asignar la ejecución a un evento.
          ```javascript 
            const sasha = {
              nombre: "Sasha",
              saludar: function() {
                console.log(`Hola, soy ${this.nombre}`);
                console.log(this);
              }
            }
            const boton = document.getElementById('miBoton');
            boton.addEventListener('click', sasha.saludar); // this es el objeto que dispara el evento, en este caso el boton por eso se imprime undefined

          ```
        - *Explicit Binding (Invocación Indirecta)*
          - Call / applid / bind 
          - 15.41

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
