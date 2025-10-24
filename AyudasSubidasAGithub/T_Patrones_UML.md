# **Tutorial de patrones de diseño en JavaScript UML**

## **Índice**
1. [Gentleman Programming: Te enseño TODOS los PATRONES de DISEÑO y cúando APLICARLOS](https://www.youtube.com/watch?v=GIS0_1kVBEM)
   1. **Creacionales**
      1. [Factory Method](#factory-method-gp)
      2. [Abstract Factory Method](#abstract-factory-method-gp)
      3. [Patron Builer](#builder-patron-gp)

---


- **Factory Method**<a name="factory-method-gp"></a>

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
        Food <|.. Pizza

        class Sushi {
          + prepare(): void
        }
        Food <|.. Sushi

        class Empanada {
          + prepare(): void
        }
        Food <|.. Empanada

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
      Food <|.. Pizza

      abstract class Sushi {
        + prepare(): void
      }
      Food <|.. Sushi

      ' 2. Interfaz de Fábrica Abstracta
      interface FoodFactory {
        + createPizza(): Pizza
        + createSushi(): Sushi
      }

      ' 3. Productos Concretos (Extendiendo Clases Base)

      class ArgentinaPizza {
        + prepare(): void
      }
      Pizza <|-- ArgentinaPizza

      class ArgentinaSushi {
        + prepare(): void
      }
      Sushi <|-- ArgentinaSushi

      class JapanesePizza {
        + prepare(): void
      }
      Pizza <|-- JapanesePizza

      class JapaneseSushi {
        + prepare(): void
      }
      Sushi <|-- JapaneseSushi

      ' 4. Fábricas Concretas (Implementando FoodFactory)

      class ArgentinaFoodFactory {
        + createPizza(): Pizza
        + createSushi(): Sushi
      }
      FoodFactory <|.. ArgentinaFoodFactory

      class JanapeseFoodFactory {
        + createPizza(): Pizza
        + createSushi(): Sushi
      }
      FoodFactory <|.. JanapeseFoodFactory

      class ClienteApp {
        + ClienteApp(factory: FoodFactory)
      }

      ClienteApp --> FoodFactory


      ArgentinaFoodFactory ..> ArgentinaPizza : <<creates>>
      ArgentinaFoodFactory ..> ArgentinaSushi : <<creates>>
      JanapeseFoodFactory ..> JapanesePizza : <<creates>>
      JanapeseFoodFactory ..> JapaneseSushi : <<creates>>

      @enduml
  ```

  </td>
  </tr>
</table>


- **Patron Builer**<a name="builder-patron-gp"></a>

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
      @enduml
  ```

  </td>
  </tr>
</table>
