- 7 líneas que hay que saber
  - 12 cambios increíbles de CSS (lo siento Tailwind)
    - https://www.youtube.com/watch?v=RhZPNVshYWI
    - https://moderncss.dev/12-modern-css-one-line-upgrades/
  - ## aspect-ratio: 16/9
  - margin-inline: auto
    - te ahorra hacer el margin-left: auto y margin-right: auto.
  - color-schema: dark light
    - Manejar modo oscuro.
  - accent-color
    - darle colores a los controles de los formularios.
  - fit-content
    - with: fit-content
      - de esa forma toma el ancho del contenido.
  -
- Uno al lado de otro hacer
  - .comp1 + .comp1 {
    margin-top:8px;
    }
- Modo oscuro
  - :root {
    color-scheme: dark light;
    }
  - Modo oscuro con html, css y Javascript
    - https://www.youtube.com/watch?v=OCO2FTVapSo
- Centrar

  - Position Absolute

    - <body>
      	<div class="pulse"></div>
      </body>
      *,
      *::before,
      *::after {
      	padding: 0;
      	margin: 0;
      	box-sizing: border-box;
      }

    body {
    background-color: #e5e5fa;
    }

    .pulse {
    background: linear-gradient(#8a82fb, #407ed7);
    width: 150px;
    height: 150px;
    position: absolute;
    margin: auto;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
    }

  - Position Absolute
    .container {
    position: absolute;
    transform: translate(-50%, -50%);
    top: 50%
    left: 50%
    }
  - Icono campana
    - .pulse {
      font-size: 50px;
      display: grid;
      place-items: center;
      }

- Icono

  - icons que prefiere Midudev:
    - Buscar tabler icons
      - https://tabler.io/icons
      - Solo se copia el svg y se pega (https://www.youtube.com/watch?v=RB5tR_nqUEw&t=2223s)
      -
  - Campana
    - Ir a font awesome 5 cdn
      - https://cdnjs.com/libraries/font-awesome
    - Poner link
      - <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
        </head>
    - Ir a font awesome icons
      - https://fontawesome.com/v4/icons/
    - Colocar bell en div
    <div class="pulse">
    	<i class="fa fa-bell" aria-hidden="true"></i>
    </div>
  - Pulsar

    - Coding Artist:CSS Pulse Animation | CSS Animation Tutorial
    - https://www.youtube.com/watch?v=SDJUbYU3Pzc
    - HTML
    <head>
    	<link
    	rel="stylesheet"
    	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
    	/>
    	<link rel="stylesheet" href="style.css" />
    </head>
    <body>
    	<div class="pulse">
    	<i class="fa fa-bell" aria-hidden="true"></i>
    	</div>
    </body>
    - CSS

      _,
      _::before,
      \*::after {
      padding: 0;
      margin: 0;
      box-sizing: border-box;
      }

      body {
      background-color: #e5e5fa;
      }

      .pulse {
      background: linear-gradient(#8a82fb, #407ed7);
      width: 150px;
      height: 150px;
      position: absolute;
      margin: auto;
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      border-radius: 50%;

      font-size: 50px;
      display: grid;
      place-items: center;

      color: #fff;
      }

      .pulse::before,
      .pulse::after {
      content: "";
      width: 100%;
      height: 100%;
      position: absolute;
      background-color: #8a82fb;
      border-radius: 50%;
      z-index: -1;
      opacity: 0.2;
      }

      /_ .pulse::after {
      background-color: #e64607;
      } _/

      .pulse::before {
      animation: pulse 2s ease-out infinite;
      }

      .pulse::after {
      animation: pulse 2s 1s ease-out infinite;
      }

      @keyframes pulse {
      100% {
      transform: scale(2.5);
      opacity: 0;
      }
      }

- Grid responsive

  - .products ul {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 1rem;
    }

- Animación scroll

  - Midulive 58.56: https://www.youtube.com/watch?v=HEMvsJTBweY&t=1482s
    html {
    scroll-behavior: smooth;
    }
    @media (prefers-reduced-motion:reduce) {
    html {
    scroll-behavior: auto; //con esto hacemos que si las animaciones están desactivadas por el usuario, estas no se produzcan.
    }
    }

- Imágenes
  - Manejo de imágenes
    - Shots.so
  - Optiminzar
    - https://squoosh.app/
  - optimizar y minificar
    - https://svgomg.net/ (optimizar, mejorar, imagenes)
      - Usado por [midudev_16.31](https://www.youtube.com/watch?v=BVnhDlbhPvs&list=PLUofhDIg_38rXS6QJDOQky5sYU-hQKwRv)
- Tailwind
  - Componentes
    - Flowbite (https://flowbite.com/docs/getting-started/introduction/)
      - TimeLines (https://flowbite.com/docs/components/timeline/)
- FLEX

  - flex-flow: column wrap
    - Es una unificación de
      - flex-direction
      - flex-wrap
  - pérdida de datos
    - align-contente: safe center
  - Alinerar con la fuente
    - aling-items
      - baseline
      - last baseline.
  - Propiedades de los hijos
    - Order
      - solo lo hace visualmente en el html se mantiene.
    - flex-basis
      - Tamaña que va a tener un hijo dentro de un contenedor flexible antes que el espacio residual se haya terminado.
    - flex-grow
      - tomar el valor residual
      - Valor de 1: que ocupe todo el espacio disponible.
    - flex-shrink
      - Como el grow pero para encoger
      - Valor de :
        - 0
          - Que no se encojan
        - 1
          - Es el valor x defecto.
          - si ponemos a los otros 0 y el que tenga 1 será el que se encoja.
        - 2
          - Que se encoja el doble de rápido.
    - flex
      - Es la combinación de flex-basis, flex-grow, flex-shrink
      - Valor
        - 1
          - flex-grow: 1
          - flex-shrink: 1
          - flex-basis: 1
    - align-self
      - flex-end
        - se pondrá ese en particular al final.
  - Un ejemplo clásico de plantilla.

    - Aprende CSS Flexbox - Curso desde Cero

      - 46.22: https://www.youtube.com/watch?v=iwFEc6I8wSA

        - Menu menu
        - Aside Central
        - Aside Central
        - Aside Central
        - Aside Central
        - Footer footer

        - html
        <div class="contenedor-general>
        	<nav>
        		<ul>
        			<li><a>Menu 1</a></li>
        			<li><a>Menu 2</a></li>
        			<li><a>Menu 3</a></li>
        		</ul>
        	</nav>
        	<div class="contenedor-central>
        		<aside>
        			<h2>Menu Lateral</h2>
        		</aside>
        		<main>
        			<p>Lorem ipsum....</p>
        			<section class="contenedor-columnas">
        			  <article>
        			    <h2>titulo</h2>
        			    <p>Lorem ipsum....</p>
        			  </article>
        			  <article>
        			    <h2>titulo</h2>
        			    <p>Lorem ipsum....</p>
        			  </article>
        			  <article>
        			    <h2>titulo</h2>
        			    <p>Lorem ipsum....</p>
        			  </article>
        			  <article>
        			    <h2>titulo</h2>
        			    <p>Lorem ipsum....</p>
        			  </article>
        			</section>
        		</main>
        	</div >
        	<footer>
        		<h2>footer</h2>
        	</footer>
        </div >
        - css
          aside { background-color: aqua;}
          main { background-color: orange;}
          footer { background-color: grennyellow;}

          //Menu inicio
          a {
          text-decoration: none;
          color: inherit
          }
          ul {
          background-color: lihthgray;
          list-style: none;
          margin: 0;
          padding: 0;
          }
          li {
          color: rgb(52,52,52);
          padding: 0.5rem 0.7rem;
          }
          li:hover {
          background-color: rgb(52,52,52);
          color: white);
          }

          // ademas las 2 media querys.

          //Menu fin

          .contenedor-general {
          display: flex;
          flex-direction: column;
          height: 100vh;
          }

          .contenedor-central {
          flex: 1; // como en contenedor-general tenemos height: 100vh, este hará que el central crezca a todo y el menu y footer se queden en sus tamaños.
          display: flex; // uno junto al otro.
          }

          .contenedor-central > aside {
          flex-basis: 30rem; // esto hace que tenga una tamaño base.
          }

          .contenedor-columnas{
          display: flex;
          gap: 2rem
          flex-wrap: wrap;
          }

          .contenedor-columnas > \* {
          background-color: white;
          flex-basis: 30%
          flew-grow: 1;
          }

          @media (width < 1024px) {
          li {
          flew-grow: 1;
          }
          }

          @media (width < 480px) {
          ul {
          flew-direction: column;
          }
          .contenedor-central {
          flew-direction: column;
          }
          .contenedor-central > aside {
          flew-basis: auto;
          }
          .contenedor-central > main {
          flew-grow: 1;
          }
          }

- faveicons (modo_oscuro / modo_claro)

  - [midudev_18.03](https://www.youtube.com/watch?v=BVnhDlbhPvs&list=PLUofhDIg_38rXS6QJDOQky5sYU-hQKwRv)

    ```javascript
      <svg xmlns..... />
      <style>
        path {fill: #000;} // Por defecto modo oscuro
        @media (prefers-colors-scheme: dark){
          path {fill: #FFF}
        }
      </style>
    ```

- Fuentes

  - [midudev_18.03](https://www.youtube.com/watch?v=BVnhDlbhPvs&list=PLUofhDIg_38rXS6QJDOQky5sYU-hQKwRv)

    - Ir a jost fontsource
      - npm fontsource/jost

- Convert svg to component

  - [midudev_24.43](https://www.youtube.com/watch?v=BVnhDlbhPvs&list=PLUofhDIg_38rXS6QJDOQky5sYU-hQKwRv)

    - Crearlo

      ```javascript
        <svg
          class = {Astro.props.class} // Esto se aumentó.
          xmlns..... />
      ```

    - Usarlo
      ```javascript
        ---
          import HeroLogo from "@/.../HeroLogo.astro"
        ---
        <section>
          <HeroLogo />
        </section>
      ```

- Hora cambia de acuerdo a lugar

  - [midudev_50.58](https://www.youtube.com/watch?v=BVnhDlbhPvs&list=PLUofhDIg_38rXS6QJDOQky5sYU-hQKwRv)

    - Ir a "https://www.epochconverter.com/"
      - Colocar fecha y hora original
      - Presionar "Human date to TimeSpam"
      - Seleccionar la de milisegundos
    - Crearlo

      ```javascript
        <span>
        <script is:inline>
          const END_DATE: 1709589600000 //hora que será el evento utilizando epchoconverter.
          const d= new Date(END_DATE)
          const date = d.toLocaleTimeString("es", {
            hour: "2-digit",
            minute: "2-digit",
          })

          //get current timezone
          const tzOffset = d.getTimezoneOffset() / 60;
          const diff = tzOffset * -1;
          const gmt = diff > 0 ? `GMT + ${dif}` : `GMT - ${Math.abs(dif)}`

          const TZ_DICTIONARY = {
            "GMT+1": "CET"
          }

          const tz = TZ_DICTIONARY[gmt] ?? gmt

          const selfScript = document.currentScript
          selfScript.parentNode.innerHTML = `${date} ${tz}`
        </script>
        </span>
      ```

    - Usarlo
      ```javascript
        ---
          import HeroLogo from "@/.../HeroLogo.astro"
        ---
        <section>
          <HeroLogo />
        </section>
      ```
