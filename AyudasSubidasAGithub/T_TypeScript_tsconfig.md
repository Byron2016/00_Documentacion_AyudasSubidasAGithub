- module vs moduleResolution

  - https://stackoverflow.com/questions/72597681/trying-to-understand-how-module-moduleresolution-differ#answer-72599201

    - moduleResolution

      - Determina el algoritmo usado para [encontrar/resolver](https://www.typescriptlang.org/docs/handbook/modules/theory.html#module-resolution) módulos. x ejem: buscar en node_modules o buscando en paths relativos.

    - Module

      - Determina el tipo de import/export [usado] (https://www.typescriptlang.org/tsconfig/#module).

      - node12/nodenext : El JavaScript emitido utiliza la salida CommonJS o ES2020 según la extensión del archivo y el valor de la configuración de tipo en el package.json más cercano. La resolución del módulo también funciona de manera diferente. Puede obtener más información en el manual

  - https://www.typescriptlang.org/docs/handbook/modules/theory.html#module-format-detection

    - moduleResolution
      - The process of finding the file referenced by a module specifier is called module resolution.

  - A horrifically deep dive into TypeScript module resolution
    - https://www.youtube.com/watch?v=MEl2R7mEAP8
      - Video que tiene los diferentes casos con ejemplos.
        - https://github.com/IanVS/ts-module-resolution-examples

- ambient modules / definitely tiped (https://www.youtube.com/watch?v=MEl2R7mEAP8&t=2757s)

  - Agregar definición de tipos a un proyecto que no fue escrito en TypeScript

  - en node_modules se tiene una carpteta @types

- Clousere
  - ¿Qué es un closure en Javascript?
    - https://www.freecodecamp.org/espanol/news/que-es-un-closure-en-javascript/
      - Las funciones pueden acceder valores fuera de su contexto
      - ¿Por qué usamos funciones?
      - ¿Pero dónde está el closure aquí?
      - ¿Qué puedo hacer con closures?
        - Expresión de Función Inmediatamente invocada - Immediately-invoked Function Expression (IIFE)
        - Function Factory
        - Currying (multiplicar(1)(2)(3);)
        - Event Listeners