# **Tutorial de patrones de diseño en JavaScript**

## **Índice**
1. [Gentleman Programming: Te enseño TODOS los PATRONES de DISEÑO y cúando APLICARLOS](https://www.youtube.com/watch?v=GIS0_1kVBEM)
   1. **Creacionales**
      1. [Factory Method](#factory-method-gp)
      2. [Abstract Factory Method](#abstract-factory-method-gp)
      3. [Patron Builer](#builder-patron-gp)

---

- **Factory Method**<a name="factory-method-gp"></a>
    - **Cuando utilizarlo**
      - Cuando la creación de objetos de vuelta depende de condiciones o de tipos diferentes
      - Cuando quieres evitar modificar el código base cada vez que agregas una variable

    ```javascript 
      interface Food {
        prepare(): void;
      }

      class Pizza implements Food {
        prepare() {
          console.log("Preparando la pizzala....");
        }
      }

      class Sushi implements Food {
        prepare() {
          console.log("Preparando el sushihard....");
        }
      }

      class Empanada implements Food {
        prepare() {
          console.log("Preparando la empanada...");
        }
      }

      class FoodFactory {
        static createFood(type: string) {
          switch (type) {
            case "pizza":
              return new Pizza();
              // ... (Faltan los otros casos como "sushi" y "empanada")
            }
        }
      }

      const factory = FoodFactory.createFood("pizza");
      factory.prepare();

    ```

    *Vamos a mejorarlo*

    ```javascript 
      ....
      const TiposDeComida = {
        pizza: Pizza,
        sushi: Sushi,
        empanada: Empanada,
      } as const;

      class FoodFactory {
        //static createFood(type: TiposDeComida[keyof typeof TiposDeComida]) : Food {
        static createFood(type: keyof typeof TiposDeComida) : Food {
          return new TiposDeComida[type]();
        }
      }
      const factory = FoodFactory.createFood("pizza");
      factory.prepare();
    ```


- **AbstractFactory Method**<a name="abstract-factory-method-gp"></a>
    - **Cuando utilizarlo**
    ```javascript 
      // Abstract Factory

      class ArgentinaPizza extends Pizza {
          prepare() {
              console.log("Preparando la pizza argentina....");
          }
      }

      class ArgentinaSushi extends Sushi {
          prepare() {
              console.log("Preparando el sushi argentino....");
          }
      }

      class JapanesePizza extends Pizza {
          prepare() {
              console.log("Preparando la pizza japonesa....");
          }
      }

      class JapaneseSushi extends Sushi {
          prepare() {
              console.log("Preparando el sushi japonés....");
          }
      }

      interface FoodFactory {
          createPizza(): Pizza;
          createSushi(): Sushi;
      }

      class ArgentinaFoodFactory implements FoodFactory {
          createPizza(): Pizza {
              return new ArgentinaPizza();
          }
          createSushi(): Sushi {
              return new ArgentinaSushi();
          }
      }

      class JanapeseFoodFactory implements FoodFactory {
          createPizza(): Pizza {
              return new JapanesePizza();
          }
          createSushi(): Sushi {
              return new JapaneseSushi();
          }
      }

      // implementación 

      // -----------------------------------------------------
      // FUNCIÓN CLIENTE
      // La aplicación trabaja solo con la interfaz FoodFactory,
      // no con las fábricas o productos concretos.
      // -----------------------------------------------------

      function ClienteApp(factory: FoodFactory) {
          console.log("--- Inicializando Aplicación ---");

          // El cliente pide productos a la fábrica sin saber qué variantes concretas se crean.
          const pizza = factory.createPizza();
          const sushi = factory.createSushi();

          console.log("El cliente prepara la comida:");
          pizza.prepare(); // Llama al método de la Pizza concreta (Argentina o Japanese)
          sushi.prepare(); // Llama al método del Sushi concreto (Argentina o Japanese)

          console.log("--------------------------------\n");
      }

      // -----------------------------------------------------
      // USO EN LA APLICACIÓN
      // -----------------------------------------------------

      // 1. Usando la fábrica de Argentina
      const argentinaFactory = new ArgentinaFoodFactory();
      console.log("Configurando la aplicación para usar la Fábrica de Argentina...");
      ClienteApp(argentinaFactory);

      // Salida:
      // --- Inicializando Aplicación ---
      // El cliente prepara la comida:
      // Preparando la pizza argentina....
      // Preparando el sushi argentino....
      // --------------------------------

      // 2. Cambiando a la fábrica de Japón
      const japaneseFactory = new JanapeseFoodFactory();
      console.log("Configurando la aplicación para usar la Fábrica Japonesa...");
      ClienteApp(japaneseFactory);

      // Salida:
      // --- Inicializando Aplicación ---
      // El cliente prepara la comida:
      // Preparando la pizza japonesa....
      // Preparando el sushi japonés....
      // --------------------------------
    ```



  *Vamos a mejorarlo a través del* **Builder Patron**



- **Patron Builer**<a name="builder-patron-gp"></a>
    - **Cuando utilizarlo**
      - El problema con el abstract factory definido anteriormente es que el constructuro puede crecer y volverse complejo, por eso utilizamos este patrón Builder.
      - Se usa cuando un objeto tiene muchos parámetros opcionales, para evitar constructores gigantes.

    ```javascript 
      // Tenemos un nuevo tipo de comida, entonces definios un constructor en donde le pasamos los parámetros.
      // Pero qué sucede si esto se incrementa más y más, nuestro constructor va a crecer.
      class Lasagna {
          private size: string; 
          private cheese: string; 

          constructor(size: string, cheese: string) {
              this.size = size;
              this.cheese = cheese;
          }
      }
    ```
  *Vamos a mejorarlo* 


    ```javascript 
      // Tenemos un nuevo tipo de comida, entonces definios un constructor en donde le pasamos los parámetros.
      // Pero qué sucede si esto se incrementa más y más, nuestro constructor va a crecer.
      class Lasagna {
          private size: string; 
          private cheese: string; 

          constructor(builder: LasagnaBuilder) {
              this.size = builder.size;
              this.cheese = builder.cheese;
          }

          describe() {
            console.log(
              "La lasaña es de tamaño " + this.size + " y tiene queso " + this.cheese,
            );
          }
      }
      // Definimos un Builder de Lasagnias.
      class LasagnaBuilder {
          size: string = "mediana";
          cheese: string = "mozzarella";

          setSize(size: string) {
              this.size = size;
              return this;
          }

          setCheese(cheese: string) {
              this.cheese = cheese;
              return this;
          }

          build(): Lasagna {
              //return new Lasagna(this.size, this.cheese);
              return new Lasagna(this); //Le pasamos el LasagnaBuilder
          }
      }

      const lasagna = new LasagnaBuilder()
        .setSize("grande")
        .setCheese("cheddar")
        .build();
      const lasagnaDos = new LasagnaBuilder()
        .setSize("grande")
        .build();
    ```

