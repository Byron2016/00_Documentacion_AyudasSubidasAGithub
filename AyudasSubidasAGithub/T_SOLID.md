- SOLID
  - **Principio de inyección de dependencias**
    - [AlbertHernandez: Tutorial Node.js | Contenedor de Dependencias con Awilix](https://www.youtube.com/watch?v=3-d3HjOMEng)
      - Las clases de alto nivel no deben depender de las clases de bajo nivel. Ambas deben depender de abstracciones. Las abstracciones no deben depender de detalles, los detalles deben depender de abstracciones
- IOC vs DI

  - [makigas: Diferencias entre "inversión de control" e "inyección de dependencia"](https://www.youtube.com/watch?v=dc37-3EmY3Q)
    - La **Dependency Injection** es un tipo de **Inversion of Control**
  - [makigas_blog:Inversión de Control e Inyección de dependencia no son lo mismo](https://www.makigas.es/series/patrones-de-diseno/diferencia-inversion-control-inyeccion-dependencia?ref=shortlink)

  - [El artículo de IoC de Martin Fowler](https://www.martinfowler.com/bliki/InversionOfControl.html)

    - IoC
      - also known as the Hollywood Principle - “Don't call us, we'll call you”
      - Es una parte clave que nos ayuda a entender la diferencia entre un framework y una librería.
        - Una librería es básicamente una serie de funciones que el usuario llama según sus necesidades, cada llamada hace algo y retorna el control al cliente.
        - Un framework incorpora un diseño abstracto con más comportamientos incorporados. Para poder usarlo, debes insertar tu comportamiento en varios lugares del framework, ya sea mediante subclases o conectando tus propias clases. El código del framework luego llama a tu código en estos puntos.

  - [DevFoss: ¿Qué son y qué no la inversión del control y la inyección de dependencias?](https://www.youtube.com/watch?v=x72VxdlwOqY)
