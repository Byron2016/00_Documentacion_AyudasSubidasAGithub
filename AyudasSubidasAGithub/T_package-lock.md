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

## Linkear programas externos

### npm

En este link [What “Bin” does in package.json?](https://medium.com/nerd-for-tech/what-bin-does-in-package-json-931d691b1e33) se encuentra un breve post al respecto

```json
{
    ...
    bin :
    {
        "command-name" : "path/to/file"
    }
}
```

Ejecutar

```bash
    npm link

```

#### Proceso de link (symbolic links)

-   **Unix**: <code>/usr/local/bin</code>

-   **Windows**: <code>C:\Users\{Username}\AppData\Roaming\npm</code>

-   **Instalando el package**: Cuando alguien instala su paquete como dependencias, **npm** automáticamente crea un **symbolic link** en el directorio<code>node_modules/.bin</code> de su proyecto.

-   Ambito: como paquete queda confinado a <code>node_modules/.bin</code> en los otros casos es global, razón por la que se debe tener cuidado de no sobreponer nombres.
