# **Tutorial de patrones de diseño en JavaScript**

## **Índice**
1. [Gentleman Programming: Te enseño TODOS los PATRONES de DISEÑO y cúando APLICARLOS](https://www.youtube.com/watch?v=GIS0_1kVBEM)
   1. **Creacionales**
      1. [Factory Method](#factory-method-gp)
      2. [Abstract Factory Method](#abstract-factory-method-gp)
      3. [Patron Builer](#builder-patron-gp)
      4. [Patron Singleton](#singleton-patron-gp)
      5. [Patron Prototype](#prototype-patron-gp)

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
- **Patron Singleton**<a name="#singleton-patron-gp"></a>
    - **Cuando utilizarlo**
      - Cuando requiere una única instancia global
        - Logger
        - Servicio
        - Configurador
        - Compartir información entre diferentes lugares

    ```javascript 
      class ConfigManager {
      	static #instance: ConfigManager; 
      	#config: Record<string, any> = {}; 

      	constructor(){
      		if (ConfigManager.#instance) {
                  throw new Error("ConfigManager es una clase Singleton. Usa ConfigManager.getInstance()      en su lugar.");
              }
      		ConfigManager.#instance = this; // ¡ASIGNAR esta nueva instancia a la propiedad estática!
      	};

      	static getInstance(): ConfigManager {
      		if(!ConfigManager.#instance){
      			ConfigManager.#instance = new ConfigManager();
      		}
      		return ConfigManager.#instance;
      	}

      	set(key: string, value: any){
      		this.#config[key] = value;
      	}

      	get(key: string){
      		return this.#config[key];
      	}
      }

      const config0 = new ConfigManager();
      const config1 = ConfigManager.getInstance();
      const config2 = ConfigManager.getInstance();

      const config3 = new ConfigManager(); // Debe dar error ya que ya existe una instancia.

      console.info("TEST SINGLETON");
      config1.set("apiUrl", "https://api.food.com");
      console.log(config2.get("apiUrl"));
      console.log(config1 === config2);
    ```

- **Patron Prototype**<a name="#prototype-patron-gp"></a>
    - **Cuando utilizarlo**
      - Requerimos clonar objetos complejos sin tener que reconstruirlos a mano

    ```javascript 
        interfase Clonable<T>{
        	clone():T;
        }

        class Order implements Clonable<Order> {
        	items: string[];
        	address: string;

        	constructor(items:string[], address: string){
        		this.items = items;
        		this.address = address;
        	}
          /*
        	constructor(items:string[], address: string){
        		// Otra forma: quitando los items y addres del  principio y dejándolos en el constructor
        		private items: string[],
        		private address: string
        	}
          */

        	clone(): Order {
        		return new Order([...this.items], this.address);
        	}
        }

        const originalOrder = new order (["pizza","sushi"],"ad1");
        const clonedOrder = originalOrder.clone();

        clonedOrder.items.push("empanada");

        console.log("Original order", originalOrder.items);
        console.log("Cloned order", clonedOrder.items);
    ```

