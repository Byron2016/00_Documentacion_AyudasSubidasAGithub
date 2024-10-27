# MONOREPOSITORIOS

## Deshaciéndose de Yarn: creación de un repositorio monográfico con espacios de trabajo de Pnpm

### Referencia

Este documento está basado en el post desarrollado por **Basem Emara** publicado para [Hike Medical](https://medium.com/hike-medical) en **Medium** en el siguiente enlace: [Ditching Yarn — Creating a Monorepo with Pnpm Workspaces](https://medium.com/hike-medical/ditching-yarn-creating-a-monorepo-with-pnpm-workspaces-6fa7e3bfe19c)

### Traducción al español (2024-10-11)

¿Aún usas Yarn? Déjame adivinar, v1, ¿eh? Lo sé, he pasado por eso. Parece ridículo quedarse estancado en v1 cuando se lanzó v4, pero desafortunadamente, la adopción de Yarn más allá de v1 se ha estancado drásticamente y no está recibiendo el cariño que alguna vez tuvo. La interoperabilidad más allá de v1, como con los hosts y los proyectos de código abierto, ha sido mediocre en el mejor de los casos. Entonces, finalmente me arriesgué y me pasé a **pnpm** y estoy feliz de haberlo hecho. Hay algunas peculiaridades y ajustes que hacer para sentirse como en casa, pero luego te das cuenta de que la comunidad de código abierto ha estado haciendo las cosas un poco, eeehhhm, inconsistentemente, y **pnpm** está tratando de hacer las cosas de la manera correcta. Aún así, hay trampillas de salida para hacer que **pnpm** actúe como **Yarn** y **npm**, por lo que no estás demasiado lejos del camino trillado.

Ahora, sé lo que estás pensando: _"¡Pero mi configuración de base de código con **Yarn** funciona bien!"_ Pero escúchame: o **Yarn v4** o volver a **npm**. Con **pnpm**, obtienes todos los beneficios de los espacios de trabajo, además de algunas ventajas adicionales que hacen que sea una decisión fácil cambiar.

En esta publicación, te guiaré a través del proceso de dejar de lado **Yarn** y configurar un nuevo y brillante monorepositorio con espacios de trabajo **pnpm**. Cubriremos los beneficios de **pnpm**, las diferencias entre **Yarn** y **pnpm** a las que tendrás que adaptarte y cómo migrar tu archivo de bloqueo existente. También proporcionaré un ejemplo práctico con **Next.js**, **NestJS** y paquetes con **ESM** y **CommonJS**, para que puedas ver cómo encaja todo.

¡Pero eso no es todo! También cubriremos la integración de **Prettier** y **ESLint** en tu monorepositorio, la configuración de **VSCode** para una experiencia de desarrollo agradable y el uso de **TypeScript** en todos tus espacios de trabajo. Al finalizar esta publicación, tendrás una configuración de monorepositorio completamente funcional, optimizada para la eficiencia, la capacidad de mantenimiento y la escalabilidad. ¡Abróchate el cinturón y sumerjámonos en el mundo de los espacios de trabajo de **pnpm**!

### ¿Qué tiene de malo Yarn?

Bueno, nada. **Yarn** es increíble, pero perdieron el rumbo cuando pasaron a la versión 2+. El camino de migración desde la versión 1 no se pensó cuidadosamente y rompió las bases de código de los desarrolladores desde el principio. Sí, **Yarn** Plug’n’Play o PnP. La idea inteligente de no tener **node_modules** en tu proyecto y, en su lugar, tener una única caché para todas tus dependencias. Parece razonable, ¿verdad? El problema es que el ecosistema no estaba preparado para ello y el camino de migración no fue sencillo. Literalmente, el escenario para casi todos los desarrolladores que usaban **Yarn Classic** era: ok, déjame intentar actualizar a la versión 2+, vaya, se rompió, adiós, volví a la versión 1 o muchos abandonaron **Yarn** por completo y volvieron a lo básico con **npm**.

Quizás faltaba documentación o los valores predeterminados razonables no eran tan razonables; la versión 2+ fue un desastre. Ahí es donde pnpm llegó en el momento justo, con los documentos adecuados, con los evangelistas adecuados. Quiero decir, mira lo convincente que es esta [reseña de YouTube](https://www.youtube.com/watch?v=ZIKDJBrk56k). Fuera lo que fuese, las estrellas se alinearon para **pnpm** y comenzó a ganar terreno con algunos grandes nombres que se sumaron, como _Next.js, Vite, Prisma, NextAuth.js y Material UI_.

A pesar de que **pnpm** también tenía una idea similar de deshacerse de **node_modules** y tener un solo caché para todas sus dependencias, la diferencia era que **pnpm** era más claro al respecto y no tenía el bagaje de los usuarios heredados. **Yarn**, en cierto modo, complicó a sus usuarios existentes con los nuevos valores predeterminados y dejó un mal sabor de boca. Así que aquí estamos, abandonando **Yarn** por **pnpm**.

### ¿Es realmente mejor **Pnpm**?

En comparación con **Yarn Classic**, **pnpm** es mejor en todos los sentidos. Sin embargo, en comparación con **Yarn v4**, las diferencias se vuelven insignificantes. Ambos cumplen con los mismos requisitos:

- Uso eficiente del espacio en disco con paquetes compartidos en todas las instalaciones
- Resolución de dependencias más estricta al evitar el acceso a paquetes arbitrarios
- Tiempos de instalación más rápidos debido a la caché única
- Compatibilidad con Monorepo y espacios de trabajo **workspaces**

En lo que respecta a los detalles, **pnpm** tiene una CLI mucho más poderosa con más opciones. Incluso puede administrar múltiples versiones de Node, lo cual es una locura y estoy ansioso por probarlo (actualmente uso [nvm](https://github.com/nvm-sh/nvm)). Sin embargo, la verdadera razón para cambiar a **pnpm** es el apoyo de la comunidad. **Yarn** ha perdido su impulso y **pnpm** está ganando terreno. La comunidad es lo que hace o deshace una herramienta, y **pnpm** está ganando en ese sentido.

### ¡Vendido! ¿Por dónde empiezo?

¿Está listo para dar el salto a **pnpm**? ¡Vamos!

**Node.js** tiene una forma incorporada de administrar administradores de paquetes desde la v16 mediante el uso de Corepack. Para habilitar **pnpm** a través de él, ejecute:

```bash
    corepack enable pnpm
    pnpm -v

```

¡Listo! Ahora tienes pnpm instalado y puedes empezar a usarlo.

### Migración de **Yarn** a **pnpm**

El primer paso es migrar tu archivo **yarn.lock** o **packages-lock.json** existente a **pnpm-lock.yaml**. Este es un proceso simple que se puede realizar con el siguiente comando:

```bash
    pnpm import

```

**Pnpm** usa **YAML** para el archivo de bloqueo (lock file), lo cual es un cambio interesante con respecto a JSON, pero notarás que fue una elección inteligente en cuanto a legibilidad y reducción de conflictos de fusión.

Ahora puedes eliminar tu archivo **yarn.lock** y también la carpeta **node_modules**. También puedes eliminar el atributo workspaces de package.json ya que **pnpm** usa una forma diferente de definir espacios de trabajo (workspaces). Nos ocuparemos de esto en la siguiente sección. Pero primero…

### Peculiaridades de **Pnpm**

Hay algunas diferencias entre **Yarn Classic** y **pnpm** a las que tendrás que adaptarte. Estas son las mismas peculiaridades que se encuentran con **Yarn v2+** pero aprovechamos la oportunidad para pasar a **pnpm** en su lugar. Aquí hay algunas peculiaridades que debes tener en cuenta:

- **Node_modules no planos**: **Yarn Classic** y **npm** tienen una estructura plana para las dependencias almacenadas en **node_modules**. Esto es problemático porque los paquetes pueden hacer referencia a las dependencias directamente sin tener una dependencia explícita en su archivo package.json; A menudo se lo denomina _dependencia fantasma_ (phantom dependency). **Pnpm** resuelve esto al tener una estructura jerárquica para las dependencias en **node_modules**, de modo que los paquetes solo puedan hacer referencia a las dependencias que se les asignan; de lo contrario, **Node.js** arrojará un error que indica que no pudo encontrar la dependencia. Es una característica agradable y clara, pero desafortunadamente, demasiados paquetes _dependen del comportamiento defectuoso_ de la dependencia fantasma, por lo que tendremos que dejar de lado esta característica de **pnpm** hasta otro día. Para hacer esto, cree un archivo llamado .npmrc en la raíz de su proyecto y agregue **node-linker=hoisted**. Puede encontrar más detalles [aquí](https://pnpm.io/npmrc#node-linker).

```bash
    touch .npmrc
    echo "node-linker=hoisted" > .npmrc

```

- **Scripts pre/post deshabilitados**: si tiene scripts pre/post en su archivo package.json, deberá habilitar esta característica en **pnpm** porque no ejecuta scripts pre/post de manera predeterminada. Puede habilitarla agregando **enable-pre-post-scripts=true** en su archivo **.npmrc**. Puede encontrar más detalles [aquí](https://pnpm.io/cli/run#enable-pre-post-scripts). Tenga en cuenta que esto estará habilitado de manera predeterminada en [pnpm v9](https://github.com/pnpm/pnpm/issues/2891#issuecomment-1937113460) después de algunas fricciones con la comunidad.

```bash
    echo "enable-pre-post-scripts=true" >> .npmrc

```

### Espacios de trabajo (workspaces) de **Pnpm**

Ha llegado el momento de crear espacios de trabajo (workspaces) en su monorepo. Aquí es donde **pnpm** brilla. Es muy fácil configurar y mantener espacios de trabajo con **pnpm**. Para crear un espacio de trabajo, cree un archivo en la raíz de su proyecto llamado **pnpm-workspace.yaml** y agregue lo siguiente para que **pnpm** sepa dónde buscar sus espacios de trabajo:

```bash
packages:
  - 'apps/*'
  - 'packages/*'

```

mediante código:

```bash
    touch pnpm-workspace.yaml
    echo "packages:
  - 'apps/*'
  - 'packages/*'" > pnpm-workspace.yaml

```

Ahora puedes ejecutar **pnpm install** desde la raíz de tu proyecto y se obtendrán nuevamente todas las dependencias.

```bash
    pnpm install
```

Si se trata de un proyecto nuevo, puedes ejecutar **pnpm init** para crear el archivo package.json.

```bash
    pnpm init
```

Asegúrate de que el archivo **package.json** raíz tenga un aspecto similar al siguiente:

```json
{
  "name": "hike",
  "private": true,
  "version": "1.0.0",
  "description": "",
  "keywords": [],
  "author": "",
  "license": "UNLICENSED",
  "engines": {
    "node": "^20"
  },
  "packageManager": "pnpm@9.10.0"
}
```

- Note:
  - Se quita main
  - Se agrega private true
  - Se cambia license a UNLICENSED
  - Se coloca enines a node 20 o superior
  - Se agrega "packageManager": "pnpm@9.10.0"

Mediante código:

```bash

  # pwd -> hike
  touch package.json
  echo "{\"keywords\": []}" > package.json
  echo "{}" > package.json
  npm pkg set name="hike"
  npm pkg set private=true --json
  npm pkg set version="1.0.0"
  npm pkg set description=" "
  npm pkg set keywords[0]=" "
  npm pkg delete  keywords[0]
  npm pkg set author=" "
  npm pkg set license="UNLICENSED"
  npm pkg set engines='{"node":"^20"}' --json
  npm pkg set packageManager="pnpm@9.10.0"

```

**Algunas cosas para tener en cuenta:**

1. El atributo <code>private</code> está configurado como <code>true</code> para evitar publicar accidentalmente el paquete raíz en el registro **npm**.

2. El atributo <code>engine</code> está configurado como <code>^20</code> para garantizar que se use la versión correcta de **Node.js** en todos los espacios de trabajo y miembros del equipo.

3. El atributo <code>packageManager</code> está configurado como <code>pnpm@9.10.0</code> para garantizar que se use la versión correcta de **pnpm** en todos los espacios de trabajo y miembros del equipo. Lamentablemente, esto solo acepta una versión exacta.

Con el package.json de su monorepo en su lugar, ahora podemos crear espacios de trabajo (workspaces) individuales. Para ilustrar esto, creemos algunas aplicaciones y paquetes en nuestro monorepo.

1. **Backend**: [NestJS](https://nestjs.com/) es un marco con una hermosa arquitectura (¿inspirada en Angular?) para crear puntos finales. Se basa en Express con muchas convenciones, extensiones y seguridad. Cree la carpeta _apps_, luego navegue hasta ella en la terminal y ejecute <code>pnpx @nestjs/cli new</code>. Llámelo **backend** y elija **pnpm** como administrador de paquetes.

```bash
  # pwd -> hike
  mkdir apps
  cd apps
  pnpx @nestjs/cli new
  #  ? What name would you like to use for the new project? backend
  # ? Which package manager would you ❤️  to use?
  #   npm
  #   yarn
  # > pnpm
  cd ..
```

2. **Frontend**: [Next.js](https://nextjs.org/) es un gran framework para _aplicaciones React_. Es un espacio abarrotado, por lo que hay muchas buenas opciones como Remix, Vite e incluso [TanStack](https://tanstack.com/)?! 👀, pero nos quedaremos con **Next.js**, ya que tiene muchas características poderosas, está probado en batalla y tiene una comunidad muy grande. Desde el directorio de _apps_, ejecuta <code>pnpx create-next-app@latest</code>. Nombra el proyecto **commerce-web**, lo cual es una buena convención ya que es posible que más adelante tengas una aplicación móvil React Native. El resto de los valores predeterminados son perfectos, ¡incluido TypeScript 😎!

```bash

  # pwd -> hike
  cd apps
  pnpx create-next-app@latest
  pnpx create-next-app@latest commerce-web --ts --eslint --no-tailwind --src-dir --app --no-import-alias --use-pnpm --skip-install

  # ? What is your project named? commerce-web
  # ? Would you like to use TypeScript? » Yes
  # ? Would you like to use ESLint? » Yes
  # ? Would you like to use Tailwind CSS? » No
  # ? Would you like to use `src/` directory? » Yes
  # ? Would you like to use App Router? (recommended) » Yes
  # ? Would you like to customize the default import alias (@/*)? » No
  cd ..

```

1. **Paquetes**: los paquetes compartidos en tus aplicaciones residirán aquí. Crea una carpeta _packages_ desde la raíz del proyecto y crea las carpetas: _types_, _utils_, _services_, y _ui_. Dentro de cada carpeta, ejecuta <code>pnpm init</code>. Por cierto, los tipos serán el paquete más atómico y de nivel más bajo que consumirá cada aplicación y paquete; es donde irán todas tus interfaces, tipos y clases... nada más excepto, tal vez, protectores de tipos (type guards).

```bash

  # pwd -> hike
  mkdir packages
  cd packages

  mkdir types && mkdir utils && mkdir services && mkdir ui

  cd types
  pnpm init
  npm pkg set name="@hike/types"
  npm pkg delete main
  npm pkg delete scripts
  cd ..

  cd utils
  pnpm init
  npm pkg set name="@hike/utils"
  npm pkg delete main
  npm pkg delete scripts
  cd ..

  cd services
  pnpm init
  npm pkg set name="@hike/services"
  npm pkg delete main
  npm pkg delete scripts
  cd ..

  cd ui
  pnpm init
  npm pkg set name="@hike/ui"
  npm pkg delete main
  npm pkg delete scripts
  cd ..

  cd ..

```

El **package.json** para cada espacio de trabajo (workspace) debería verse como el que se muestra a continuación, con el atributo de <code>name</code> siendo único en todos los espacios de trabajo:

```json
{
  "name": "@hike/types",
  "version": "1.0.0",
  "description": "",
  "keywords": [],
  "author": "",
  "license": "UNLICENSED"
}
```

Dado que el nombre del espacio de trabajo se utilizará para hacer referencia a él en el futuro, es importante que tenga sentido. A continuación, se muestra cómo los nombraríamos en nuestro ejemplo utilizando <code>@hike</code> o <code>@your-organization</code> como prefijo del nombre del espacio de trabajo:

- @hike/backend
- @hike/commerce-web
- @hike/types
- @hike/utils
- @hike/services
- @hike/ui

```bash

    # pwd -> hike
    cd apps

    cd backend
    npm pkg set name="@hike/backend"
    cd ..

    cd commerce-web
    npm pkg set name="@hike/commerce-web"
    cd ..

    cd ..

```

Ahora podemos referenciarlos individualmente usando la opción de filtrado de **pnpm**:

```bash

    # pwd -> hike
    pnpm --filter @hike/commerce-web add cowsay
    pnpm --filter @hike/commerce-web dev

```

¡Felicitaciones! Ahora tienes un monorepositorio completamente funcional con espacios de trabajo **pnpm**. Puedes ejecutar scripts en todos los espacios de trabajo con un solo comando, administrar dependencias de manera eficiente y escalar tu proyecto con facilidad. ¡Pero aún no hemos terminado! Sigamos evolucionándolo para imitar el mundo real.

**Nota al margen: .gitignore**

Un pequeño desvío... en lugar de que cada espacio de trabajo tenga entradas redundantes en archivo .gitignore, las consolidaremos. En la raíz del monorepositorio, agrega un archivo .**gitignore** y pon las entradas globales en él donde queremos ignorar para todos los espacios de trabajo. Puede que haya alguna diferencia, pero creo que funcionan bien para la mayoría de los proyectos:

```bash
# compiled
.swc
build/
dist/
node_modules/

# logs
logs
*.log

# tests
/coverage

# dependencies
/.pnp
.pnp.js

# hosts
.vercel

# os
.DS_Store
*.pem

# secrets
keys.json
.env
.env.*

# typescript
*.tsbuildinfo

```

mediante código:

```bash

  # pwd -> hike
  touch .gitignore
  echo "# compiled
.swc
build/
dist/
node_modules/

# logs
logs
*.log

# tests
/coverage

# dependencies
/.pnp
.pnp.js

# hosts
.vercel

# os
.DS_Store
*.pem

# secrets
keys.json
.env
.env.*

# typescript
*.tsbuildinfo" > .gitignore

```

Ahora puedes reducir el tamaño del archivo **.gitignore** en cada uno de los espacios de trabajo para que solo incluya entradas específicas del espacio de trabajo. Esto mantendrá tus archivos **.gitignore** limpios y fáciles de mantener:

_apps/backend/.gitignore_

```bash
# apps/backend/.gitignore

# Tests
/.nyc_output

# temp directory
.temp
.tmp

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Diagnostic reports (https://nodejs.org/api/report.html)
report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json

```

mediante código:

```bash

  # pwd -> hike
  cd apps/backend/
  touch .gitignore
  echo "# Tests
/.nyc_output

# temp directory
.temp
.tmp

# Runtime data
pids
*.pid
*.seed
*.pid.lock

# Diagnostic reports (https://nodejs.org/api/report.html)
report.[0-9]*.[0-9]*.[0-9]*.[0-9]*.json" > .gitignore

cd ../..

```

_apps/commerce-web/.gitignore_

```bash
# apps/commerce-web/.gitignore

# next.js
/.next/
/out/

# typescript
next-env.d.ts

```

mediante código:

```bash

  # pwd -> hike
  cd apps/commerce-web/
  touch .gitignore
  echo "# next.js
/.next/
/out/

# typescript
next-env.d.ts" > .gitignore

cd ../..

```

Bien, volvamos a nuestro programa habitual...

Un **package.json** para gobernarlos a todos

El archivo raíz **package.json** es un archivo muy importante para administrar su monorepositorio. Aquí hay algunas cosas que debe tener en cuenta al configurar su archivo raíz **package.json**:

- **Dependencias**: solo incluya dependencias que se compartan entre todos los espacios de trabajo (workspaces). Si una dependencia es específica de un espacio de trabajo, agréguela al archivo **package.json** de ese espacio de trabajo (workspace).

- **Scripts**: defina los scripts que se ejecutan contra los espacios de trabajo (workspaces) en el archivo root package.json file. Es una comodidad ejecutar todos sus guiones desde arriba.

A continuación, se muestra cómo llevaríamos nuestro ejemplo anterior del archivo raíz **package.json** más allá:

```json
{
  "name": "hike",
  "private": true,
  "version": "1.0.0",
  "description": "",
  "keywords": [],
  "author": "",
  "license": "UNLICENSED",
  "scripts": {
    "build": "pnpm --filter '@hike/*' build",
    "build:packages": "pnpm --filter './packages/**' build",
    "lint": "pnpm --filter '@hike/*' lint",
    "format": "pnpm --filter '@hike/*' format",
    "test": "pnpm --filter '@hike/*' test"
  },
  "engines": {
    "node": "^20"
  },
  "packageManager": "pnpm@9.10.0"
}
```

mediante código:

```bash

  # pwd -> hike

  # Agregar scripts
  npm pkg set scripts.build="pnpm --filter '@hike/*' build"
  npm pkg set scripts.build:packages="pnpm --filter './packages/**' build"
  npm pkg set scripts.lint="pnpm --filter '@hike/*' lint"
  npm pkg set scripts.format="pnpm --filter '@hike/*' format"
  npm pkg set scripts.test="pnpm --filter '@hike/*' test"

```

**En Windows**

```bash

  # pwd -> hike

  # Agregar scripts
  npm pkg set scripts.build="pnpm --filter @hike/* build"
  npm pkg set scripts.build:packages="pnpm --filter ./packages/** build"
  npm pkg set scripts.lint="pnpm --filter @hike/* lint"
  npm pkg set scripts.format="pnpm --filter @hike/* format"
  npm pkg set scripts.test="pnpm --filter @hike/* test"

```

Lo bueno de los espacios de trabajo de **pnpm** es que puedes filtrarlos y ejecutar scripts en ellos con un solo comando. Con el ejemplo anterior, puedes ejecutar <code>pnpm build</code> desde la raíz de tu proyecto y ejecutará el script <code>build</code> en todos los espacios de trabajo con nombres que comiencen con <code>@hike/\*</code>. Puedes filtrar solo por paquetes usando la notación de comodín de carpeta. Estos comandos simplemente omitirán los espacios de trabajo que no tengan <code>build</code> en sus scripts. Se agregó lo mismo para <code>lint</code>, <code>format</code> y <code>tests</code>. Esto facilita la administración y el mantenimiento de tu monorepo.

La repetición es la madre del aprendizaje, así que agreguemos algunos scripts más al archivo raíz **package.json** para que sea más útil:

```json
{
  "scripts": {
    "dev": "pnpm dev:backend & pnpm dev:commerce-web",
    "dev:backend": "pnpm --filter '@hike/backend' start:dev",
    "dev:commerce-web": "pnpm --filter '@hike/commerce-web' dev",
    "clean": "rm -rf node_modules && pnpm --filter '@hike/*' clean"
  }
}
```

mediante código:

```bash

  # pwd -> hike

  # Agregar scripts
  npm pkg set scripts.dev="pnpm dev:backend & pnpm dev:commerce-web"
  npm pkg set scripts.dev:backend="pnpm --filter '@hike/backend' start:dev"
  npm pkg set scripts.dev:commerce-web="pnpm --filter '@hike/commerce-web' dev"
  npm pkg set scripts.clean="rm -rf node_modules && pnpm --filter '@hike/*' clean"
  npm pkg set scripts.clean:build="pnpm --filter '@hike/*' clean:build"

```

**En Windows**

```bash

  # pwd -> hike

  # Agregar scripts
  npm pkg set scripts.dev="pnpm dev:backend & pnpm dev:commerce-web"
  npm pkg set scripts.dev:backend="pnpm --filter @hike/backend start:dev"
  npm pkg set scripts.dev:commerce-web="pnpm --filter @hike/commerce-web dev"
  npm pkg set scripts.clean="rm -rf node_modules && pnpm --filter @hike/* clean"
  npm pkg set scripts.clean:build="pnpm --filter @hike/* clean:build"

```

En el caso del script <code>dev</code>, se ejecutan varias aplicaciones al mismo tiempo, lo que tiene sentido cuando tienes una aplicación frontend que se comunica con la aplicación backend. Por cierto, probablemente quieras cambiar el backend a un puerto diferente en _apps/backend/src/main.ts_ a algo como <code>8000</code> para que no entre en conflicto con el puerto que usa el frontend, ya que se supone que deben ejecutarse en paralelo.

mediante código:

```bash

  # pwd -> hike
  cd apps

  cd backend/src
  touch main.ts
  echo "import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(8000);
}
bootstrap();" > main.ts
  cd ../../..

```

Además, el script <code>clean</code> es una buena adición para limpiar la carpeta **node_modules** y los espacios de trabajo (workspaces). Esto es útil cuando quieres empezar de cero con tus dependencias si tienes problemas peculiares. Agrega el script <code>clean</code> a cada uno de los archivos package.json del espacio de trabajo:

```json
{
  "scripts": {
    "clean": "rm -rf node_modules dist",
    "clean:build": "rm -rf dist"
  }
}
```

mediante código:

```bash

  # pwd -> hike
  cd apps

  cd backend
  npm pkg set scripts.clean="rm -rf node_modules dist"
  npm pkg set scripts.clean:build="rm -rf dist"
  cd ../..

```

La única excepción es el espacio de trabajo **@hike/commerce-web**, ya que es una aplicación **Next.js** y utiliza la carpeta **.next** para el almacenamiento en caché. Puede agregar lo siguiente al script limpio en su archivo package.json:

```json
{
  "scripts": {
    "clean": "rm -rf node_modules .next",
    "clean:build": "rm -rf .next"
  }
}
```

mediante código:

```bash

  # pwd -> hike
  cd apps

  cd commerce-web
  npm pkg set scripts.clean="rm -rf node_modules .next"
  npm pkg set scripts.clean:build="rm -rf .next"
  cd ../..

```

En conjunto, los scripts raíz del paquete json deberían verse así ahora:

```json
{
    "scripts": {
        ....
        "build:clean": "pnpm clean && pnpm install && pnpm build",
        ....
    }
}
```

mediante código:

```bash

  # pwd -> hike

  npm pkg set scripts.build:clean="pnpm clean && pnpm install && pnpm build"

```

```json
{
  "scripts": {
    "build": "pnpm --filter '@hike/*' build",
    "build:packages": "pnpm --filter './packages/**' build",
    "build:clean": "pnpm clean && pnpm install && pnpm build",
    "dev": "pnpm dev:backend & pnpm dev:commerce-web",
    "dev:backend": "pnpm --filter '@hike/backend' start:dev",
    "dev:commerce-web": "pnpm --filter '@hike/commerce-web' dev",
    "lint": "pnpm --filter '@hike/*' lint",
    "format": "pnpm --filter '@hike/*' format",
    "test": "pnpm --filter '@hike/*' test",
    "clean": "rm -rf node_modules && pnpm --filter '@hike/*' clean"
  }
}
```

**Nota:** En <code>Windows</code> se ha iliminado las comillas simples para que funcione.

Sin embargo, tenga en cuenta que si ejecuta <code>pnpm dev</code> desde la raíz de su proyecto, la terminal es desordenada y es difícil diferenciar qué salida proviene de qué aplicación:

![dev script run old](https://miro.medium.com/v2/resize:fit:720/format:webp/1*kv6pq5oyOLsQZkILRIvLZg.png "dev script run old")

Agregar [concurrently](https://github.com/open-cli-tools/concurrently). **Concurrently** es una biblioteca útil que te permite ejecutar varios comandos en paralelo. Instálala en la raíz de tu proyecto y reiníciala para asegurarte de que solo la necesitamos para el desarrollo. Añádela en la sección <code>devDependencies</code> ejecutando el siguiente comando **pnpm**:

```bash

  # pwd -> hike
  pnpm add -D -w concurrently

```

La opción <code>-D</code> sirve para instalarlo como una dependencia de desarrollo y la opción <code>-w</code> es una forma explícita de indicarle a **pnpm** que desea agregar esta dependencia a la raíz del espacio de trabajo. Luego, actualice el script <code>dev</code> en el archivo raíz package.json para indicarle que ejecute simultáneamente el comando:

```json
# DE

{
  "scripts": {
    "dev": "pnpm dev:backend & pnpm dev:commerce-web"
  }
}

# A

{
  "scripts": {
    "dev": "concurrently -n backend,commerce -c green,magenta \"pnpm dev:backend\" \"pnpm dev:commerce-web\""
  }
}
```

mediante código:

```bash

  # pwd -> hike

  npm pkg set scripts.dev="concurrently -n backend,commerce -c green,magenta \"pnpm dev:backend\" \"pnpm dev:commerce-web\""

```

Ahora la salida de la terminal es mucho más clara y es más fácil diferenciar qué salida proviene de qué aplicación. Está etiquetada, codificada por colores y todo:

![dev script run new](https://miro.medium.com/v2/resize:fit:700/1*64K05-LKG0EYPwfv2OZkgQ.png "dev script run")

Esto completa la configuración de su archivo raíz _package.json_ y cómo se puede utilizar para organizar todos sus espacios de trabajo.

### Dependencias de los paquetes

Los paquetes que creamos en la carpeta \*packages/\*\* siguen siendo marcadores de posición, pero vamos a desarrollarlos un poco y comenzar a usarlos como dependencias en todo el monorepo.

Agregue un archivo en cada uno de los paquetes en _src/index.js_ con el código a continuación (tranquilícese, agregaremos TypeScript en un momento 😛):

```js
// Change output accordingly in each package
export const hello = () => 'Hello from "@hike/services"!';
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd types
  mkdir src
  cd src
  touch index.js
  echo "export const hello = () => 'Hello from \"@hike/types\""\!"';" > index.js
  cd ../..

  cd utils
  mkdir src
  cd src
  touch index.js
  echo "export const hello = () => 'Hello from \"@hike/utils\""\!"';" > index.js
  cd ../..

  cd services
  mkdir src
  cd src
  touch index.js
  echo "export const hello = () => 'Hello from \"@hike/services\""\!"';" > index.js
  cd ../..

  cd ui
  mkdir src
  cd src
  touch index.js
  echo "export const hello = () => 'Hello from \"@hike/ui\""\!"';" > index.js
  cd ../..

  cd ..

```

Agregue lo siguiente como dependencias a las aplicaciones frontend y backend:

```json
{
  "dependencies": {
    "@hike/services": "workspace:*",
    "@hike/types": "workspace:*",
    "@hike/utils": "workspace:*",
    "@hike/ui": "workspace:*"
  }
}
```

mediante código:

```bash

  # pwd -> hike

  cd apps/backend
  # TODO
  # Agregar lo anteriormente indicado
  # --NO funcionó: pnpm add ../../packages/services

  cd ../commerce-web
  # TODO
  # Agregar lo anteriormente indicado

  cd ../..

```

Ahora ejecute <code>pnpm install</code> o <code>pnpm i</code> para abreviar. Esto instalará las dependencias en todos los espacios de trabajo y los vinculará entre sí. Ahora puede importar las funciones de los paquetes en las aplicaciones frontend y backend.

```bash

    # pwd -> hike
    pnpm i

```

Para probar esto, en la aplicación frontend importe las funciones <code>hello</code> de cada uno de los paquetes y envíelas desde _src/app/page.tsx_:

```javascript
import { hello as helloService } from "@hike/services/src";
import { hello as helloTypes } from "@hike/types/src";
import { hello as helloUtils } from "@hike/utils/src";
import { hello as helloUI } from "@hike/ui/src";

export default function Home() {
  return (
    <p>
      {helloService()}
      <br />
      {helloTypes()}
      <br />
      {helloUtils()}
      <br />
      {helloUI()}
    </p>
  );
}
```

mediante código:

```bash

  # pwd -> hike
  cd apps/commerce-web/src/app

  touch page.tsx
  echo "import { hello as helloService } from \"@hike/services/src\";
import { hello as helloTypes } from \"@hike/types/src\";
import { hello as helloUtils } from \"@hike/utils/src\";
import { hello as helloUI } from \"@hike/ui/src\";

export default function Home() {
    return (
        <p>
            {helloService()}
            <br />
            {helloTypes()}
            <br />
            {helloUtils()}
            <br />
            {helloUI()}
        </p>
    );
}" > page.tsx
  cd ../../../..

```

Ejecute <code>pnpm dev</code> y <code>http://localhost:3000</code>

```bash

  # pwd -> hike
  pnpm dev
  # http://localhost:3000

```

debería mostrarse lo siguiente:

```json

  Hello from "@hike/services"!
  Hello from "@hike/types"!
  Hello from "@hike/utils"!
  Hello from "@hike/ui"!

```

¡Excelente! Ahora hagamos lo mismo con la aplicación backend. Actualice el archivo _src/app.services.ts_ con lo siguiente:

```javascript
import { Injectable } from "@nestjs/common";
import { hello as helloService } from "@hike/services/src";
import { hello as helloTypes } from "@hike/types/src";
import { hello as helloUtils } from "@hike/utils/src";
import { hello as helloUI } from "@hike/ui/src";

@Injectable()
export class AppService {
  getHello(): string {
    return [helloService(), helloTypes(), helloUtils(), helloUI()].join(", ");
  }
}
```

mediante código:

```bash

  # pwd -> hike

  cd apps/backend/src

  touch app.service.ts
  echo "import { Injectable } from '@nestjs/common';
import { hello as helloService } from '@hike/services/src';
import { hello as helloTypes } from '@hike/types/src';
import { hello as helloUtils } from '@hike/utils/src';
import { hello as helloUI } from '@hike/ui/src';

@Injectable()
export class AppService {
  getHello(): string {
    return [helloService(), helloTypes(), helloUtils(), helloUI()].join(', ');
  }
}" > app.service.ts
  cd ../../..

```

Si se está usando en ./package.json "engines": { "node": "^20" }, 💥 Debería aparecer un error:
Nota: Tomar en cuenta que en "engines": { "node": "^22" } el error ya no se presenta, se produjeron mejoras en nodejs. - [nodeV22_ModuleSintaxDetection ](https://www.youtube.com/watch?v=TjkGktT1obs&t=335s)

```bash

  # pwd -> hike
  pnpm dev:backend
  # http://localhost:8000

```

```bash

  [backend] export const hello = () => 'Hello from "@hike/services"!';
  [backend] ^^^^^^
  [backend]
  [backend] SyntaxError: Unexpected token 'export'

```

Ah, sí, NestJS sigue atascado en CommonJS 🙄. ¿Cómo podemos hacer que nuestros paquetes se ejecuten en los mundos ESM y CJS simultáneamente? Ahora es el momento de introducir y aprovechar TypeScript.

¡TypeScript es todo!

TypeScript es probablemente lo mejor que le ha pasado a JavaScript. Añadir tipado estático y otras características a JavaScript es crucial para detectar errores de forma temprana, mejorar la calidad del código y hacer que su código sea más fácil de mantener. Agreguemos TypeScript a **TODO** nuestro monorepositorio.

Primero, ejecute lo siguiente desde la raíz del proyecto:

```bash

  # pwd -> hike

  pnpm add -D -w typescript@^5 @types/node@^20

```

Utilice la versión adecuada que desee, pero sólo la cerramos a la versión principal porque no quiero influir en las aplicaciones y paquetes para que se limiten a una determinada versión. En cambio, mantenerlo libre de la raíz da flexibilidad para que las aplicaciones y paquetes coordinen las versiones entre sí.

Ahora, inicialicemos el archivo de configuración de TypeScript ejecutando <code>pnpm exec tsc --init<code> desde la raíz del proyecto.

```bash

  # pwd -> hike

  pnpm exec tsc --init

```

Esto crea un archivo tsconfig.json. Modifiquémoslo para que sea más estricto y similar a TypeScript:

```json
{
  "compilerOptions": {
    "module": "ESNext",
    "moduleResolution": "Node",
    "target": "ES2020",
    "strict": true,
    "allowJs": true, //https://www.typescriptlang.org/tsconfig/#allowJs
    "emitDecoratorMetadata": true, //https://www.typescriptlang.org/tsconfig/#emitDecoratorMetadata
    "esModuleInterop": true, //https://www.typescriptlang.org/tsconfig/#esModuleInterop
    "experimentalDecorators": true, //https://www.typescriptlang.org/tsconfig/#experimentalDecorators
    "forceConsistentCasingInFileNames": true, //https://www.typescriptlang.org/tsconfig/#forceConsistentCasingInFileNames
    "incremental": true, //https://www.typescriptlang.org/tsconfig/#incremental
    "noEmitOnError": true, //https://www.typescriptlang.org/tsconfig/#noEmitOnError
    "noFallthroughCasesInSwitch": true, //https://www.typescriptlang.org/tsconfig/#noFallthroughCasesInSwitch
    "noImplicitAny": false, //https://www.typescriptlang.org/tsconfig/#noImplicitAny
    "noImplicitOverride": true, //https://www.typescriptlang.org/tsconfig/#noImplicitOverride
    "noImplicitReturns": true, //https://www.typescriptlang.org/tsconfig/#noImplicitReturns
    "noUncheckedIndexedAccess": true, //https://www.typescriptlang.org/tsconfig/#noUncheckedIndexedAccess
    "noUnusedLocals": true, //https://www.typescriptlang.org/tsconfig/#noUnusedLocals
    "noUnusedParameters": true, //https://www.typescriptlang.org/tsconfig/#noUnusedParameters
    "preserveWatchOutput": true, //https://www.typescriptlang.org/tsconfig/#preserveWatchOutput
    "removeComments": true, //https://www.typescriptlang.org/tsconfig/#removeComments
    "resolveJsonModule": true, //https://www.typescriptlang.org/tsconfig/#resolveJsonModule
    "skipLibCheck": true, //https://www.typescriptlang.org/tsconfig/#skipLibCheck
    "strictPropertyInitialization": false //https://www.typescriptlang.org/tsconfig/#strictPropertyInitialization
  },
  "exclude": ["node_modules"]
}
```

mediante código:

```bash
  touch tsconfig.json
  echo "{ }" > tsconfig.json
  echo "{
  \"compilerOptions\": {
    \"module\": \"ESNext\",
    \"moduleResolution\": \"Node\",
    \"target\": \"ES2020\",
    \"strict\": true,
    \"allowJs\": true,
    \"emitDecoratorMetadata\": true,
    \"esModuleInterop\": true,
    \"experimentalDecorators\": true,
    \"forceConsistentCasingInFileNames\": true,
    \"incremental\": true,
    \"noEmitOnError\": true,
    \"noFallthroughCasesInSwitch\": true,
    \"noImplicitAny\": false,
    \"noImplicitOverride\": true,
    \"noImplicitReturns\": true,
    \"noUncheckedIndexedAccess\": true,
    \"noUnusedLocals\": true,
    \"noUnusedParameters\": true,
    \"preserveWatchOutput\": true,
    \"removeComments\": true,
    \"resolveJsonModule\": true,
    \"skipLibCheck\": true,
    \"strictPropertyInitialization\": false
  },
  \"exclude\": [\"node_modules\"]
}" > tsconfig.json

```

Puede consultar la documentación de TypeScript para comprender qué hace cada una de estas opciones y ajustarlas a su gusto. Estas configuraciones solo se utilizan como base para que las aplicaciones y los paquetes las hereden y anulen. Esto dará coherencia al desarrollo en todo el monorepositorio.

Para heredar la configuración raíz de TypeScript, agregue lo siguiente al archivo _tsconfig.json_ para las aplicaciones frontend y backend:

```json

    {
      "extends": "../../tsconfig",
      "compilerOptions": {
        ...
      },
      ...
    }

```

Como nuestros paquetes no tienen un archivo _tsconfig.json_, podemos crearlo y agregar lo siguiente al archivo _tsconfig.json_ en cada uno de los paquetes:

```json
{
  "extends": "../../tsconfig",
  "compilerOptions": {
    "baseUrl": "./src", //https://www.typescriptlang.org/tsconfig/#baseUrl
    "outDir": "./dist",
    "isolatedModules": true, //https://www.typescriptlang.org/tsconfig/#isolatedModules
    "declaration": true, //https://www.typescriptlang.org/tsconfig/#declaration
    "declarationMap": true, //https://www.typescriptlang.org/tsconfig/#declarationMap
    "sourceMap": true, //https://www.typescriptlang.org/tsconfig/#sourceMap
    "removeComments": false //https://www.typescriptlang.org/tsconfig/#removeComments
  },
  "include": ["./src"] //https://www.typescriptlang.org/tsconfig/#include
}
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd services
  touch tsconfig.json
  echo "{
  \"extends\": \"../../tsconfig\",
  \"compilerOptions\": {
    \"baseUrl\": \"./src\",
    \"outDir\": \"./dist\",
    \"isolatedModules\": true,
    \"declaration\": true,
    \"declarationMap\": true,
    \"sourceMap\": true,
    \"removeComments\": false
  },
  \"include\": [\"./src\"]
}" > tsconfig.json

  cp tsconfig.json ../types/
  cp tsconfig.json ../ui/
  cp tsconfig.json ../utils/
  cd ../..

```

Ahora puedes convertir el archivo _src/index.js_ en cada uno de los paquetes a TypeScript cambiándole el nombre a _src/index.ts_ y actualizando el código a TypeScript:

```javascript
export const hello = (): string => 'Hello from "@hike/services"!';
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd types/src
  rm index.js
  touch index.ts
  echo "export const hello = (): string => 'Hello from \"@hike/types\""\!"';" > index.ts
  cd ../..

  cd utils/src
  rm index.js
  touch index.ts
  echo "export const hello = (): string => 'Hello from \"@hike/utils\""\!"';" > index.ts
  cd ../..

  cd services/src
  rm index.js
  touch index.ts
  echo "export const hello = (): string => 'Hello from \"@hike/services\""\!"';" > index.ts
  cd ../..

  cd ui/src
  rm index.js
  touch index.ts
  echo "export const hello = (): string => 'Hello from \"@hike/ui\""\!"';" > index.ts
  cd ../..

  cd ..

```

Debemos agregar la sección de <code>scripts</code> en cada uno de los archivos _package.json_ de los paquetes para transpilar nuestro código para su uso:

```json
{
  "scripts": {
    "build": "npx tsc --build",
    "dev": "npx tsc --watch",
    ...
  }
}
```

mediante código:

```bash

   # pwd -> hike

  cd packages

  cd types
  npm pkg set scripts.build="npx tsc --build"
  npm pkg set scripts.dev="npx tsc --watch"
  cd ..

  cd utils
  npm pkg set scripts.build="npx tsc --build"
  npm pkg set scripts.dev="npx tsc --watch"
  cd ..

  cd services
  npm pkg set scripts.build="npx tsc --build"
  npm pkg set scripts.dev="npx tsc --watch"
  cd ..

  cd ui
  npm pkg set scripts.build="npx tsc --build"
  npm pkg set scripts.dev="npx tsc --watch"
  cd ..

  cd ..

```

ACA ME QUEDO NO HECHO

Ahora, cuando ejecutes <code>pnpm build</code>, notarás que se crea la carpeta dist en cada uno de los paquetes con el código transpilado. Debemos ajustar los package.json de los paquetes para indicarles que se use la carpeta **dist** para su utilización/consumo:

```json
{
  ....
  "module": "./dist/index.js",
  "types": "./dist/index.d.ts",
  "exports": {
    ".": {
      "import": "./dist/index.js"
    }
  },
  "files": [
    "dist/**"
  ],
  "scripts": {
    ....
    "clean": "rm -rf node_modules dist"
  }
}
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd types
  npm pkg set scripts.clean="rm -rf node_modules dist"
  npm pkg set scripts.clean:build="rm -rf dist"
  npm pkg set module="./dist/index.js"
  npm pkg set types="./dist/index.d.ts"
  npm pkg set exports='{".":{"import": "./dist/index.js"}}' --json
  npm pkg set files[0]="dist/**"
  cd ..

  cd utils
  npm pkg set scripts.clean="rm -rf node_modules dist"
  npm pkg set scripts.clean:build="rm -rf dist"
  npm pkg set module="./dist/index.js"
  npm pkg set types="./dist/index.d.ts"
  npm pkg set exports='{".":{"import": "./dist/index.js"}}' --json
  npm pkg set files[0]="dist/**"
  cd ..

  cd services
  npm pkg set scripts.clean="rm -rf node_modules dist"
  npm pkg set scripts.clean:build="rm -rf dist"
  npm pkg set module="./dist/index.js"
  npm pkg set types="./dist/index.d.ts"
  npm pkg set exports='{".":{"import": "./dist/index.js"}}' --json
  npm pkg set files[0]="dist/**"
  cd ..

  cd ui
  npm pkg set scripts.clean="rm -rf node_modules dist"
  npm pkg set scripts.clean:build="rm -rf dist"
  npm pkg set module="./dist/index.js"
  npm pkg set types="./dist/index.d.ts"
  npm pkg set exports='{".":{"import": "./dist/index.js"}}' --json
  npm pkg set files[0]="dist/**"
  cd ..

  cd ..

```

También debemos decirle a nuestro proceso de compilación (build process) que compile nuestros paquetes como parte de nuestro proceso de compilación (build process) para la aplicación frontend y backend. En los archivos _package.json_ del root , añadir los comandos de compilación <code>pnpm build:packages</code> para que nuestros paquetes se compilen antes de compilar las aplicaciones. Ahora debería verse así:

```json
{
  ....
  "scripts": {
    "build": "pnpm --filter '@hike/*' build",
    "build:packages": "pnpm --filter './packages/**'   build",
    ...
    "dev": "pnpm build:packages && concurrently -n     backend,commerce -c green,magenta \"pnpm --filter   '@hike/backend' start:dev\" \"pnpm --filter '@hike/   commerce-web' dev\"",
    "dev:backend": "pnpm build:packages && pnpm --filter   '@hike/backend' start:dev",
    "dev:commerce-web": "pnpm build:packages && pnpm   --filter '@hike/commerce-web' dev",
    ...
  }
  ....
}
```

mediante código:

```bash

  # pwd -> hike

  # Agregar scripts
  npm pkg set scripts.build:packages="pnpm --filter './packages/**' build"

  npm pkg set scripts.dev="pnpm build:packages && concurrently -n backend,commerce -c green,magenta \"pnpm --filter '@hike/backend' start:dev\" \"pnpm --filter '@hike/commerce-web' dev\""

  npm pkg set scripts.dev:backend="pnpm build:packages && pnpm --filter '@hike/backend' start:dev"

  npm pkg set scripts.dev:commerce-web="pnpm build:packages && pnpm --filter '@hike/commerce-web' dev"

```

**En Windows**

```bash

  # pwd -> hike
  # Agregar scripts

  npm pkg set scripts.build:packages="pnpm --filter ./packages/** build"

  npm pkg set scripts.dev="pnpm build:packages && concurrently -n backend,commerce -c green,magenta \"pnpm --filter @hike/backend start:dev\" \"pnpm --filter @hike/commerce-web dev\""

  npm pkg set scripts.dev:backend="pnpm build:packages && pnpm --filter @hike/backend start:dev"

  npm pkg set scripts.dev:commerce-web="pnpm build:packages && pnpm --filter @hike/commerce-web dev"

```

Para evitar que el paquete se construyá redundantemente, en el script <code>dev</code> estoy usando el comando <code>pnpm --filter</code> directamente en lugar de usar <code>dev:backendy</code> y <code>dev:commerce-web</code> ya que también están compilando los scrirpts.

Además, para asegurarte de que las implementaciones funcionen, quieres asegurarte de que tus paquetes se construman antes de que las aplicaciones ya que el host no llamará al monorepo <code>package.json</code> pero tus aplicaciones individuales <code>package.json</code>, algo importante a tener en cuenta. Usted puede hacer esto añadiendo el script <code>build:packages</code> al script pre-procesador <code>build</code> en el archivo _package.json_ de las aplicaciones del frontend y backend:

```json
{
  ....
  "scripts": {
    "prebuild": "pnpm --filter '../../packages/**' build",
    ...
  }
  ....
}
```

mediante código:

```bash

  # pwd -> hike

  cd apps/backend

  npm pkg set scripts.prebuild="pnpm --filter '../../packages/**' build"

  cd ../..


  cd apps/commerce-web

  npm pkg set scripts.prebuild="pnpm --filter '../../packages/**' build"

  cd ../..

```

**En Windows**

```bash

  # pwd -> hike

  cd apps/backend

  npm pkg set scripts.prebuild="pnpm --filter ../../packages/** build"

  cd ../..


  cd apps/commerce-web

  npm pkg set scripts.prebuild="pnpm --filter ../../packages/** build"

  cd ../..

```

Ahora podemos ajustar las importaciones en el código de aplicación frontend y backend ya que la carpeta **dist** ahora está implícita:

```javascript
import { hello as helloService } from "@hike/services";
import { hello as helloTypes } from "@hike/types";
import { hello as helloUtils } from "@hike/utils";
import { hello as helloUI } from "@hike/ui";
```

mediante código:

```bash

  # pwd -> hike

  cd apps/commerce-web/src/app

  touch page.tsx
  echo "import { hello as helloService } from \"@hike/services\";
import { hello as helloTypes } from \"@hike/types\";
import { hello as helloUtils } from \"@hike/utils\";
import { hello as helloUI } from \"@hike/ui\";

export default function Home() {
    return (
        <p>
            {helloService()}
            <br />
            {helloTypes()}
            <br />
            {helloUtils()}
            <br />
            {helloUI()}
        </p>
    );
}" > page.tsx
  cd ../../../..

```

mediante código:

```bash

  # pwd -> hike

  cd apps/backend/src

  touch app.service.ts
  echo "import { Injectable } from '@nestjs/common';
import { hello as helloService } from '@hike/services';
import { hello as helloTypes } from '@hike/types';
import { hello as helloUtils } from '@hike/utils';
import { hello as helloUI } from '@hike/ui';

@Injectable()
export class AppService {
  getHello(): string {
    return [helloService(), helloTypes(), helloUtils(), helloUI()].join(', ');
  }
}" > app.service.ts
  cd ../../..

```

Parece mucho más limpio. Ahora ejecute <code>pnpm dev</code> y usted debe ver la misma salida que antes. Bueno, el frontend todavía funciona, pero el backend sigue lanzando un error: _Error: No "exorts" main defined_. Esto se debe a que tenemos que hacer una versión **CommonJS** de nuestros paquetes para **NestJS**. Podemos hacer esto añadiendo una segunda configuración de TypeScript con <code>module: commonjs</code> y tener un directorio de salida diferente. Cree un archivo _tsconfig.cjs.json_ en cada uno de los paquetes y añádase lo siguiente:

```json
{
  "extends": "./tsconfig",
  "compilerOptions": {
    "module": "CommonJS",
    "outDir": "./dist/cjs"
  }
}
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd types
  touch tsconfig.cjs.json
  echo '{
    "extends": "./tsconfig",
    "compilerOptions": {
    "module": "CommonJS",
    "outDir": "./dist/cjs"
    } }' > tsconfig.cjs.json

  cp tsconfig.cjs.json ../services/
  cp tsconfig.cjs.json ../ui/
  cp tsconfig.cjs.json ../utils/

  cd ../..

```

Extienda el script de compilación (build script) en los archivos **package.json** de los paquetes para usar este archivo TypeScript de configuración como una segunda versión y también añadir un par de atributos más para apuntar a la versión **CommonJS** cuando se le solicite:

```json
{
  ...
  "main": "./dist/cjs/index.js",
  "exports": {
    ".": {
      ...
      "require": "./dist/cjs/index.js"
    }
  },
  "scripts": {
    "build": "npx tsc --build && npx tsc --project tsconfig.cjs.json",
    ...
  }
}
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd types
  npm pkg set main="./dist/cjs/index.js"
  npm pkg set exports='{".":{"import": "./dist/index.js", "require": "./dist/cjs/index.js"}}' --json
  npm pkg set scripts.build="npx tsc --build && npx tsc --project tsconfig.cjs.json"
  cd ..

  cd utils
  npm pkg set main="./dist/cjs/index.js"
  npm pkg set exports='{".":{"import": "./dist/index.js", "require": "./dist/cjs/index.js"}}' --json
  npm pkg set scripts.build="npx tsc --build && npx tsc --project tsconfig.cjs.json"
  cd ..

  cd services
  npm pkg set main="./dist/cjs/index.js"
  npm pkg set exports='{".":{"import": "./dist/index.js", "require": "./dist/cjs/index.js"}}' --json
  npm pkg set scripts.build="npx tsc --build && npx tsc --project tsconfig.cjs.json"
  cd ..

  cd ui
  npm pkg set main="./dist/cjs/index.js"
  npm pkg set exports='{".":{"import": "./dist/index.js", "require": "./dist/cjs/index.js"}}' --json
  npm pkg set scripts.build="npx tsc --build && npx tsc --project tsconfig.cjs.json"
  cd ..

  cd ..

```

Ejecute <code>pnpm dev</code> otra vez... funciona!. Vaya a _http://localhost:3000_ y deberías ver la misma salida que antes y ahora también debería ver en _http://localhost:8000_ las salidas de los paquetes también.

Deberíamos hacer un ligero ajuste a nuestros paquetes. Vamos a usar el archivo _index.ts_ como un lugar para exportar todo nuestro código. Si no lo hacemos, entonces los consumidores tendrán que saber la ubicación exacta y la estructura de archivos de su paquete para recuperar un módulo. En su lugar exportamos todo desde el archivo _index.ts_:

```javascript
// src/hello.ts
export const hello = (): string => 'Hello from "@hike/services"!';

// src/index.ts
export * from "./hello";
```

mediante código:

```bash

  # pwd -> hike

  cd packages

  cd types/src
  touch hello.ts
  echo 'export const hello = (): string => '\''Hello from "@hike/types!"'\'\; > hello.ts
  touch index.ts
  echo 'export * from "./hello";' > index.ts

  cp index.ts  ../../services/src
  cp index.ts  ../../ui/src
  cp index.ts  ../../utils/src
  cd ../..

  cd services/src
  touch hello.ts
  echo 'export const hello = (): string => '\''Hello from "@hike/services!"'\'\; > hello.ts
  cd ../..

  cd ui/src
  touch hello.ts
  echo 'export const hello = (): string => '\''Hello from "@hike/ui!"'\'\; > hello.ts
  cd ../..

  cd utils/src
  touch hello.ts
  echo 'export const hello = (): string => '\''Hello from "@hike/utils!"'\'\; > hello.ts
  cd ../..

  cd ..

```

Esto se mantendrá el <code>import</code> puro en el lado de la llamada, referencia todo de <code>@hike/services</code> sin importar cuál sea la estructura de la carpeta dentro del paquete o incluso si cambia.

Ahora tienes un monorepos con soporte de TypeScript en todos los espacios de trabajo. 🎉

### Integración de Prettier y ESLint

**Prettier** y **ESLint** son dos herramientas esenciales para mantener la calidad del código y la consistencia en su monorepo. **Prettier** es un formateador de código que formatea automáticamente su código de acuerdo con un conjunto de reglas, mientras que **ESLint** es un linter que comprueba su código para detectar errores y hace cumplir las mejores prácticas. Vamos a integrar **Prettier** y **ESLint** en tu monorepo, pero haciéndolo de una manera en la que las configuraciones sean compartidas y consistentes en todos los espacios de trabajo, al mismo tiempo que permite cierta flexibilidad por espacio de trabajo para sobre escribir o ajustar.

Primero, instale **Prettier** y **ESLint** en la raíz de su proyecto. Usar las directrices de estilo de Airbnb es una buena base, ya que ha arrasado muchas cosas y se ha adoptado ampliamente. Ejecute el siguiente comando: **TODO: quitar referencia a Airbnb**

```bash
    # pwd -> hike

    pnpm add -D -w prettier@^3 eslint@^8 @typescript-eslint/eslint-plugin@^7 eslint-import-resolver-typescript @typescript-eslint/parser@^7 eslint-config-prettier@^9 eslint-config-airbnb eslint-config-airbnb-typescript@^18

    pnpm add -D -w prettier@^3 eslint-config-prettier@^9

    pnpm create @eslint/config@latest
    # How would you like to use ESLint? To check syntax and find problems
    # What type of modules does your project use? JavaScript modules (import/export)
    # CommonJS (require/exports)
    # None of these
    # Which framework does your project use? None of these
    # Does your project use TypeScript? Yes
    # Where does your code run? Browser / Node
    # Would you like to install them (eslint, globals, @eslint/js, typescript-eslint) now? Yes
    # Which package manager do you want to use? pnpm
    pnpm i -D -w eslint globals @eslint/js typescript-eslint

    # eslint@^8 @typescript-eslint/eslint-plugin@^7  @typescript-eslint/parser@^7 eslint-import-resolver-typescript  eslint-config-airbnb eslint-config-airbnb-typescript@^18
```

Esto también incluye la integración de **Prettier** con **ESLint** para que no se pisen entre sí y trabajen complementarios entre sí en lugar de contradictorios.

Añadir un archivo _.eslintrc.json_ en la raíz del monorepo con las siguientes configuraciones opinadas personalmente. Lo principal, sin embargo, se extiende de los plugins existentes lo que hace que funcione para los tipos de archivos correctos y también se integra con **Prettier**:

==========================================================

```javascript

```

```json

```

```bash
    # pwd -> hike

```

==========================================================

https://www.youtube.com/watch?v=ngdoUQBvAjo
https://dev.to/nx/setup-a-monorepo-with-pnpm-workspaces-and-speed-it-up-with-nx-1eem
pnpm add shared-ui --filter my-remix-app --workspace
dependencies: {"share-ui":"wirjsoace:\*"}

pnpm run -r build
pnpm run --parallel -r build

## NOTAS

```json
{
  "scripts": {
    "dev:a": "pnpm --filter=** dev",
    "build": "pnpm --filter @hike/* build",
    "build:a": "pnpm --filter=@hike/** build"
  }
}
```

Eslint support https://github.com/zemd/eslint-flat-config/issues/12

https://github.com/vercel/next.js/issues/64453
Are there any notice about `create-next-app` will support ESlint V9 and eslint.config.js file?
Other related questions:
[#64853](https://github.com/vercel/next.js/issues/64853)
[#64409](https://github.com/vercel/next.js/issues/64409)
[#64453](https://github.com/vercel/next.js/issues/64453)
