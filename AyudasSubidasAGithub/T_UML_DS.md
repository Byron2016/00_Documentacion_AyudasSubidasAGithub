# **Tutorial de UML y JavaScript: Relaciones entre Clases**

## **Índice**
1. [Relación de Extensión (Herencia)](#relación-de-extensión-herencia)
2. [Agregar una Interfaz](#agregar-una-interfaz)
3. [Relación de Composición](#relación-de-composición)
4. [Relación de Agregación](#relación-de-agregación)
5. [Relación de Dependencia Débil](#relación-de-dependencia-débil)
6. [Relación de Asociación](#relación-de-asociación)
7. [Preguntas Frecuentes](#preguntas-frecuentes)

---

## **1. Relación de Extensión (Herencia)** <a name="relación-de-extensión-herencia"></a>

### **Diagrama de Clases en UML**

<table>
  <tr>
    <th>Diagrama Renderizado</th>
    <th>Código PlantUML sin Renderizar</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        + ladrar()
      }

      Animal <|-- Perro
      @enduml
  ```

  </td>
  <td>
      <!-- Columna 2: Código PlantUML sin renderizar -->
  <pre>

      @startuml
      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        + ladrar()
      }

      Animal <|-- Perro
      @enduml

  </pre>
  </td>
  </tr>
</table>


### **Código en JavaScript (Clases)**
```js
// Clase base (superclase)
class Animal {
  constructor(nombre) {
    this.nombre = nombre; // Atributo privado (convención con _)
  }

  // Método público
  hacerSonido() {
    console.log(`${this.nombre} hace un sonido.`);
  }
}

// Clase derivada (subclase)
class Perro extends Animal {
  constructor(nombre, raza) {
    super(nombre); // Llama al constructor de la clase base
    this.raza = raza; // Atributo adicional
  }

  // Método adicional
  ladrar() {
    console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
  }
}

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán");
miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
```


### **Código en JavaScript (Funciones Constructoras)**
```js
// Función constructora para la clase base (Animal)
function Animal(nombre) {
  this.nombre = nombre; // Atributo privado (convención con _)
}

// Método público para Animal
Animal.prototype.hacerSonido = function () {
  console.log(`${this.nombre} hace un sonido.`);
};

// Función constructora para la clase derivada (Perro)
function Perro(nombre, raza) {
  Animal.call(this, nombre); // Llama al constructor de la clase base
  this.raza = raza; // Atributo adicional
}

// Establecer la herencia (Perro hereda de Animal)
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro;

// Método adicional para Perro
Perro.prototype.ladrar = function () {
  console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
};

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán");
miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
```

## **2. Agregar una Interfaz** <a name="agregar-una-interfaz"></a>

### **Diagrama de Clases en UML**

<table>
  <tr>
    <th>Diagrama Renderizado</th>
    <th>Código PlantUML sin Renderizar</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      interface Sonido {
        + hacerSonido()
      }

      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        + ladrar()
      }

      Sonido <|.. Animal
      Animal <|-- Perro
      @enduml
  ```

  </td>
  <td>
      <!-- Columna 2: Código PlantUML sin renderizar -->
  <pre>

      @startuml
      interface Sonido {
        + hacerSonido()
      }

      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        + ladrar()
      }

      Sonido <|.. Animal
      Animal <|-- Perro
      @enduml

  </pre>
  </td>
  </tr>
</table>

### **Código en JavaScript (Clases)**
```js
// Definición de la interfaz (en JavaScript no existe "interface", se simula con clases)
class Sonido {
  hacerSonido() {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Clase base (Animal) que implementa la interfaz Sonido
class Animal extends Sonido {
  constructor(nombre) {
    super();
    this.nombre = nombre;
  }

  // Implementación del método de la interfaz
  hacerSonido() {
    console.log(`${this.nombre} hace un sonido.`);
  }
}

// Clase derivada (Perro)
class Perro extends Animal {
  constructor(nombre, raza) {
    super(nombre);
    this.raza = raza;
  }

  // Método adicional
  ladrar() {
    console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
  }
}

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán");
miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
```


### **Código en JavaScript (Funciones Constructoras)**
```js
// Simulación de la interfaz Sonido (en JavaScript no existe "interface")
function Sonido() {
  if (this.constructor === Sonido) {
    throw new Error("No se puede instanciar una interfaz");
  }
  if (typeof this.hacerSonido !== "function") {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Función constructora para la clase base (Animal)
function Animal(nombre) {
  Sonido.call(this); // Verifica que se implemente la interfaz
  this.nombre = nombre;
}

// Implementación del método de la interfaz
Animal.prototype.hacerSonido = function () {
  console.log(`${this.nombre} hace un sonido.`);
};

// Función constructora para la clase derivada (Perro)
function Perro(nombre, raza) {
  Animal.call(this, nombre);
  this.raza = raza;
}

// Establecer la herencia (Perro hereda de Animal)
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro;

// Método adicional para Perro
Perro.prototype.ladrar = function () {
  console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
};

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán");
miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
```

## **3. Relación de Composición** <a name="relación-de-composición"></a>

### **Diagrama de Clases en UML**

<table>
  <tr>
    <th>Diagrama Renderizado</th>
    <th>Código PlantUML sin Renderizar</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      interface Sonido {
        + hacerSonido()
      }
      
      class Animal {
        - nombre: String
        + hacerSonido()
      }
      
      class Perro {
        - raza: String
        - collar: Collar
        + ladrar()
      }
      
      class Collar {
        - color: String
        + getColor()
      }
      
      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      @enduml
  ```

  </td>
  <td>
      <!-- Columna 2: Código PlantUML sin renderizar -->
  <pre>

      @startuml
      interface Sonido {
        + hacerSonido()
      }
      
      class Animal {
        - nombre: String
        + hacerSonido()
      }
      
      class Perro {
        - raza: String
        - collar: Collar
        + ladrar()
      }
      
      class Collar {
        - color: String
        + getColor()
      }
      
      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      @enduml

  </pre>
  </td>
  </tr>
</table>

### **Código en JavaScript (Clases)**
```js
// Definición de la interfaz (en JavaScript no existe "interface", se simula con clases)
class Sonido {
  hacerSonido() {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Clase base (Animal) que implementa la interfaz Sonido
class Animal extends Sonido {
  constructor(nombre) {
    super();
    this.nombre = nombre;
  }

  // Implementación del método de la interfaz
  hacerSonido() {
    console.log(`${this.nombre} hace un sonido.`);
  }
}

// Clase Collar (parte de Perro)
class Collar {
  constructor(color) {
    this.color = color;
  }

  getColor() {
    return this.color;
  }
}

// Clase derivada (Perro)
class Perro extends Animal {
  constructor(nombre, raza, colorCollar) {
    super(nombre);
    this.raza = raza;
    this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
  }

  // Método adicional
  ladrar() {
    console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
  }

  // Método para obtener el color del collar
  getColorCollar() {
    return this.collar.getColor();
  }
}

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Rojo");
miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
console.log(`El color del collar es: ${miPerro.getColorCollar()}`); // Usando el Collar
```


### **Código en JavaScript (Funciones Constructoras)**
```js
// Simulación de la interfaz Sonido (en JavaScript no existe "interface")
function Sonido() {
  if (this.constructor === Sonido) {
    throw new Error("No se puede instanciar una interfaz");
  }
  if (typeof this.hacerSonido !== "function") {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Función constructora para la clase base (Animal)
function Animal(nombre) {
  Sonido.call(this); // Verifica que se implemente la interfaz
  this.nombre = nombre;
}

// Implementación del método de la interfaz
Animal.prototype.hacerSonido = function () {
  console.log(`${this.nombre} hace un sonido.`);
};

// Función constructora para Collar (parte de Perro)
function Collar(color) {
  this.color = color;
}

Collar.prototype.getColor = function () {
  return this.color;
};

// Función constructora para la clase derivada (Perro)
function Perro(nombre, raza, colorCollar) {
  Animal.call(this, nombre);
  this.raza = raza;
  this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
}

// Establecer la herencia (Perro hereda de Animal)
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro;

// Método adicional para Perro
Perro.prototype.ladrar = function () {
  console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
};

// Método para obtener el color del collar
Perro.prototype.getColorCollar = function () {
  return this.collar.getColor();
};

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Azul");
miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
console.log(`El color del collar es: ${miPerro.getColorCollar()}`); // Usando el Collar
```

## **4. Relación de Agregación** <a name="relación-de-agregación"></a>

### **Diagrama de Clases en UML**

<table>
  <tr>
    <th>Diagrama Renderizado</th>
    <th>Código PlantUML sin Renderizar</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      interface Sonido {
        + hacerSonido()
      }

      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        - collar: Collar
        - juguetes: Array
        + ladrar()
        + agregarJuguete(Juguete)
        + listarJuguetes()
      }

      class Collar {
        - color: String
        + getColor()
      }

      class Juguete {
        - nombre: String
        + getNombre()
      }

      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      Perro o-- Juguete
      @enduml
  ```

  </td>
  <td>
      <!-- Columna 2: Código PlantUML sin renderizar -->
  <pre>

      @startuml
      interface Sonido {
        + hacerSonido()
      }
      
      class Animal {
        - nombre: String
        + hacerSonido()
      }
      
      class Perro {
        - raza: String
        - collar: Collar
        - juguetes: Array
        + ladrar()
        + agregarJuguete(Juguete)
        + listarJuguetes()
      }
      
      class Collar {
        - color: String
        + getColor()
      }
      
      class Juguete {
        - nombre: String
        + getNombre()
      }
      
      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      Perro o-- Juguete
      @enduml

  </pre>
  </td>
  </tr>
</table>

### **Código en JavaScript (Clases)**
```js
// Definición de la interfaz (en JavaScript no existe "interface", se simula con clases)
class Sonido {
  hacerSonido() {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Clase base (Animal) que implementa la interfaz Sonido
class Animal extends Sonido {
  constructor(nombre) {
    super();
    this.nombre = nombre;
  }

  // Implementación del método de la interfaz
  hacerSonido() {
    console.log(`${this.nombre} hace un sonido.`);
  }
}

// Clase Collar (parte de Perro, relación de composición)
class Collar {
  constructor(color) {
    this.color = color;
  }

  getColor() {
    return this.color;
  }
}

// Clase Juguete (relación de agregación)
class Juguete {
  constructor(nombre) {
    this.nombre = nombre;
  }

  getNombre() {
    return this.nombre;
  }
}

// Clase derivada (Perro)
class Perro extends Animal {
  constructor(nombre, raza, colorCollar) {
    super(nombre);
    this.raza = raza;
    this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
    this.juguetes = []; // Agregación: Perro puede tener varios Juguetes
  }

  // Método adicional
  ladrar() {
    console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
  }

  // Método para obtener el color del collar
  getColorCollar() {
    return this.collar.getColor();
  }

  // Método para agregar un juguete (agregación)
  agregarJuguete(juguete) {
    this.juguetes.push(juguete);
  }

  // Método para listar los juguetes
  listarJuguetes() {
    console.log(`Juguetes de ${this.nombre}:`);
    this.juguetes.forEach((juguete, index) => {
      console.log(`${index + 1}. ${juguete.getNombre()}`);
    });
  }
}

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Rojo");
const juguete1 = new Juguete("Hueso de goma");
const juguete2 = new Juguete("Pelota");

miPerro.agregarJuguete(juguete1);
miPerro.agregarJuguete(juguete2);

miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
console.log(`El color del collar es: ${miPerro.getColorCollar()}`); // Usando el Collar
miPerro.listarJuguetes(); // Listar juguetes
```


### **Código en JavaScript (Funciones Constructoras)**
```js
// Simulación de la interfaz Sonido (en JavaScript no existe "interface")
function Sonido() {
  if (this.constructor === Sonido) {
    throw new Error("No se puede instanciar una interfaz");
  }
  if (typeof this.hacerSonido !== "function") {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Función constructora para la clase base (Animal)
function Animal(nombre) {
  Sonido.call(this); // Verifica que se implemente la interfaz
  this.nombre = nombre;
}

// Implementación del método de la interfaz
Animal.prototype.hacerSonido = function () {
  console.log(`${this.nombre} hace un sonido.`);
};

// Función constructora para Collar (parte de Perro, relación de composición)
function Collar(color) {
  this.color = color;
}

Collar.prototype.getColor = function () {
  return this.color;
};

// Función constructora para Juguete (relación de agregación)
function Juguete(nombre) {
  this.nombre = nombre;
}

Juguete.prototype.getNombre = function () {
  return this.nombre;
};

// Función constructora para la clase derivada (Perro)
function Perro(nombre, raza, colorCollar) {
  Animal.call(this, nombre);
  this.raza = raza;
  this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
  this.juguetes = []; // Agregación: Perro puede tener varios Juguetes
}

// Establecer la herencia (Perro hereda de Animal)
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro;

// Método adicional para Perro
Perro.prototype.ladrar = function () {
  console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
};

// Método para obtener el color del collar
Perro.prototype.getColorCollar = function () {
  return this.collar.getColor();
};

// Método para agregar un juguete (agregación)
Perro.prototype.agregarJuguete = function (juguete) {
  this.juguetes.push(juguete);
};

// Método para listar los juguetes
Perro.prototype.listarJuguetes = function () {
  console.log(`Juguetes de ${this.nombre}:`);
  this.juguetes.forEach((juguete, index) => {
    console.log(`${index + 1}. ${juguete.getNombre()}`);
  });
};

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Azul");
const juguete1 = new Juguete("Hueso de goma");
const juguete2 = new Juguete("Pelota");

miPerro.agregarJuguete(juguete1);
miPerro.agregarJuguete(juguete2);

miPerro.hacerSonido(); // Heredado de Animal
miPerro.ladrar();      // Específico de Perro
console.log(`El color del collar es: ${miPerro.getColorCollar()}`); // Usando el Collar
miPerro.listarJuguetes(); // Listar juguetes
```

## **5. Relación de Dependencia Débil** <a name="relación-de-dependencia-débil"></a>

### **Diagrama de Clases en UML**

<table>
  <tr>
    <th>Diagrama Renderizado</th>
    <th>Código PlantUML sin Renderizar</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      interface Sonido {
        + hacerSonido()
      }

      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        - collar: Collar
        - juguetes: Array
        + ladrar()
        + agregarJuguete(Juguete)
        + listarJuguetes()
      }

      class Collar {
        - color: String
        + getColor()
      }

      class Juguete {
        - nombre: String
        + getNombre()
      }

      class Veterinario {
        + chequear(Perro)
      }

      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      Perro o-- Juguete
      Veterinario ..> Perro
      @enduml
  ```

  </td>
  <td>
      <!-- Columna 2: Código PlantUML sin renderizar -->
  <pre>

      @startuml
      interface Sonido {
        + hacerSonido()
      }
      
      class Animal {
        - nombre: String
        + hacerSonido()
      }
      
      class Perro {
        - raza: String
        - collar: Collar
        - juguetes: Array
        + ladrar()
        + agregarJuguete(Juguete)
        + listarJuguetes()
      }
      
      class Collar {
        - color: String
        + getColor()
      }
      
      class Juguete {
        - nombre: String
        + getNombre()
      }
      
      class Veterinario {
        + chequear(Perro)
      }
      
      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      Perro o-- Juguete
      Veterinario ..> Perro
      @enduml

  </pre>
  </td>
  </tr>
</table>

### **Código en JavaScript (Clases)**
```js
// Definición de la interfaz (en JavaScript no existe "interface", se simula con clases)
class Sonido {
  hacerSonido() {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Clase base (Animal) que implementa la interfaz Sonido
class Animal extends Sonido {
  constructor(nombre) {
    super();
    this.nombre = nombre;
  }

  // Implementación del método de la interfaz
  hacerSonido() {
    console.log(`${this.nombre} hace un sonido.`);
  }
}

// Clase Collar (parte de Perro, relación de composición)
class Collar {
  constructor(color) {
    this.color = color;
  }

  getColor() {
    return this.color;
  }
}

// Clase Juguete (relación de agregación)
class Juguete {
  constructor(nombre) {
    this.nombre = nombre;
  }

  getNombre() {
    return this.nombre;
  }
}

// Clase derivada (Perro)
class Perro extends Animal {
  constructor(nombre, raza, colorCollar) {
    super(nombre);
    this.raza = raza;
    this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
    this.juguetes = []; // Agregación: Perro puede tener varios Juguetes
  }

  // Método adicional
  ladrar() {
    console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
  }

  // Método para obtener el color del collar
  getColorCollar() {
    return this.collar.getColor();
  }

  // Método para agregar un juguete (agregación)
  agregarJuguete(juguete) {
    this.juguetes.push(juguete);
  }

  // Método para listar los juguetes
  listarJuguetes() {
    console.log(`Juguetes de ${this.nombre}:`);
    this.juguetes.forEach((juguete, index) => {
      console.log(`${index + 1}. ${juguete.getNombre()}`);
    });
  }
}

// Clase Veterinario (dependencia fuerte con Perro)
class Veterinario {
  // Método que depende de Perro
  chequear(perro) {
    console.log(`El veterinario está chequeando a ${perro.nombre} (${perro.raza}).`);
    console.log(`Color del collar: ${perro.getColorCollar()}`);
    console.log("Juguetes:");
    perro.listarJuguetes();
  }
}

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Rojo");
const juguete1 = new Juguete("Hueso de goma");
const juguete2 = new Juguete("Pelota");

miPerro.agregarJuguete(juguete1);
miPerro.agregarJuguete(juguete2);

const veterinario = new Veterinario();
veterinario.chequear(miPerro); // Dependencia fuerte: Veterinario usa Perro
```


### **Código en JavaScript (Funciones Constructoras)**
```js
// Simulación de la interfaz Sonido (en JavaScript no existe "interface")
function Sonido() {
  if (this.constructor === Sonido) {
    throw new Error("No se puede instanciar una interfaz");
  }
  if (typeof this.hacerSonido !== "function") {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Función constructora para la clase base (Animal)
function Animal(nombre) {
  Sonido.call(this); // Verifica que se implemente la interfaz
  this.nombre = nombre;
}

// Implementación del método de la interfaz
Animal.prototype.hacerSonido = function () {
  console.log(`${this.nombre} hace un sonido.`);
};

// Función constructora para Collar (parte de Perro, relación de composición)
function Collar(color) {
  this.color = color;
}

Collar.prototype.getColor = function () {
  return this.color;
};

// Función constructora para Juguete (relación de agregación)
function Juguete(nombre) {
  this.nombre = nombre;
}

Juguete.prototype.getNombre = function () {
  return this.nombre;
};

// Función constructora para la clase derivada (Perro)
function Perro(nombre, raza, colorCollar) {
  Animal.call(this, nombre);
  this.raza = raza;
  this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
  this.juguetes = []; // Agregación: Perro puede tener varios Juguetes
}

// Establecer la herencia (Perro hereda de Animal)
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro;

// Método adicional para Perro
Perro.prototype.ladrar = function () {
  console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
};

// Método para obtener el color del collar
Perro.prototype.getColorCollar = function () {
  return this.collar.getColor();
};

// Método para agregar un juguete (agregación)
Perro.prototype.agregarJuguete = function (juguete) {
  this.juguetes.push(juguete);
};

// Método para listar los juguetes
Perro.prototype.listarJuguetes = function () {
  console.log(`Juguetes de ${this.nombre}:`);
  this.juguetes.forEach((juguete, index) => {
    console.log(`${index + 1}. ${juguete.getNombre()}`);
  });
};

// Función constructora para Veterinario (dependencia fuerte con Perro)
function Veterinario() {}

// Método que depende de Perro
Veterinario.prototype.chequear = function (perro) {
  console.log(`El veterinario está chequeando a ${perro.nombre} (${perro.raza}).`);
  console.log(`Color del collar: ${perro.getColorCollar()}`);
  console.log("Juguetes:");
  perro.listarJuguetes();
};

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Azul");
const juguete1 = new Juguete("Hueso de goma");
const juguete2 = new Juguete("Pelota");

miPerro.agregarJuguete(juguete1);
miPerro.agregarJuguete(juguete2);

const veterinario = new Veterinario();
veterinario.chequear(miPerro); // Dependencia fuerte: Veterinario usa Perro
```

## **6. Relación de Asociación** <a name="relación-de-asociación"></a>

### **Diagrama de Clases en UML**

<table>
  <tr>
    <th>Diagrama Renderizado</th>
    <th>Código PlantUML sin Renderizar</th>
  </tr>
  <tr>
  <td>
      
  ```plantuml
      @startuml
      interface Sonido {
        + hacerSonido()
      }

      class Animal {
        - nombre: String
        + hacerSonido()
      }

      class Perro {
        - raza: String
        - collar: Collar
        - juguetes: Array
        + ladrar()
        + agregarJuguete(Juguete)
        + listarJuguetes()
      }

      class Collar {
        - color: String
        + getColor()
      }

      class Juguete {
        - nombre: String
        + getNombre()
      }

      class Veterinario {
        + chequear(Perro)
      }

      class Dueño {
        - nombre: String
        - perros: Array
        + agregarPerro(Perro)
        + listarPerros()
      }

      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      Perro o-- Juguete
      Veterinario ..> Perro
      Dueño --> Perro
      @enduml
  ```

  </td>
  <td>
      <!-- Columna 2: Código PlantUML sin renderizar -->
  <pre>

      @startuml
      interface Sonido {
        + hacerSonido()
      }
      
      class Animal {
        - nombre: String
        + hacerSonido()
      }
      
      class Perro {
        - raza: String
        - collar: Collar
        - juguetes: Array
        + ladrar()
        + agregarJuguete(Juguete)
        + listarJuguetes()
      }
      
      class Collar {
        - color: String
        + getColor()
      }
      
      class Juguete {
        - nombre: String
        + getNombre()
      }
      
      class Veterinario {
        + chequear(Perro)
      }
      
      class Dueño {
        - nombre: String
        - perros: Array
        + agregarPerro(Perro)
        + listarPerros()
      }
      
      Sonido <|.. Animal
      Animal <|-- Perro
      Perro *-- Collar
      Perro o-- Juguete
      Veterinario ..> Perro
      Dueño --> Perro
      @enduml

  </pre>
  </td>
  </tr>
</table>

### **Código en JavaScript (Clases)**
```js
// Definición de la interfaz (en JavaScript no existe "interface", se simula con clases)
class Sonido {
  hacerSonido() {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Clase base (Animal) que implementa la interfaz Sonido
class Animal extends Sonido {
  constructor(nombre) {
    super();
    this.nombre = nombre;
  }

  // Implementación del método de la interfaz
  hacerSonido() {
    console.log(`${this.nombre} hace un sonido.`);
  }
}

// Clase Collar (parte de Perro, relación de composición)
class Collar {
  constructor(color) {
    this.color = color;
  }

  getColor() {
    return this.color;
  }
}

// Clase Juguete (relación de agregación)
class Juguete {
  constructor(nombre) {
    this.nombre = nombre;
  }

  getNombre() {
    return this.nombre;
  }
}

// Clase derivada (Perro)
class Perro extends Animal {
  constructor(nombre, raza, colorCollar) {
    super(nombre);
    this.raza = raza;
    this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
    this.juguetes = []; // Agregación: Perro puede tener varios Juguetes
  }

  // Método adicional
  ladrar() {
    console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
  }

  // Método para obtener el color del collar
  getColorCollar() {
    return this.collar.getColor();
  }

  // Método para agregar un juguete (agregación)
  agregarJuguete(juguete) {
    this.juguetes.push(juguete);
  }

  // Método para listar los juguetes
  listarJuguetes() {
    console.log(`Juguetes de ${this.nombre}:`);
    this.juguetes.forEach((juguete, index) => {
      console.log(`${index + 1}. ${juguete.getNombre()}`);
    });
  }
}

// Clase Veterinario (dependencia fuerte con Perro)
class Veterinario {
  // Método que depende de Perro
  chequear(perro) {
    console.log(`El veterinario está chequeando a ${perro.nombre} (${perro.raza}).`);
    console.log(`Color del collar: ${perro.getColorCollar()}`);
    console.log("Juguetes:");
    perro.listarJuguetes();
  }
}

// Clase Dueño (asociación con Perro)
class Dueño {
  constructor(nombre) {
    this.nombre = nombre;
    this.perros = []; // Asociación: Dueño puede tener varios Perros
  }

  // Método para agregar un perro
  agregarPerro(perro) {
    this.perros.push(perro);
  }

  // Método para listar los perros
  listarPerros() {
    console.log(`Perros de ${this.nombre}:`);
    this.perros.forEach((perro, index) => {
      console.log(`${index + 1}. ${perro.nombre} (${perro.raza})`);
    });
  }
}

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Rojo");
const juguete1 = new Juguete("Hueso de goma");
const juguete2 = new Juguete("Pelota");

miPerro.agregarJuguete(juguete1);
miPerro.agregarJuguete(juguete2);

const veterinario = new Veterinario();
veterinario.chequear(miPerro); // Dependencia fuerte: Veterinario usa Perro

const dueño = new Dueño("Juan");
dueño.agregarPerro(miPerro);
dueño.listarPerros(); // Asociación: Dueño tiene Perros
```


### **Código en JavaScript (Funciones Constructoras)**
```js
// Simulación de la interfaz Sonido (en JavaScript no existe "interface")
function Sonido() {
  if (this.constructor === Sonido) {
    throw new Error("No se puede instanciar una interfaz");
  }
  if (typeof this.hacerSonido !== "function") {
    throw new Error("Método hacerSonido() debe ser implementado");
  }
}

// Función constructora para la clase base (Animal)
function Animal(nombre) {
  Sonido.call(this); // Verifica que se implemente la interfaz
  this.nombre = nombre;
}

// Implementación del método de la interfaz
Animal.prototype.hacerSonido = function () {
  console.log(`${this.nombre} hace un sonido.`);
};

// Función constructora para Collar (parte de Perro, relación de composición)
function Collar(color) {
  this.color = color;
}

Collar.prototype.getColor = function () {
  return this.color;
};

// Función constructora para Juguete (relación de agregación)
function Juguete(nombre) {
  this.nombre = nombre;
}

Juguete.prototype.getNombre = function () {
  return this.nombre;
};

// Función constructora para la clase derivada (Perro)
function Perro(nombre, raza, colorCollar) {
  Animal.call(this, nombre);
  this.raza = raza;
  this.collar = new Collar(colorCollar); // Composición: Perro tiene un Collar
  this.juguetes = []; // Agregación: Perro puede tener varios Juguetes
}

// Establecer la herencia (Perro hereda de Animal)
Perro.prototype = Object.create(Animal.prototype);
Perro.prototype.constructor = Perro;

// Método adicional para Perro
Perro.prototype.ladrar = function () {
  console.log(`${this.nombre} (${this.raza}) está ladrando: ¡Guau guau!`);
};

// Método para obtener el color del collar
Perro.prototype.getColorCollar = function () {
  return this.collar.getColor();
};

// Método para agregar un juguete (agregación)
Perro.prototype.agregarJuguete = function (juguete) {
  this.juguetes.push(juguete);
};

// Método para listar los juguetes
Perro.prototype.listarJuguetes = function () {
  console.log(`Juguetes de ${this.nombre}:`);
  this.juguetes.forEach((juguete, index) => {
    console.log(`${index + 1}. ${juguete.getNombre()}`);
  });
};

// Función constructora para Veterinario (dependencia fuerte con Perro)
function Veterinario() {}

// Método que depende de Perro
Veterinario.prototype.chequear = function (perro) {
  console.log(`El veterinario está chequeando a ${perro.nombre} (${perro.raza}).`);
  console.log(`Color del collar: ${perro.getColorCollar()}`);
  console.log("Juguetes:");
  perro.listarJuguetes();
};

// Función constructora para Dueño (asociación con Perro)
function Dueño(nombre) {
  this.nombre = nombre;
  this.perros = []; // Asociación: Dueño puede tener varios Perros
}

// Método para agregar un perro
Dueño.prototype.agregarPerro = function (perro) {
  this.perros.push(perro);
};

// Método para listar los perros
Dueño.prototype.listarPerros = function () {
  console.log(`Perros de ${this.nombre}:`);
  this.perros.forEach((perro, index) => {
    console.log(`${index + 1}. ${perro.nombre} (${perro.raza})`);
  });
};

// Ejemplo de uso
const miPerro = new Perro("Rex", "Pastor Alemán", "Azul");
const juguete1 = new Juguete("Hueso de goma");
const juguete2 = new Juguete("Pelota");

miPerro.agregarJuguete(juguete1);
miPerro.agregarJuguete(juguete2);

const veterinario = new Veterinario();
veterinario.chequear(miPerro); // Dependencia fuerte: Veterinario usa Perro

const dueño = new Dueño("Juan");
dueño.agregarPerro(miPerro);
dueño.listarPerros(); // Asociación: Dueño tiene Perros
```

## **7. Preguntas Frecuentes** <a name="preguntas-frecuentes"></a>

### **¿Cuál es la diferencia entre <code>..></code> y <code>--></code>?**
<code>..></code>: Representa una **dependencia** (relación débil y temporal).

<code>--></code>: Representa una **asociación** (relación fuerte y permanente).

### **¿Cuándo usar <code>o--</code> en lugar de <code>--></code>?**

<code>o--</code>: Se usa para relaciones de **agregación** (todo-parte, donde la parte puede existir independientemente).

<code>--></code>: Se usa para relaciones de **asociación** (relaciones genéricas entre clases).


