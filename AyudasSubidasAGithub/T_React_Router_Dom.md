- React Router Dom / react-router-dom

  - V7 **TODO**

    - [midudev: PENDIENTE](https://www.youtube.com)

  - V6

    - [midudev: 📚 Tutorial de React Router 6 desde cero](https://www.youtube.com/watch?v=iPNt12IdbCU)

      - **Qué es**

        - Es la biblioteca de enruteado en react más famosa.
        - **Alternativas**

          - [wouter](https://github.com/molefrog/wouter#readme)
          - [React Router](https://reach.tech/router/)
            - En la versión 7 de react-router se fuciona.
            - Ya no evolucionará de la versión actual. Reach Router v2 y React Router v6 son las mismas

        - **Cuando usarlo**

          - Si se tiene **Nextjs** no se usaría ya que **Nextjs** tiene su propio enrutado
          - Pero en una aplicación normal si que se usaría.

        - **Diferencias <code>react-router</code> y <code>react-router-dom</code>**
          - <code>react-router</code>:
            - Es una biblioteca que tiene el core de enrutado, pero no tiene la API suficiente para conectarse con el navegador.
          - <code>react-router-dom</code>:
            - Para el navegador se usa **react-router-dom**
            - La API tiene además del core los bildings para para conectarse con el navegador.
            - [bundlephobia](https://bundlephobia.com/package/react-router-dom@6.28.0)

      - **Instalación**: Se lo añade como dependencia de producción.

        ```bash
          npm init vite@latest rr6 -- --template react
          # npm i react-router@6.28.0
          npm i react-router-dom@6.28.0
        ```

      - **Configuración**

        - Ir al punto entrada aplicación y envolver nuestra aplicación con el **BrowserRouter**

          ```jsx
          // scr/main.jsx
          import { BrowserRouter } from "react-router-dom";
          ReactDom.render(
            <BrowserRouter>
              <App />
            </BrowserRouter>
          );
          ```

        - Agregar rutas

          - **Switch** ya no existe, es reemplado por **Routes**

          ```css
          header {
            display: flex;
            flex-direction: row;
            align-content: center;
            justify-content: space-between;
            padding: 16px;
            background: #dcf1ff;
          }
          nav ul {
            list-style-type: none;
          }
          nav a {
            text-decoration: none;
          }
          ```

          ```jsx
          // scr/App.jsx
          import { Route, Routes } from "react-router-dom";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => <h1>Search page</h1>;
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <a href="/">Home</a>
                      </li>
                      <li>
                        <a href="/search-page">Search Page</a>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - Convertirla en **SPA** con **Link**

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link } from "react-router-dom";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => <h1>Search page</h1>;
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <Link to="/">Home</Link>
                      </li>
                      <li>
                        <Link to="/search-page">Search Page</Link>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - Links dinámicos

          - Nuevo hook **useParams**

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams } from "react-router-dom";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => {
            const tacos = ["cochinita", "chili", "carnita", "quesadilla"];
            return (
              <div>
                <h1>Search page</h1>
                <ul>
                  {tacos.map((taco) => (
                    <li key={taco}>
                      <Link to={"/tacos/${taco}"}>{taco}</Link>
                    </li>
                  ))}
                </ul>
              </div>
            );
          };
          const Tacos = () => {
            const { name } = useParams();
            return (
              <div>
                <h1>Tacos</h1>
                {taco}
              </div>
            );
          };
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <Link to="/">Home</Link>
                      </li>
                      <li>
                        <Link to="/search-page">Search Page</Link>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                  <Route path="/tacos/:name" element={<Tacos />} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - **Rutas anidadas**

          - Dentro de la ruta tacos puede ser que quieras renderizar algo más
          - Se usa **Outlet** que nos indica donde se renderizará ese "algo más"

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams, Outlet } from "react-router-dom";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => {
            const tacos = ["cochinita", "chili", "carnita", "quesadilla"];
            return (
              <div>
                <h1>Search page</h1>
                <ul>
                  {tacos.map((taco) => (
                    <li key={taco}>
                      <Link to={"/tacos/${taco}"}>{taco}</Link>
                    </li>
                  ))}
                </ul>
              </div>
            );
          };
          const Tacos = () => {
            const { name } = useParams();
            return (
              <div>
                <h1>Tacos</h1>
                {taco}
                <Link to="details">Ir a los detalles</Link> // se pone una ruta relativa, es decir sin el /details, dado que quiero entrar a la ruta que agrupa es decir /tacos/:taco-name que generará: /tacos/taco-name/details
                <Outlet /> // acá es donde se desplegarán los detalles al presionar el link de arriba.
              </div>
            );
          };
          const TacoDetails = () => {
            const { taco-name } = useParams();
            return (
              <div>
                <h1>Taco Details {taco-name}</h1>
              </div>
            );
          };
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <Link to="/">Home</Link>
                      </li>
                      <li>
                        <Link to="/search-page">Search Page</Link>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                  <Route path="/tacos/:taco-name" element={<Tacos />}>
                    <Route path="details" element={<TacoDetails />} />
                  </Route>
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - **Hacer el 404**

          - Se debe pensar como cualquier ruta que no coincida con las demás para lo cual se crea una Route con path igual a "\*"
          - Tomar en Cuenta
            - Front End SIEMPRE devuelvolverá **status 200** no se puede desde el Front End devolver un **404** ya que sucede en el cliente.
            - La única forma para devolver un **404** es a nivel del servidor.
              - Lo que se podría hacer es que se redireccione a un Back end que en realidad devuelva un **404**

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams, Outlet } from "react-router-dom";
          ....
          function App() {
            return (
              <div classNam="App">
                <header>
                  ....
                </header>
                <Routes>
                  ...
                  <Route path="*/search-page*" element={<h1>Not Found</h1>} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - **Index Routes** (54.17)

          - Midudev recomienda si se puede evitarlo.
          - Se usa **Outlet** que nos indica donde se renderizará ese "algo más"

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams, Outlet } from "react-router-dom";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => {
            const tacos = ["cochinita", "chili", "carnita", "quesadilla"];
            return (
              <div>
                <h1>Search page</h1>
                <ul>
                  {tacos.map((taco) => (
                    <li key={taco}>
                      <Link to={"/tacos/${taco}"}>{taco}</Link>
                    </li>
                  ))}
                </ul>
              </div>
            );
          };
          const Tacos = () => {
            const { name } = useParams();
            return (
              <div>
                <h1>Tacos</h1>
                {taco}
                <Link to="details">Ir a los detalles</Link> // se pone una ruta relativa, es decir sin el /details, dado que quiero entrar a la ruta que agrupa es decir /tacos/:taco-name que generará: /tacos/taco-name/details
                <Outlet /> // acá es donde se desplegarán los detalles al presionar el link de arriba.
              </div>
            );
          };
          const TacoIndex = () => {
            return (
              <div>
                <h1>Index Route de tacos</h1>
              </div>
            );
          };
          const TacoDetails = () => {
            const { taco-name } = useParams();
            return (
              <div>
                <h1>Taco Details {taco-name}</h1>
              </div>
            );
          };
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <Link to="/">Home</Link>
                      </li>
                      <li>
                        <Link to="/search-page">Search Page</Link>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                  <Route path="/tacos/:taco-name" element={<Tacos />}>
                    <Route index element={<TacoIndex />} />
                    <Route path="details" element={<TacoDetails />} />
                  </Route>
                  <Route path="/tacos" element={<Tacos />}>
                    // al ingresar al path /tacos/:taco/ -> indexRoute
                    // lo que haría es renderizar el de /tacos/:taco y tacoIndex
                    <Route index element={<TacoIndex />} />
                    <Route path="taco" element={<TacoDetails />}>
                    <Route index element={<TacoIndex />} />
                      <Route path="details" element={<TacoDetails />} />
                    </Route>
                  </Route>
                  <Route path="*/search-page*" element={<h1>Not Found</h1>} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - **Links Activos** (1.02.28)

          - Es para que el link quede resaltado
          - Se lo hace con **NavLink** en lugar del **Link**

          ```css
          .... nav a.is-active {
            font-weight: bold;
            pointer-events: none;
          }
          ```

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams, Outlet, NavLink } from "react-router-dom";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => {
            const tacos = ["cochinita", "chili", "carnita", "quesadilla"];
            return (
              <div>
                <h1>Search page</h1>
                <ul>
                  {tacos.map((taco) => (
                    <li key={taco}>
                      <Link to={"/tacos/${taco}"}>{taco}</Link>
                    </li>
                  ))}
                </ul>
              </div>
            );
          };
          const Tacos = () => {
            const { name } = useParams();
            return (
              <div>
                <h1>Tacos</h1>
                {taco}
                <Link to="details">Ir a los detalles</Link> // se pone una ruta relativa, es decir sin el /details, dado que quiero entrar a la ruta que agrupa es decir /tacos/:taco-name que generará: /tacos/taco-name/details
                <Outlet /> // acá es donde se desplegarán los detalles al presionar el link de arriba.
              </div>
            );
          };
          const TacoIndex = () => {
            return (
              <div>
                <h1>Index Route de tacos</h1>
              </div>
            );
          };
          const TacoDetails = () => {
            const { taco-name } = useParams();
            return (
              <div>
                <h1>Taco Details {taco-name}</h1>
              </div>
            );
          };
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <NavLink className={({isActive}) => {
                          return isActive ? "is-active" : undefine
                        }} to="/">Home</NavLink>
                      </li>
                      <li>
                        <Link to="/search-page">Search Page</Link>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                  <Route path="/tacos/:taco-name" element={<Tacos />}>
                    <Route index element={<TacoIndex />} />
                    <Route path="details" element={<TacoDetails />} />
                  </Route>
                  <Route path="/tacos" element={<Tacos />}>
                    // al ingresar al path /tacos/:taco/ -> indexRoute
                    // lo que haría es renderizar el de /tacos/:taco y tacoIndex
                    <Route index element={<TacoIndex />} />
                    <Route path="taco" element={<TacoDetails />}>
                    <Route index element={<TacoIndex />} />
                      <Route path="details" element={<TacoDetails />} />
                    </Route>
                  </Route>
                  <Route path="*/search-page*" element={<h1>Not Found</h1>} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - **Crear el propio componente** (1.09.22)

          ```css
          .... nav a.is-active {
            font-weight: bold;
            pointer-events: none;
          }
          ```

          ```jsx
          // scr/NavLink.jsx
          import { NavLink as NavLinkReactRouter } from "react-router-dom";
          export const NavLink = ({to, children, ...props} => {
            return (
              <NavLinkReactRouter
                {...props}
                className={({isActive}) => isActive ? "is-active" : undefine }
                to={to}
              >{children}
              </NavLinkReactRouter>)
            })

          ```

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams, Outlet } from "react-router-dom";
          import { NavLink } from "./NavLink.jsx";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => {
            const tacos = ["cochinita", "chili", "carnita", "quesadilla"];
            return (
              <div>
                <h1>Search page</h1>
                <ul>
                  {tacos.map((taco) => (
                    <li key={taco}>
                      <Link to={"/tacos/${taco}"}>{taco}</Link>
                    </li>
                  ))}
                </ul>
              </div>
            );
          };
          const Tacos = () => {
            const { name } = useParams();
            return (
              <div>
                <h1>Tacos</h1>
                {taco}
                <Link to="details">Ir a los detalles</Link> // se pone una ruta relativa, es decir sin el /details, dado que quiero entrar a la ruta que agrupa es decir /tacos/:taco-name que generará: /tacos/taco-name/details
                <Outlet /> // acá es donde se desplegarán los detalles al presionar el link de arriba.
              </div>
            );
          };
          const TacoIndex = () => {
            return (
              <div>
                <h1>Index Route de tacos</h1>
              </div>
            );
          };
          const TacoDetails = () => {
            const { taco-name } = useParams();
            return (
              <div>
                <h1>Taco Details {taco-name}</h1>
              </div>
            );
          };
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <NavLink to="/">Home</NavLink>
                      </li>
                      <li>
                        <NavLink to="/search-page">Search Page</NavLink>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<SearchPage />} />
                  <Route path="/tacos/:taco-name" element={<Tacos />}>
                    <Route index element={<TacoIndex />} />
                    <Route path="details" element={<TacoDetails />} />
                  </Route>
                  <Route path="/tacos" element={<Tacos />}>
                    // al ingresar al path /tacos/:taco/ -> indexRoute
                    // lo que haría es renderizar el de /tacos/:taco y tacoIndex
                    <Route index element={<TacoIndex />} />
                    <Route path="taco" element={<TacoDetails />}>
                    <Route index element={<TacoIndex />} />
                      <Route path="details" element={<TacoDetails />} />
                    </Route>
                  </Route>
                  <Route path="*/search-page*" element={<h1>Not Found</h1>} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        - **Usando useRoutes** (1.18.42)

          ```jsx
          // scr/App.jsx
          import { Link, useRoutes } from "react-router-dom";
          const routes = [
            {
              path: "/",
              element: (
                <div>
                  <h1>Home</h1>
                  <Link to="/search">Go to search</Link>
                </div>
              )
            },
            {
              path: "/search",
              element: (
                <div>
                  <h1>Search</h1>
                  <Link to="/">Go to home</Link>
                </div>
            }
          ];
          export default function App() {
            const element = useRoutes(routes);
            console.log({ element });
            return (
              <main>
                <header>
                  <h1>Algún header</h1>
                </header>
                {element}
              </main>
            );
          }
          ```

        - **Usando useAuth** (1.21.42)

          - Ruta protegida / protectedRute

          ```jsx
          // scr/useAuth.jsx
          import {createContext, useContext, useState } from "react";
          const AuthContext = createContext()
          export const useAuth = () => {
            const auth = useContext(AuthContext)
            return auth
          }
          export const AuthProvider = ({children}) => {
            const {isAuthenticated, setIsAuthenticated} = useState(false)
            const login = () =>{
              setIsAuthenticated(true)
            }
            const logout = () =>{
              setIsAuthenticated(false)
            }
            return {
              <AuthContext.Provider value={auth}>
                {children}
              </AuthContext.Provider>
            }
          }
          ```

          ```jsx
          // scr/App.jsx
          import { Route, Routes, Link, useParams, Outlet, useNavigate, useLocation} from "react-router-dom";
          import { NavLink } from "./NavLink.jsx";
          import { ProtectedRoute } from "./useAuth.jsx";
          const Home = () => <h1>Home page</h1>; // Esto es un componente, es una función que renderiza algo.
          const SearchPage = () => {
            const tacos = ["cochinita", "chili", "carnita", "quesadilla"];
            return (
              <div>
                <h1>Search page</h1>
                <ul>
                  {tacos.map((taco) => (
                    <li key={taco}>
                      <Link to={"/tacos/${taco}"}>{taco}</Link>
                    </li>
                  ))}
                </ul>
              </div>
            );
          };
          const Tacos = () => {
            const { name } = useParams();
            return (
              <div>
                <h1>Tacos</h1>
                {taco}
                <Link to="details">Ir a los detalles</Link> // se pone una ruta relativa, es decir sin el /details, dado que quiero entrar a la ruta que agrupa es decir /tacos/:taco-name que generará: /tacos/taco-name/details
                <Outlet /> // acá es donde se desplegarán los detalles al presionar el link de arriba.
              </div>
            );
          };
          const TacoIndex = () => {
            return (
              <div>
                <h1>Index Route de tacos</h1>
              </div>
            );
          };
          const TacoDetails = () => {
            const { taco-name } = useParams();
            return (
              <div>
                <h1>Taco Details {taco-name}</h1>
              </div>
            );
          };
          const Login = () => {
            const {login} = useAuth()
            const navigate = useNavigate()
            const location = useLocation()
            console.log(location.state)
            const handleClick = () => {
              login()
              const nextPath = location.state ? location.state.pathname : "/search-page"
              // navigate("/search-page")
              navigate(nextPath)
            }
            return (
              <button onClick={handleClick}>Login</button>
            )
          }
          const ProtectedRoute = ({children}) => {
            const { isAuthenticated } = useAuth();
            const location = useLocation()
            if(!isAuthenticated){
              return <Navigte to="/login" state={{localization: location, image:"https://" }}/>
            }
            return children
          }
          function App() {
            return (
              <div classNam="App">
                <header>
                  <h1>Cabecera</h1>
                  <nav>
                    <ul>
                      <li>
                        <NavLink to="/">Home</NavLink>
                      </li>
                      <li>
                        <NavLink to="/search-page">Search Page</NavLink>
                      </li>
                    </ul>
                  </nav>
                </header>
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/search-page" element={<ProtectedRoute ><SearchPage /></ProtectedRoute>} />
                  <Route path="/tacos/:taco-name" element={<ProtectedRoute ><Tacos /></ProtectedRoute >}/>
                  <Route path="/login" element={<Login />}/>
                  <Route path="*/search-page*" element={<h1>Not Found</h1>} />
                </Routes>
              </div>
            );
          }
          export default App;
          ```

        Backwards Compatibility Package

    - Migrar de la versión **6** a la **7** - [Upgrading from v6](https://reactrouter.com/upgrading/v6)

- V5.2.0

  - [midudev: React Router DOM - Añade rutas a tu aplicación de React y crea una SPA 📍](https://www.youtube.com/watch?v=xE7TBCR6cj0)

    - Este tutorial fue hecho para la versión 5.2.0, mucho ojo pq en la version 6 hay breaking changes, más abajo se anotan.

    - **Instalación**: Se lo añade como dependencia de producción.

      ```bash
        npm i react-router-dom
      ```

      Quedando el package.json

      ```json
      {
        "dependencies": {
          "react-dom": "5.2.0"
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
        export default App
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

  - Migrar de la versión **5** a la **6** - [Upgrading from v5](https://reactrouter.com/6.28.0/upgrading/v5)

    - Se seguirá la siguiente secuencia de pasos

      - Upgrade to React v16.8 or greater
      - Upgrade to React Router v5.1
        - Remove <Redirect>s inside <Switch>
        - Refactor custom <Route>s
      - Upgrade to React Router v6

    - Desarrollo

      - Upgrade to React v16.8 or greater
        - React Router v6 es compatible con React >= 15, entonces puede actualizar React sin ningún problema.
      - Upgrade to React Router v5.1
        - Va a ser más fácil actualizar a React Router v6 si usted está en la versión 5.1
        - Migrar del uso de <code><Route component></code> o <code><Route render></code> a <code><Route children></code>
          - Para el caso del ejemplo anterior de Midudev, ya lo tenemos de la forma adecuada ya que se instaló la versión 5.2.0.
        - Remove <Redirect>s inside <Switch>
          - Para nuestro caso no aplica.
        - Refactor custom <Route>s
          - Para nuestro caso no aplica.
      - Upgrade to React Router v6

        - <code>npm install react-router-dom</code> o <code>npm install react-router-native</code>
        - [Upgrade all <Switch> elements to <Routes>](https://reactrouter.com/6.28.0/upgrading/v5#upgrade-all-switch-elements-to-routes)
          - Quitar la importación de Switch
          - Importar Routes
          - Reemplazar Switch por Routes
          - Ya no se pone como child sino de esta forma <code>element={ <Home /> }</code>

        ```javascript
          // src/App.js
          import React from "react"
          // import { Link, BrowserRouter, Route, Switch } from "react-router-dom"
          import { Link, BrowserRouter, Route, Routers } from "react-router-dom"
          ...
          const App = () => {
            return (
              <BrowserRouter>
                <header>
                  // Ya no se lo pone como child sino entra como elemente

                  /*<Link to="/" style={inlineStyles}>
                    Home
                  </Link>*/
                  <Link to="/" element={ <Home /> } style={inlineStyles}></Link>
                  <Link to="/notes" element={ <Notes /> } style={inlineStyles}></Link>
                  <Link to="/users" element={ <Users /> } style={inlineStyles}></Link>
                </header>
                // <Switch>
                <Routers>
                  <Route path="/">
                    <Home />
                  </Route>
                  <Route path="/users/*"> // notar se aumenta "/*"
                    <Users />
                  </Route>
                  <Route path="/notes/*"> // notar se aumenta "/*"
                    <Notes />
                  </Route>
                </Routers>
                // </Switch>
              </BrowserRouter>
            )
          }
          export default App
        ```
