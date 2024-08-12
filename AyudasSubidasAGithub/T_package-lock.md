# Package-lock

## Desactivar

En este link [Disabling package-lock.json](https://codeburst.io/disabling-package-lock-json-6be662f5b97d) se encuentra un breve post al respecto

-   Desactivarlo

```bash
    touch .npmrc
    echo "package-lock=false" >> .npmrc

```

-   Paso a producción
    Se debe hacer un <code>shrinkwrap</code> las dependencias para proyectos en producción [npm-shrinkwrap](https://docs.npmjs.com/cli/v10/commands/npm-shrinkwrap)
