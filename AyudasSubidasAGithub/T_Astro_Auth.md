- Autenticación OAuth

  - Astro con [auth-astro](https://github.com/nowaythatworked/auth-astro#readme)

    - npx astro add auth-astro
      - En lugar del de arriba. npm run astro add auth-astro
    - Responder las preguntas

    - Crear .env

      ```bash
        # Sacar de https://dev.twitch.tv
        # ver archivo T_Two_Factors_Auth.md
        # ver archivo T_Enable_Application_Outh.md
        TWITCH_CLIENT_ID="xxx"
        TWITCH_CLIENT_SECRET="yyy"

        AUTH_SECRET="" #Generar un hash aleatorio sirve para la codificación del token que generaremos al         usuario. Así nadie sabe como descodificar y hacerse pasar x cualquier usaurio al falsificar tokens.
        # Para generar
        #   f1: se genera con openssl rand -hex 32
        #   f2: generate-secret.vercel.app/32


        AUTH_TRUST_HOST=true #en algunos servidores, en vercel no es necesario.


      ```

    - Crear configuración de la autentificación

      ```javascript
      // Este será de acuerdo a donde nos vayamos a autentificar.
      // mirar para otros https://authjs.dev/getting-started/authentication/oauth
      import Twitch from "@auth/core/providers/twitch";
      import { defineConfig } from "auth-astro";

      export default defineConfig({
        providers: [
          Twitch({
            clientId: import.meta.env.TWITCH_CLIENT_ID,
            clientSecret: import.meta.env.TWITCH_CLIENT_SECRET,
          }),
        ],
        callbacks: {
          session: ({ session, token }) => ({
            ...session,
            user: {
              ...session.user,
              id: token.sub,
            },
          }),
        },
      });
      ```

    - Crear una pagina

      ```javascript
        ---
        import { getSession } from "auth-astro/server"
        import authConfig from "auth:config"
        import Layout from "@/layouts/Layout.astro"

        const session = await getSession(Astro.request)
        // console.log("session: ", session)
        // console.log("auth-config: ", authConfig)
        // console.log("a: ", JSON.stringify(authConfig))
        ---

        <Layout
        	title="Pronostica los ganadores - La Velada del Año IV"
        	description="¡Participa votando a los boxeadores que crees que ganarán sus combates!"
        >
        	<main class="flex flex-col items-center justify-center text-white">
        		<div>Pronósticos</div>
        		{
        			session ? (
        				<div>
        					<p>¡Hola, {session.user?.name}!</p>
        					<button id="logout">Cerrar Sesión</button>
        				</div>
        			) : (
        				<button id="login">Iniciar Sesión</button>
        			)
        		}
        	</main>
        </Layout>

        <script>
        	import { $ } from "@/lib/dom-selector"
        	const { signIn, signOut } = await import("auth-astro/client")
        	const $login = $("#login")
        	const $logout = $("#logout")
        	if ($login) $login.onclick = () => signIn("twitch") // se coloca "twitch" para que no muestra la pantalla de twich
        	if ($logout) $logout.onclick = () => signOut()
        </script>

      ```
