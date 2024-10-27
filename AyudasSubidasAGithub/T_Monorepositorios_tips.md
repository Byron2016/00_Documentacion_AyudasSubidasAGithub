-   Herramientas para manejar monorepositorios

    -   There are many solutions that aim at different goals. Each tool fits a specific set of needs and gives you a precise set of features. Here are some of the available tools:

        -   Bazel (by Google) - A fast, scalable, multi-language and extensible build system.
        -   Gradle (by Gradle, Inc) - A fast, flexible polyglot build system designed for multi-project builds.
        -   Lage (by Microsoft) - Task runner in JS monorepos.
        -   Lerna (maintained by Nrwl) - A tool for managing JavaScript projects with multiple packages.
        -   Nx (by Nrwl) - Next generation build system with first class monorepo support and powerful integrations.
        -   Pants (by Pants Build) - A fast, scalable, user-friendly build system for codebases of all sizes.
        -   Rush (by Microsoft) - Geared for large monorepos with lots of teams and projects. Part of the Rush Stack family of projects.
        -   Turborepo (by Vercel) - The high-performance build system for JavaScript & TypeScript codebases.

-   Ejecutar dos proyectos front end

    -   npm run dev --workspaces
        -   Después de ejecutar el comando anterior, solo podemos acceder a http://localhost:5173, que está renderizando el proyecto React del proyecto uno.
        -   **¿No deberíamos poder acceder también al proyecto dos?** Sí, pero hay un problema al ejecutar scripts con la opción **workspaces**: **solo ejecuta un script a la vez**. Dado que nuestro servidor de desarrollo nunca deja de funcionar a menos que lo detengamos manualmente, solo ejecutará el script de desarrollo del espacio de trabajo del proyecto uno.
        -   Para ejecutar los servidores de desarrollo del proyecto uno y del proyecto dos, debemos ejecutar cada uno de ellos manualmente. En nuestra ventana de terminal actual, iniciemos el servidor de desarrollo del proyecto uno y en una ventana nueva ejecutamos el otro.

-   How to manage multiple Front-End projects with a monorepo
    -   https://www.pixelmatters.com/blog/how-to-manage-multiple-front-end-projects-with-a-monorepo
