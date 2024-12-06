- React Router Dom / react-router-dom

  - [midudev: React Router DOM - Añade rutas a tu aplicación de React y crea una SPA 📍](https://www.youtube.com/watch?v=xE7TBCR6cj0)

    - **Instalación**: Se lo añade como dependencia de producción.

      ```bash
        npm i react-router-dom
      ```

      Quedando el package.json

      ```json
      {
        "dependencies": {
          "react-dom": "^7.0.2"
        }
      }
      ```

    - **Código original**

      ```javascript
        // src/App.js
        import React, { useState } from "react"
        import Home = () => <h1>Home Page</h1>
        import Notes = () => <h1>Notes</h1>
        import Users = () => <h1>Users</h1>
        const inlineStyles = {
          padding: 5
        }
        const App = () => {
          const [page, setPage] = useState(() => {
            const { pathname } = windows.location
            const page = pathname.slice(1)
            return page
          })
          const getContent = () => {
            if (page === "users") {
              return <Users />
            } else if (page === "notes") {
              return <Notes />
            } else {
              return <Home />
            }
          }
          const toPage = page => event => {
            event.preventDefault()
            window.history.pushState(null, "", `/${page}`)
            setPage(page)
          }
          return (
            <div>
              <header>
                <a href="#" onClick={toPage("home")} style={inlineStyles}>
                  Home
                </a>
                <a href="#" onClick={toPage("nores")} style={inlineStyles}>
                  Notes
                </a>
                <a href="#" onClick={toPage("users")} style={inlineStyles}>
                  Users
                </a>
              </header>
              {getContent()}
            </div>
          )
        }
      ```

    - **Pasos**

      - Importar **Link**: **Link** es un componente que tiene react-router-dom que nos permite cambiar los anchors <a/> pero que ya tiene toda la lógica para hacer justamente lo que necesitamos, que cambie la URL, los del windows.history.pushState() lo hace automáticamente,
      - El **href** no se utiliza, se debe usar un **to**

        ```javascript
          // src/App.js
          import React, { useState } from "react"
          import { Link } from "react-router-dom"
          ...
          const App = () => {
            ...
            return (
              <div>
                <header>
                  <Link to="#" ...>
                    Home
                  </Link>
                  <Link to="#" ...>
                    Notes
                  </Link>
                  <Link to="#" ...>
                    Users
                  </Link>
                </header>
                {getContent()}
              </div>
            )
          }
        ```

      - El **Link** debe estar envuelta por un componente **Router**, por lo cual hay que importarlo y usarlo, pero como estamos en el navegador y que pueda utilizar el historye debemos importar el **BrowserRouter**, el cual es un enrutador que tiene toda la api del **history**

        - Nota: hay diferentes: **StaticRouter** que podría ser para el servidor dado que no tiene acceso a windows, **HashRouter** en que se utilice hashes en lugar de cambiar la url vayas utilizando hashes y otros.
        - Ya se podría quitar el <code>window.history.pushState(null, "", `/${page}`)</code> y vemos que no funciona, esto es porque se deben actualizar los **to**, pero igual no funciona porque tenemos un onClick en donde le estamos diciendo que hacer y dentro de este tenemos un <code>event.preventDefault()</code> en donde le estamos quitando el comportamiento por defecto del Link

        ```javascript
          // src/App.js
          import React, { useState } from "react"
          import { Link, BrowserRouter } from "react-router-dom"
          ...
          const App = () => {
            const [page, setPage] = useState(() => {
              const { pathname } = windows.location
              const page = pathname.slice(1)
              return page
            })
            const getContent = () => {
              if (page === "users") {
                return <Users />
              } else if (page === "notes") {
                return <Notes />
              } else {
                return <Home />
              }
            }
            const toPage = page => () => {
            // const toPage = page => event => {
              // event.preventDefault()
              // window.history.pushState(null, "", `/${page}`)
              setPage(page)
            }
            return (
              <BrowserRouter>
                <header>
                  <Link to="/home" ...>
                    Home
                  </Link>
                  <Link to="/notes" ...>
                    Notes
                  </Link>
                  <Link to="/users" ...>
                    Users
                  </Link>
                </header>
                {getContent()}
              </BrowserRouter>
            )
          }
        ```

      - Pero seguimos usando el <code>{getContent()}</code> que es usar el **estado de React** para ver la página.
      - Para evitar esto usamos otro componente que se llama **Route**, por lo cual hay que importarlo y usarlo. A este componente le decimos en el path x vas a renderizar y.
      - Ya con esto nos evitamos usar <code>{getContent()}</code> además del **estado** y el **onClick**

        ```javascript
          // src/App.js
          // import React, { useState } from "react"
          import React from "react"
          import { Link, BrowserRouter, Route } from "react-router-dom"
          ...
          const App = () => {
            /* const [page, setPage] = useState(() => {
              const { pathname } = windows.location
              const page = pathname.slice(1)
              return page
            })
            const getContent = () => {
              if (page === "users") {
                return <Users />
              } else if (page === "notes") {
                return <Notes />
              } else {
                return <Home />
              }
            }
            const toPage = page => event => {
              // event.preventDefault()
              // window.history.pushState(null, "", `/${page}`)
              setPage(page)
            }*/
            return (
              <BrowserRouter>
                <header>
                  <Link to="/" style={inlineStyles}>
                    Home
                  </Link>
                  <Link to="/notes" style={inlineStyles}>
                    Notes
                  </Link>
                  <Link to="/users" style={inlineStyles}>
                    Users
                  </Link>
                </header>
                // {getContent()}
                <Route path="/">
                  <Home />
                </Route>
                <Route path="/users">
                  <Users />
                </Route>
                <Route path="/notes">
                  <Notes />
                </Route>
              </BrowserRouter>
            )
          }
          export default App
        ```

      - Notar que al hacerlo funcionar tiene un problema y es que nos está trayendo al entrar a **User o Notes** tambien se renderiza la página de **Home**, esto es debido a que el path encaja con más de una dirección, para solucionarlo usamos un nuevo componente **Switch** que lo que hace es decirle a la aplicación, quédate con el primero que hagas match.

        ```javascript
          // src/App.js
          import React from "react"
          import { Link, BrowserRouter, Route, Switch } from "react-router-dom"
          ...
          const App = () => {
            return (
              <BrowserRouter>
                <header>
                  <Link to="/" style={inlineStyles}>
                    Home
                  </Link>
                  <Link to="/notes" style={inlineStyles}>
                    Notes
                  </Link>
                  <Link to="/users" style={inlineStyles}>
                    Users
                  </Link>
                </header>
                <Switch>
                  <Route path="/">
                    <Home />
                  </Route>
                  <Route path="/users">
                    <Users />
                  </Route>
                  <Route path="/notes">
                    <Notes />
                  </Route>
                </Switch>
              </BrowserRouter>
            )
          }
        ```

    - **Código cambiado**

      ```javascript
        // src/App.js
        import React from "react"
        import { Link, BrowserRouter, Route, Switch } from "react-router-dom"
        ...
        const App = () => {
          return (
            <BrowserRouter>
              <header>
                <Link to="/" style={inlineStyles}>
                  Home
                </Link>
                <Link to="/notes" style={inlineStyles}>
                  Notes
                </Link>
                <Link to="/users" style={inlineStyles}>
                  Users
                </Link>
              </header>
              <Switch>
                <Route path="/">
                  <Home />
                </Route>
                <Route path="/users">
                  <Users />
                </Route>
                <Route path="/notes">
                  <Notes />
                </Route>
              </Switch>
            </BrowserRouter>
          )
        }
        export default App
      ```
