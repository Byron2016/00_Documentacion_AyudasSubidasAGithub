# **Tutorial de patrones de diseño en JavaScript**

## **Índice**
1. [Gentleman Programming: Te enseño TODOS los PATRONES de DISEÑO y cúando APLICARLOS](https://www.youtube.com/watch?v=GIS0_1kVBEM)
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

      const factory = FoodFactory.createFood();

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
          return TiposDeComida[type]();
        }
      }
      const factory = FoodFactory.createFood("pizza");
      factory.prepare();
    ```
<table>
  <tr>
    <th>Diagrama Renderizado</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
        skinparam style strict

        ' 1. Interface
        interface Food {
          + prepare(): void
        }

        ' 2. Clases Concretas y su relación de Realización (Implementación)
        class Pizza {
          + prepare(): void
        }
        Pizza ..|> Food

        class Sushi {
          + prepare(): void
        }
        Sushi ..|> Food

        class Empanada {
          + prepare(): void
        }
        Empanada ..|> Food

        ' 3. FoodFactory
        class FoodFactory {
          + {static} createFood(type): Food
        }

        ' 4. Relaciones de Dependencia del Factory
        ' El Factory depende de las clases concretas para instanciarlas.
        FoodFactory .> Pizza : <<creates>>
        FoodFactory .> Sushi : <<creates>>
        FoodFactory .> Empanada : <<creates>>
        ' El Factory depende de la interfaz Food para el tipo de retorno.
        FoodFactory .> Food : <<returns>>
      @enduml
  ```

  </td>
  </tr>
</table>


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

<table>
  <tr>
    <th>Diagrama Renderizado</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      skinparam style strict

      ' 1. Interfaces y Clases de Productos Abstractos
      interface Food {
        + prepare(): void
      }

      abstract class Pizza {
        + prepare(): void
      }
      Pizza ..|> Food

      abstract class Sushi {
        + prepare(): void
      }
      Sushi ..|> Food

      ' 2. Interfaz de Fábrica Abstracta
      interface FoodFactory {
        + createPizza(): Pizza
        + createSushi(): Sushi
      }

      ' 3. Productos Concretos (Extendiendo Clases Base)

      class ArgentinaPizza {
        + prepare(): void
      }
      ArgentinaPizza --|> Pizza

      class ArgentinaSushi {
        + prepare(): void
      }
      ArgentinaSushi --|> Sushi

      class JapanesePizza {
        + prepare(): void
      }
      JapanesePizza --|> Pizza

      class JapaneseSushi {
        + prepare(): void
      }
      JapaneseSushi --|> Sushi

      ' 4. Fábricas Concretas (Implementando FoodFactory)

      class ArgentinaFoodFactory {
        + createPizza(): Pizza
        + createSushi(): Sushi
      }
      ArgentinaFoodFactory ..|> FoodFactory
      ArgentinaFoodFactory ..> ArgentinaPizza : <<creates>>
      ArgentinaFoodFactory ..> ArgentinaSushi : <<creates>>

      class JanapeseFoodFactory {
        + createPizza(): Pizza
        + createSushi(): Sushi
      }
      JanapeseFoodFactory ..|> FoodFactory
      JanapeseFoodFactory ..> JapanesePizza : <<creates>>
      JanapeseFoodFactory ..> JapaneseSushi : <<creates>>

      @enduml
  ```

  </td>
  </tr>
</table>

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
<table>
  <tr>
    <th>Diagrama Renderizado</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      skinparam style strict

      ' 1. El Producto (La Lasaña)
      class Lasagna {
        - size: string
        - cheese: string

        + Lasagna(builder: LasagnaBuilder)
        + describe(): void
      }

      ' 2. El Constructor Concreto (LasagnaBuilder)
      class LasagnaBuilder {
        + size: string = "mediana"
        + cheese: string = "mozzarella"

        + setSize(size: string): LasagnaBuilder
        + setCheese(cheese: string): LasagnaBuilder
        + build(): Lasagna
      }

      ' 3. Relaciones

      ' El Builder crea el Producto (dependencia del método build)
      LasagnaBuilder ..> Lasagna : <<creates>>

      ' El Producto depende del Builder para su construcción (dependencia del constructor)
      Lasagna .> LasagnaBuilder : <<uses>>
  ```

  </td>
  </tr>
</table>
