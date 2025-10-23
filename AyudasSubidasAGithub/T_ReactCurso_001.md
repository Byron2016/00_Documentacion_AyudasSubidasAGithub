- REACTJS
  - **Bibliotecas de React** midu
    - Router → Wouter
    - Gráficas → Nivo
    - i18n → react-i18next
    - Iconos → Tabler Icons
    - Drag'n'Drop → DnDKit
    - Estilos → TailwindCSS
    - Notifications → Sonner
    - Animaciones → Motion
    - Estado en URL → nuqs
    - 3D → React Three Fiber
    - Formularios → Conform
    - Estado global → Zustand
    - Autenticación → Better Auth
    - Componentes UI → Shadcn UI
    - Data Fetching → Tanstack Query
    - Testing → Vitest + testing-library

  - Deploy
    - netlify drop
  - Curso Universidad Helsinsky
    - https://fullstackopen.com/es/
      - Discord:
        - https://study.cs.helsinki.fi/discord/join/fullstack
          - https://discord.com/channels/757581218085863474/867514950254985227
      - Telegram
        - https://t.me/fullstackcourse.
      - Código fuente
        - MarkDown
          - https://github.com/fullstack-hy2020/fullstack-hy2020.github.io/edit/source/src/content/0/es/part0a.md
  - Preguntas típicas de react
    - https://github.com/midudev/preguntas-entrevista-react

  "repository": {
  "type": "git",
  "url": "git+https://github.com/Byron2016/027_React_Helsinki_001_001_EjerciciosExistentes"
  },

- Hooks

  - Listado

    - use
    - useCallback
    - useContext
    - useDebugValue
    - useDeferredValue
    - useEffect
    - useId
    - useImperativeHandle
    - useInsertionEffect
    - useLayoutEffect
    - useMemo
    - useOptimistic (exp)
    - useReducer
    - useRef
    - useState
    - useSyncExternalStore
    - use Transition

    - Custom Hooks.

  - Explicación

    - use
    - useCallback

      - Lo mismo que el "useMemo" pero pensado para función, es decir permite retornar una función.

      - OJO: ver useCallback

    - useContext

      - Crear Context: Es algo que está totalmente separado de nuestro arbol de componentes.
        - import {createContext} from 'react'
          export const FiltersContext = createContext()
      - Usa un FilterProvider

        - export function FilterProvider({ children })
          {
          const [filters, setFilters] = useState({category:'all', minPrice: 0})

          return (
          <FiltersContext.Provider value = {{
               // VALOR QUE TENDRÁ EL CONTEXTO.
          	 // Información que vamos a querer acceder.
          	 filters, setFilters
            }}>

              { children }

          <FiltersContext.Provider/>
          )
          }

        - <FilterProvider>
            <App />
          </FilterProvider>

      - Consume el contexto.
        - const filters = const {filters, setFilters} = useContext(FiltersContext)
        - const {filters, setFilters} = useContext(FiltersContext)
      - Se usa para estados que cambien poco y que no sean grandes.

      - Alternativas
        - Redux . NOK no recomienda.
        - Zustand. OK
      - 2 fuentes de la verdad Midulive V6 1.00.00

    - useDebugValue
    - useDeferredValue
    - useEffect
      - Es un hook que nos permite ejecutar código arbitrario cuando el componente se monta en el DOM y cada vez que cambian las dependencias que nosotros le digamos.
      - Dependencias
        - No pone
          - Se ejecuta cada vez que se renderiza el componente.
        - En blanco
          - Se ejecuta una vez.
        - [a,b,c]
          - cuando cambia cualquiera sea a,b o c.
      - Limpiar efectos
        - useEffect puede devolver una función y esta se ejecuta cuando
          - Se desmonta el componente
          - Cuando cambia la dependencia antes de ejecutar nuevamente el efecto.
    - useId
      - Identificador único. Midulive V6 36.00
    - useImperativeHandle
    - useInsertionEffect
    - useLayoutEffect
    - useMemo

      - Hock que guarda un valor para no tenerlo que volver a calcular dependiendo de unas dependencias. Midulive V5 1.39.26

      - useMemo(callback a ejecutar, [dependencias ])

      - Usarlo con cuidado, asegurar q se tiene problema de rendimiento.

      - OJO: ver useCallback

    - useOptimistic (exp)
    - useReducer

      - Hook que nos permite manejar el estado de una manera escalable por que se basa en que recibe en una función el estado actual y acción que debe hacer. Y a partir del estado actual y acción que debe hacer lo que hace es devolverte el nuevo estado. Y esto está totalmente separado del componente, del provider y del custum hook.
      - Pasos

        - Definir el estado inicial
        - const reducer = (state, action) => {.... return state}
        - Llamar al reducer

          - const [state, dispatch] = useReducer(reducer, initialState)

          - const addToCard = product => dispatch({
            type: 'ADD_TO_CARD'
            payload: product
            })

    - useRef

      - Hook que te permite crear una referencia MUTABLE que persiste durante todo el ciclo de vida de tu componente, sirve para guardar cualquier valor que puedas mutar y que cada vez que cambia no vuelve a renderizar el componente. Esta es la diferencia con el useState (cada vez que cambia useState vuelve a renderizar el componente) Midulive v5 34.02

      - OJO: cuando CAMBIA NO RENDERIZA NUEVAMENTE EL COMPONENTE.

      - Alternativa usar directamente event. minuto. 37

      - Se muestra alternativa de uso de useRef para evitar por ejemplo se desplieguen errores en el primer renderizado.

    - useState
    - useSyncExternalStore
    - use Transition

    - Custom Hooks.
      - Es reutilizar lógica de nuestros componentes en diferentes componentes.
      - función, en el nombre debe iniciar con useXxxxx
        - function useXxxxx({fact}){
          useState
          useEffect
          ....
          return imagUrl
          }
      - si se ve un useEffect en un componente de react preguntarse si no debería ser puesto en un custom hook.

- APIs
  - Lazy (https://es.react.dev/reference/react/lazy)
    - Pasar del import estático a import dinámico.
      - Estático
        - import About from './pages/About.jsx'
    - import { lazy } from 'react'
      const LazyAboutPage = lazy(() => import About from './pages/About.jsx')
      <main>
        <Suspence fallback={<div>Loading...</div>}>
        <Route path='/about' Componente = {LazyAboutPage} />
      </Suspence>
      </main>
- Legacy React APIs (https://react.dev/reference/react/legacy)
  - Children
- Razones
  - Más usada en todo el mundo
  - React Native aplicaciones móviles
  - Mantenimiento asegurado
  - Ayudar con resto de frameworks
  - Futuro prometedor, no para de subir. (npm trents)
  - Su API es estable (misma sintaxis)
  - Comunidad grande.
- Tips

  - Ayuda
    - https://www.reactjs.wiki/
  - Primeros pasos

    - import ReactDOM from 'https://esm.sh/react-dom@18.2.0/client'
      const appDomElement = document.getElementById("app")
      const root = ReactDOM.createRoot(appDomElement)
      root.render("xxxxx")
    - import ReactDOM from 'https://esm.sh/react-dom@18.2.0/client'
      import React from "https://esm.sh/react-dom@18.2.0"
      const appDomElement = document.getElementById("app")
      const root = ReactDOM.createRoot(appDomElement)
      const button = React.createElement('button', null, "me gusta")

      root.render(button)

  - Expresiones (devuelven un valor)
    - const name = "xxx";
      <h1>hola, {name}</h1>
  - Declaraciones
    - If no devuelve un valor.
    - If no es expresión es declaración.
  - Atributos

    - en jsx va en camelCase
      - tabIndex = "1"

  - Vite
    - Es un empaquetador de aplicaciones web
    - Alternativas
      - Create React App
  - Parámetros

    - Parámetro nombrado

      - const createButton = ({nombreParametro}) =>{ return ()}

      - llamada
        - {createButton({ nombreParametro : 'Button1'})

  - Componente
    - Deben ser PascalCase
    - const Button = ({nombreParametro}) =>{}
    - llamada
      <Button nombreParametro="Button 1" />
  - Estilos

    - Se los coloca entre dos style={{display: "flex"}}
    - camelCase
    - className

    - Metodología
      - Swift (recomendada)
        - tw- (prefijo)
          - tw-followCard
          - tw-followCard-header
          - tw-followCard-avatar
          - tw-followCard-info
          - tw-followCard-infoUserName
          - tw-followCard-button
      - BEM
      -

  - Pasar función desde afuera (pasar función como parámetro)
    - const formatUserName = (userName) => `@${userName}`
    - Pasar
      - <Componente {formatUserName}.... />
      - OJO q se le pasa la función NO la ejecución fun()
    - Invocar
      <span ...>{formatUserName(userName)}</span>
  - Diferencia entre elemento y componente
    - Componente es una factoría de elementos.
    - Elemento es lo que renderiza el componente.
    - Los elementos crean componentes y lo que renderiza es elementos.
  - Props
    - DEBEN SER INMUTABLES.
      - ESTA MAL:
        - propA = "pepito"
    - children
      - solo hay uno.
    - X defecto
      - ({userName = "xxxx"})
    - Pasar props como objeto (no recomendado)
      - Rest operator
        - <XXX {...objeto}/>
  - Renderizado condicional
    - const text = isFollowing ? 'Siguiendo' : 'Seguir';
  - eventos
    - En el componente
      - importar useState
      - inicializar el estado
        const [isFollowing, setIsFollowing] = useState(false)
    - A través de un estado.
    - const handleClick = () => {
      setIsFollowing(!isFollowing)
      }
      <Buton onClick={handleClick} ... />
  - Renderizado
    - Componente padre propaga hacia abajo, lo que significa q al renderizarse el padre se renderizan todos sus hijos.
    - Cuando un componente hijo se renderiza.
  - Comentarios
    - En javaScript
      - /\* \*/
      - //
    - En el Return
      - {/\* \*/}
  - Inicializar estado con prop.
    - Padre pasa prop: "initialIsFollowing = true"
    - Hijo pone estado a esa prop.
      - const [isFo, setIsFo] = useState(initialIsFollowing)
  - Error al propagar el estado de padre al hijo.
    - Padre tiene un estado inicial.
    - Padre pasa su estado a través de props al hijo.
    - Hijo inicializa su propio estado con el estado pasado por prop desde el padre.
    - Padre cambia con un botón su estado
      - Hijo NO actualiza su estado.
    - Esto sucede x que el ESTADO INICIAL SOLO SE INICIA UNA VEZ.
      - No se propaga.
  - Twitter de seguir a siguiendo.
    - 2.09.26 https://www.youtube.com/watch?v=7iobxzd_2wY&t=2461s
  - Renderizar lista de elementos
    - Se debe poner key.
      npm i -D -E eslint eslint-plugin-react eslint-plugin-react-hooks eslint-plugin-react-refresh
  - No colocar "windows.addEventListener()" dentro del cuerpo de componente x q se ejecutaría cada vez que se renderiza, se lo debe poner dentro de useEffect.
    useEffect(() => {
    const handleMove = (event) => {
    const {clientX, clientY} = event
    }
    windows.addEventListener('pointermove', handleMove)
    return () => {
    windows.removeEventListener('pointermove', handleMove)
    }
    })

  - Analizar problema de eventos (Midulive 1.34.55 (https://www.youtube.com/watch?v=qkzcjwnueLA&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=2))
    - En la consola
      - getEventListeners(windows)
        - Esto para el comando en js
          - windows.addEventListener("pintermove", handleMove)
  - StrictMode
    - advertencias codigo antiguo, algo mal, ejecuta effecto, limpia y vuelve a ejecutar el efecto.
  - Poner en producción

    - npm run build
    - https://app.netlify.com/drop
    - Copiar la carpeta dist

    - Recomendados
      - Vercel
      - Netlify
      - redway
      - Render
      - fly.io

  - Paso Fetch a Async

    - Uno

      - fetch(URL)
        .then(res => res.json())
        .then(data => setFact(data.fact)
      - async function getRamdomFact(){
        const res = await fetch(URL)
        const json = await res.json()
        setFact(json.fact)
        }

      getRamdomFact()

    - Dos
      - export const getRamdomFact = () => {
        return fetch(URL)
        .then(res => res.json())
        .then(data => {
        const {fact} = data
        return fact
        })
        }
      - export const getRamdomFact = async () => {
        const res = await fetch(URL)
        const data = await res.json()
        const {fact} = data
        return fact
        }

  - Invocar método async
    - Con Await
      const handleClick = async () => {
      const newFact = await getRamdomFact()
      setFact(newFact)
      }
    - Con then
      const handleClick = () => {
      getRamdomFact().then(setFact)
      }
  - Fetch manejo errores

    - Generar error si existe problema con la respuesta.
      - fetch(URL)
        .then(res => {
        if (!res.ok) {
        setFactError('Problema con fetch.')
        }
        return res.json())
        }
        .then(data => setFact(data.fact)
    - Generar error si existe problema con la petición o con la respuesta
      - fetch(URL)
        .then(res => {
        if (!res.ok) throw new Error('Error fetching data')
        return res.json())
        }
        .then(data => setFact(data.fact)
        .catch((err) => {
        .....
        //
        //
        })
    - Test

      - npm init playwright@latest
      - Instalar la dependencia recomenada de VSC.
      - ERROR:

        - There are error in playwright configuration files.

          - Midulive 39.50 ((Custom Hooks + Testing con Playwright: Curso de React desde cero - Parte 4)[https://www.youtube.com/watch?v=x-LcbVw99o8&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=4])
            - Hay que cambiar el nombre del archivo "playwright.config.js" a "playwright.config.cjs"

        - Require is not defined
          - Cambiar de:
            - const { test, expect } = require("@playwright/test");
          - A:
            - import { test, expect } from "@playwright/test";

      - Ejecutar
        - npx playwright test

  -

- TODO

  - Revisar "custom elements"
  - Revisar en test que es E12
  - Revisar "custom errors" midudev lo ha dado en un directo.

  https://cataas.com/cat/says/hello
  https://cataas.comundefined

  https://cataas.com/cat/says/hello?size=50&color=red&json=true

  /cat/nzrzCnk0XJEieLzh/says/other

  https://cataas.com/cat/dGHQY0rqSzbmiaJO/says/other

  .then((response) => {
  const { \_id } = response
  const url = `/cat/${_id}/says/${threeFirstWords}`
  setImageUrl(url)

{
tags: [],
createdAt: '2022-05-24T05:17:18.848Z',
updatedAt: '2022-10-11T07:52:32.725Z',
validated: true,
owner: 'null'
file: '62c6a5ec303160017d5a376.jpeg',
mimetype: 'image/jpeg',
size: 409911,
\_id: 'nzrzCnk0XJEieLzh'
url: 'cat/nzrzcnk0XJEieLzh/says/Unlike,other,cat,'
}

{
tags: [ "cute"],
createdAt: "2020-11-30T20:45:52.482Z",
updatedAt: "2022-10-11T07:52:32.527Z",
mimetype: "image/jpeg",
size: 271904,
\_id: "7FJaGUdoeOoWhxMr"
}

https://cataas.com/cat/nzrzCnk0XJEieLzh/says/Unlike,other,cat,

https://cataas.com/cat?json=true

https://cataas.com/cat?json=true

---

- Borrar todos los node_modules
- Borrar pnpm-lock.yaml
- cd a 04
- pnpm i

~/AppData/Local/
ls -al ~/AppData/Local/pnpm-cache
ls -al ~/AppData/Local/pnpm-state
ls -al /d/.pnpm-store

rm -rf ~/AppData/Local/pnpm-cache
rm -rf ~/AppData/Local/pnpm-state
rm -rf /d/.pnpm-store

npm cache clean --force
npm cache verify

    "@vitejs/plugin-react": "^4.2.1",
    "vite": "^5.0.8"

rm -rf ./projects/01-twitter-follow-card/node_modules
rm -rf ./projects/02-tic-tac-toe/node_modules
rm -rf ./projects/03-mouse-follower/node_modules
rm -rf ./projects/04-react-prueba-tecnica/node_modules
rm -rf ./projects/05-react-buscador-peliculas/node_modules
rm -rf ./projects/06-shopping-cart/node_modules
rm -rf ./projects/07-midu-router/node_modules
rm -rf ./projects/08-todo-app-typescript/node_modules
rm -rf ./projects/09-google-translate-clone/node_modules
rm -rf ./projects/10-crud-redux/node_modules
rm -rf ./projects/11-typescript-prueba-tecnica/node_modules
rm -rf ./projects/11b-typescript-prueba-tecnica-with-react-query/node_modules
rm -rf ./projects/12-comments-react-query/node_modules
rm -rf ./projects/13-javascript-quiz-con-zustand/node_modules
rm -rf ./projects/14-hacker-news-prueba-tecnica/node_modules
rm -rf ./node_modules

rm -rf ./projects/07-midu-router/lib/components
rm -rf ./projects/07-midu-router/lib/utils

---

@midudev :+1: This PR looks great - it's ready to merge! :shipit:

04: [Fetching de datos - Custom Hooks - Testing con Playwright](https://www.youtube.com/watch?v=x-LcbVw99o8)

- [x] [cat json url](https://cataas.com/cat?json=true) no longer sends **url field**, instead it sends just a **\_id field**
- [ ] **TODO**: There are a problem that I was not able to fix: first time **fact** is empty and inside console there are a message: `GET https://cataas.comundefined/ net::ERR_NAME_NOT_RESOLVED`

---

![]

https://react.dev/reference/react/useState#my-initializer-or-updater-function-runs-twice

- Curso Midudev 2023

  - Github

    - Add first class () - 00f7905023644ae2c8c284b7df10594ec68babf5
    - First project (20230111) - d6e9e5818bacdf278215f8d75666501c8c18f3a5
    - Add standard linter (20230118)(V-02-01.16.41 - 02-tic-tac-toe) - 5052ac808ef929a503c66ab2f7af25cf276f5797
      - pnpm add standard -D -w (la -w es para que instale en la raíz del multipaquete)
      - add .gitignore
        - ignore:
          - package-lock.json
          - node_modules
      - add package.json
        "eslintConfig": {
        "extends": "./node_modules/standard/eslintrc.json"
        }
      - desactivar prettier
    - Add workspaces and README - 62c61b4b019ba6f547c37093cd101665db610320

  - 01 - CURSO REACT 2024 - Aprende desde cero

    - https://www.youtube.com/watch?v=7iobxzd_2wY&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=1
      SEGMENTOS
      00:00 - Introducción
      01:30 - ¿Qué es React?
      04:23 - Aviso sobre la documentación
      07:10 - ¿De dónde sale React?
      09:39 - 7 razones para aprender React
      18:50 - ¿Por qué React? Creando un botón sin React
      26:38 - Cómo usar React sin dependencias
      30:00 - Crea tu primer elemento
      31:45 - Elemento con atributos
      34:30 - Fragment
      36:00 - JSX desde cero
      44:00 - Crea tu primera aplicación con React
      54:00 - Crear componentes en React
      58:20 - Tu primer proyecto práctico con React
      01:02:50 - Estilos en React
      01:09:29 - Reutilización de componentes: Props
      01:14:15 - Estila contenedor para separaciones y no componentes
      01:15:50 - Pasando booleanos como props
      01:18:30 - Pasando funciones como props
      01:21:20 - Elementos como props
      01:23:10 - Diferencia entre elemento y componente
      01:24:50 - Las props son inmutables
      01:26:50 - La prop especial children
      01:34:00 - Pasar objeto como props
      01:36:27 - State en React

      - Preguntas típicas en React
        - https://www.reactjs.wiki/
        - https://github.com/midudev/preguntas-entrevista-react

  - 02 - Curso de React desde cero: Crea un videojuego y una aplicación para aprender useState y useEffect

    - https://www.youtube.com/watch?v=qkzcjwnueLA&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=2

      00:00 - Introducción
      00:30 - Inicialización del proyecto
      03:45 - Sobre los estilos del proyecto
      06:18 - Dibujando el tablero
      11:00 - Inicializar el estado
      13:50 - Estado con los turnos
      16:10 - Actualizando el tablero al hacer click
      18:00 - Lógica del tablero
      23:00 - Ajustando el final del juego
      27:00 - Detectar el ganador
      35:35 - El estado es asíncrono
      41:09 - Cómo crear el reset del juego
      46:35 - Lanzar confetti cuando gane la partida
      53:30 - Buenas prácticas separación de constante
      54:55 - Persistir la partida en localStorage
      01:05:16 - No puedes usar localStorage en el servidor
      01:07:20 - Aprende el hook useEffect
      01:16:40 - Configurar linter para monorepo
      01:21:52 - Creamos el segundo proyecto y aprendemos useEffect
      01:32:23 - Limpiando efectos
      01:41:19 - ¿Por qué se ejecuta dos veces el efecto?
      01:44:10 - React Developer Tools

  - 03 - ¡Resuelvo Prueba Técnica de React para Juniors y Trainee!
    - https://www.youtube.com/watch?v=XYpadB4VadY&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=3
      00:00 - Introducción
      04:15 - Enunciado de la prueba técnica
      08:30 - Iniciamos el proyecto
      11:25 - Instalando dependencias básicas
      13:30 - Punto de entrada de nuestra aplicación
      15:00 - JSX
      16:20 - ¡Instala el linter! Es un momento
      18:50 - Crear el componente React
      20:30 - Crear nuestro primer estado
      24:20 - Estrategia al afrontar la prueba y las APIs
      30:35 - Preguntas del chat
      37:25 - Seguimos con el segundo enunciado
      43:45 - Sobre usar console.log en entrevistas
      49:30 - Cuando te piden más cosas en la entrevista...
  - 04 - Custom Hooks + Testing con Playwright: Curso de React desde cero - Parte 4
    - https://www.youtube.com/watch?v=x-LcbVw99o8&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=4
  - 05 - Aprende a pasar una Prueba Técnica de React. Entiende useMemo, useCallback y useRef [Curso de React]

    - https://www.youtube.com/watch?v=GOEiMwDJ3lc&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=6

      00:00 - Introducción
      02:38 - Inicializamos el proyecto
      04:50 - Truco sobre los estilos
      06:20 - Empezamos a escribir código
      08:44 - Estilos básicos de nuestra app
      11:45 - Truco al usar APIs
      18:24 - ¡No hagas esto en React!
      23:40 - Evita depender del contrato de la API
      26:00 - Crea un custom hook useMovies
      30:40 - Manejar formularios y hook useRef
      37:37 - Usa formData para recuperar todos los datos del formulario
      41:20 - Controlar formularios con React
      46:45 - Cuidado con leer estados previos
      50:00 - Estilar inputs según errores
      52:14 - Volvemos a explicar useRef
      54:10 - Extraer a useSearch a Custom Hook
      56:45 - Usar useRef para detectar cuando es la primera vez
      01:03:15 - Estilar como grid los resultados
      01:10:55 - Fetching de datos
      01:18:10 - Extraer lógica a servicio
      01:25:35 - Evitar la misma búsqueda con useRef
      01:34:05 - Ordenar películas por año de lanzamiento
      01:39:00 - Cómo usar useMemo para mejorar rendimiento y evitar cálculos
      01:45:10 - Usar useMemo para evitar recrear función en cada render
      01:52:30 - Cómo usar useCallback
      01:57:00 - Crear una función debounce desde cero

  - 06 - Tienda y Carrito con React + Estado Global con useContext + Manejo de estado con useReducer

    - https://www.youtube.com/watch?v=B9tDYAZZxcE&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=6 14.46

      00:00 - Introducción, iniciar proyecto e instalación dependencias
      02:40 - Limpiar el código que viene por defecto
      03:25 - Copia de iconos
      03:55 - Listar Productos de la tienda
      10:40 - Añadir filtros de la tienda
      19:12 - Estilando los filtros
      20:54 - Mejorando filtro rango
      22:15 - Hacer que los filtros funcionen
      29:46 - Prop Drilling
      32:30 - useId, para crear identificadores
      37:50 - useContext, crear contextos en React y para qué sirve
      55:42 - ¿Cuándo usar useContext?
      57:15 - Evitar prop drilling con useContext
      01:00:10 - Dos fuentes de la verdad. ¿Qué es y cómo arreglarlo?
      01:09:41 - Creación de un carrito desde cero
      01:12:50 - Crear menú flotante con CSS
      01:16:50 - Crear Contexto para el Carrito de la Tienda
      01:27:21 - Mostrar visualmente que el producto está añadido al carrito
      01:34:34 - Mostrar la info del carrito
      01:38:55 - ¿Qué es el método bind y para qué sirve?
      01:40:11 - useReducer, manejando estados más complejos

      NOTA: Carrito hecho solo con html-js-css:

      - Programa un carrito de compras con Javascript
        - https://www.youtube.com/watch?v=lduIpYA66mM
        - [github.com/cacalo/Carrito-de-compras](https://github.com/cacalo/Carrito-de-compras)

  - 07 - ¡Aprende a crear React Router desde cero y publica el paquete!

    - https://www.youtube.com/watch?v=K2NcGYajvY4&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=7

      00:00 - Introducción e instalación
      03:20 - Creamos estructura básica de la aplicación
      05:09 - Crear páginas con renderizado condicional
      08:08 - Navegación SPA programática
      10:54 - Suscripción al evento en el useEffect
      13:55 - Truco para diferenciar SPA con MPA
      14:45 - Arreglar botón Ir Atrás
      17:05 - Refactorización de código
      18:26 - Errores al usar un botón en lugar de un enlace
      20:00 - Crear el componente Link
      24:30 - Añadir funcionalidad de teclado y botón derecho al Link
      28:56 - La magia de la prop children
      31:15 - Crear componente Router
      40:40 - Rutas 404 y rutas por defecto
      43:00 - Soportar rutas con parámetros dinámicos
      59:15 - Crear componente Route
      01:08:15 - Lazy Load de las rutas
      01:19:50 - Cómo hacer internacionalización
      01:23:00 - Testeando nuestro paquete de Router
      01:43:20 - Preparando para hacerlo como paquete publicable
      01:51:22 - Iniciar sesión en npm y publicar paquete
      01:55:30 - Probando nuestro paquete de Router en otro proyecto

  - 08 - Clon de Google Translate | React, TypeScript, ChatGPT + ViteTest 🌐

    - https://www.youtube.com/watch?v=kZhabulNCUc&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=8

      0:00 Explicando el proyecto: tecnologías y más…
      1:12 A MOVER LAS MANITAS
      1:55 Configurar Eslint
      5:34 Instalar React Bootstrap
      6:35 npm run dev
      9:12 Qué es un Reducer
      11:38 Aplicando los Pasos del Reducer
      17:26 tipar datos con TypeScript
      26:01 Creando un Custom Hook
      29:19 Arreglando el PayLoad
      34:44 Qué es keyof en TypeScript
      35:29 Qué es el Dispatch
      36:22 Usar React Bootstrap
      43:54 3 Formas de Tipar las Props & FC
      47:11 HandleChange y Eventos de TypeScript
      54:18 Enums de TypeScript
      57:17 Creando los TextArea con estilos
      01:10:32 Integrando ChatGPT
      01:11:33 AVISO
      01:12:56 Alternativas a OpenIA API
      01:14:31 Configuración
      01:22:21 Uso de == en TypeScript
      01:24:17 Probando nuestro Google Translate
      01:29:30 Custom Hook Debounce
      01:30:35 Qué es un Debounce
      01:38:10 Muestra de nuestro Google Translate
      01:39:41 Arreglando el Switch
      01:42:49 Agregar el botón de Copear el texto
      01:45:26 de Texto a Voz
      01:50:19 Arreglando el “my name is midu…”
      01:51:08 Cambiando la velocidad del Speaker
      01:52:49 Haciendo Testing
      01:53:00 Configurando el Vite.config.ts
      01:59:49 Mostrando el Test
      02:00:04 Proyecto en Github

  - 09 - CRUD con React Redux Toolkit + Rome Tools y Tremor 💻

    - https://www.youtube.com/watch?v=bEEjuwujbbU&list=PLUofhDIg_38q4D0xNWp7FEHOTcZhjWJ29&index=9

      0:00 Introducción
      1:35 ¿Qué es Redux?
      4:31 Instalar Vite
      5:19 Rome Tools en vez del Linter
      7:06 Instalar Rome Tools y configuración
      12:10 Qué es Tremor, instalación y configuración
      15:25 npm run dev
      16:44 Creando una tabla de Tremor
      20:30 Renderizando nuestra tabla
      22:27 Agregando Iconos a las “Acciones”
      24:28 Agregando Redux al proyecto
      26:25 Store + Configuración
      28:53 Explicación de Redux
      29:24 Slice
      33:32 Qué es el reducer
      36:29 Leer La Store
      38:57 Arreglando el problema de TypeScript
      41:37 Custom Hooks
      46:14 Creando Acciones
      46:24 Eliminar Usuarios
      49:12 Cosas a tener en cuenta
      50:35 Forma Tipica (no recomendada)
      54:23 Forma recomendada
      56:36 Pregunta de personita / Scraming Arquitecture
      58:53 Fin de la pregunta
      58:58 Middleware Persistencia de datos
      01:05:28 Cambiando el InitialState - Función que se invoca a si misma. (IIFE: Immediately invoked function expression)
      1:10:00 Componente CreateNewUser, Acción para agregar Usuarios
      1:21:00 Manejo de Errores
      1:21:28 Estado Local
      1:25:05 Diferencia entre Context y Redux
      1:26:12 Sincronizar con Bases de Datos Middleware + Actualización Optimista
      1:28:57 Sonner - Notificaciones al Delete
      1:40:17 RollBack - Borrando Usuario
      1:47:42 Mutaciones con Immer
      1:54:24 Tarea en casa

  - ## 10 -
  - ## 11 -
  - ## 12 -
