- Intersection Observer

  - **Casos uso**

    - Lazy Loading
    - Infinite scroll
    - ad-viewability: Rastrear anuncios si son vistos y su costo.
    - reveal-effect

  - **Funcionamiento** [Binland: Domina Intersection Observer en JavaScript 🚀 | Guía Completa y casos de uso](https://www.youtube.com/watch?v=cmrPbXXYyDI)

    - **Llamado general**

    ```js
    // Es un objeto que recibe en su constructor dos parámetros
    // un callback
    // un objeto de funciones
    const observer = new IntersectionObserver(callback, options);
    ```

    - **options**

    ```js
    // Es un objeto literal,
    // root: por default será el viewport
    // rootMargin: indica que tanto del root debe tomar en cuenta.
    // rootMargin: 0% 0% 0% 0%
    // área más grande: rootMargin: 10px 10px 10px 10px
    // Área más pequeña rootMargin: -10px -10px -10px -10px
    // threshold: es el valor de intersección, por defecto es 0, pero puede ser una matriz [0, 0.5 , 1]

    const options = {
      root: null,
      rootMargin: "0px",
      threshold: 0,
    };
    ```

    - **call back**

    ```js
    //
    const callback = (entries) => {
      entries.foreach((entri) => {
        if (entry.isIntersecting) {
          // código
        }
      });
    };
    ```

    - **Llamado**

    ```js
    //
    observer.observe(element);
    // o para varios
    elements.foreach((element) => {
      observer.observe(element);
    });
    ```

    - **Ejemplo**

    ```js
    const $images = document.querySelectorAll(".hidden");
    const observer = new IntersectionObserver(
      (entries) => {
        entries.foreach((entri) => {
          if (entry.isIntersecting) {
            entry.target.classList.add("reveal");
          }
        });
      },
      { rootMargin: "10px" }
    );
    $images.foreach((image) => {
      observer.observe(image);
    });
    ```
