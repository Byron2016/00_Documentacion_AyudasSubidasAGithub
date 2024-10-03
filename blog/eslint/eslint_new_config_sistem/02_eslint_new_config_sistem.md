---
title: "ESLint's new config system, Part 2: Introduction to flat config"
author: "Nicholas C. Zakas"
date: "05/8/2022"
url: "https://eslint.org/blog/2022/08/new-config-system-part-2/"
---

# Nuevo sistema de configuración de ESLint, Parte 2: Introducción a la flat config

> El nuevo sistema de configuración de ESLint, apodado config plano, está diseñado para ser familiar y mucho más simple que el sistema de configuración original.

En mi anterior post, hablé de cómo el sistema de configuración de eslintrc había crecido para ser más complejo de lo necesario a través de una serie de pequeños cambios incrementales. El sistema de configuración plana, por otro lado, fue diseñado desde el principio para ser más simple de varias maneras. Tomamos todos los aprendizajes de los seis años anteriores de desarrollo de ESLint para llegar a un enfoque holístico de la configuración que tomó lo mejor de eslintrc y lo combinó con la forma en que otras herramientas relacionadas con JavaScript manejaban la configuración. El resultado es algo que, con suerte, se siente familiar con los usuarios de ESLint existentes y es mucho más potente de lo que era posible antes.

Docs: Lea más sobre el sistema de configuración plana en la documentación oficial.

## Los objetivos de la configuración plana

Para sentar las bases para los cambios en la configuración plana, tuvimos varios objetivos:

    Inúdemos lógicos - la forma en que la gente escribe JavaScript ha cambiado mucho en los últimos nueve años, y queríamos que el nuevo sistema de configuración reflejara nuestra realidad actual en lugar de la que vivíamos cuando ESLint fue lanzado por primera vez.
    Una manera de definir las configs - no queríamos que la gente tuviera múltiples maneras de hacer lo mismo por más tiempo. Debería haber una forma de definir las configs para cualquier proyecto dado.
    Las reglas configs deben permanecer inalteradas - sentimos que la forma en que las reglas ya estaban configuradas funcionaban bien, así que para facilitar la transición a la configuración plana, no queríamos hacer ningún cambio en las configuras de reglas. Igual rulesla llave se puede utilizar de la misma manera en la configuración plana.
    Utiliza la carga nativa para todo - uno de nuestros mayores arrepentimientos acerca de eslintrc fue recrear los Node.js requireresolución de una manera personalizada. Esta era una fuente significativa de complejidad y, en retrospectiva, innecesaria. De paso adelante, queríamos aprovechar las capacidades de carga del tiempo de ejecución de JavaScript directamente.
    Clas claves de primer nivel mejor organizadas - el número de claves en el nivel superior de eslintrc había crecido dramáticamente desde la liberación de ESLint. Tenemos que ver las claves necesarias y cómo se relacionan entre sí.
    Los plugins existentes deben funcionar - el ecosistema de ESLint está lleno de cientos de plugins. Era importante que estos plugins siguieran funcionando.
    La compatibilidad hacia atrás debería ser una prioridad, aunque nos estamos moviendo a un nuevo sistema de configuración, no queríamos dejar atrás todo el ecosistema existente. En particular, queríamos tener formas de que las configs compartidas siguieran trabajando lo más estrechamente posible. Aunque sabíamos que la compatibilidad del 100% era probablemente poco realista, queríamos hacer todo lo posible para asegurar que las confijas compartidas existentes funcionaran.

Con estos goles en mente, se nos ocurrió el nuevo sistema de configuración plana.

## Configuración de valores lógicos para la linaj

Cuando ESLint fue creado por primera vez, ECMAScript 5 fue la versión más reciente de JavaScript y la mayoría de los archivos fueron escritos como "shared todo" scripts o módulos CommonJS (para Node.js). El ECMAScript 6 estaba en el horizonte, pero nadie sabía lo rápido que se implementaría o cómo terminarían siendo utilizados los módulos (EM). Así que los valores predeterminados de ESLint debían asumir que todos los archivos eran ECMAScript 5. Terminamos con el ecmaVersionConfiguración de parser para permitir a las personas optar al ECMAScript 6 cuando estuvieran listas.

Rápido hacia 2022: ECMAScript está en constante evolución y ESM es el formato estándar del módulo que todo el mundo utiliza. Podríamos cambiar realmente la configuración predeterminada de eslintrc sin potencialmente romper muchas configuraciones existentes, pero definitivamente podríamos hacer un cambio con la configuración plana.

Flat config cuenta con los siguientes valores por defecto:

    ecmaVersion: "latest"para todos los archivos JavaScript - Eso está derecho, por defecto, todos los archivos JavaScript se configurarán a la última versión de ECMAScript. Esto imita cómo funcionan los tiempos de carrera de JavaScript, en que cada actualización significa que está optando por la última y más grande versión de JavaScript. Este cambio debería significar que probablemente tendrás que configurar manualmente ecmaVersionen su configuración a menos que desee hacer cumplir una versión anterior debido a las restricciones de tiempo de ejecución. Usted todavía será capaz de establecer ecmaVersionhasta el final 3Si es necesario.
    sourceType: "module"para todos .jsy .mjsArchivos - Por defecto, la configuración plana asume que está escribiendo ESM. Si no, siempre puedes establecer sourceTypede vuelta a "script".
    sourceType: "commonjs"para .cjsarchivos - Todavía estamos en un período de transición donde una gran cantidad de código de Node.js está escrito en CommonJS. Para apoyar a esos usuarios, añadimos un nuevo sourceTypede "commonjs"que configura todo correctamente para ese entorno.
    ESLint busca .js, .mjs, y .cjsArchivos - Con eslintrc, ESLint sólo ha buscado .jsarchivos cuando pasaste un nombre de directorio en la línea de comandos, y tendría que usar el --extbandera para definir más. Con configuración plana, las tres extensiones de nombres de archivo JavaScript más comunes se buscan automáticamente.

Estamos bastante entusiasidos con estos nuevos defectos ya que creemos que esto ayudará a la gente a bordo de ESLint más rápido y con menos confusión.

## El nuevo archivo de configuración: eslint.config.js

A diferencia de eslintrc, que permitía múltiples archivos de configuración en múltiples ubicaciones, múltiples formatos de archivo de configuración, e incluso package.json-figs basados, config plano tiene sólo una ubicación para toda su configuración de proyecto: el eslint.config.jsArchivo. Al limitar la configuración a una ubicación y un formato, podemos aprovechar el mecanismo de carga JavaScript directamente y evitar la necesidad de un análisis personalizado de archivos de configuración.

Cuando ESLint CLI se utiliza, busca eslint.config.jsdel directorio de trabajo actual y si no se encuentra continuará la búsqueda de los antepasados del directorio hasta que se encuentre el archivo o el directorio raíz sea golpeado. Ese eslint.config.jsEl archivo contiene toda la información de configuración para ese funcionamiento de ESLint por lo que reduce drásticamente el acceso al disco requerido en comparación con el eslintrc, que tuvo que comprobar cada directorio desde la ubicación del archivo linate hasta la raíz para cualquier archivo de configuración adicional.

Además, el uso de un archivo JavaScript nos permitió confiar en los usuarios para cargar información adicional que su archivo de configuración podría necesitar. En lugar de extendsy pluginscargando cosas por su nombre, ahora sólo puedes usar importy requiresegún sea necesario para aportar esos recursos adicionales. Aquí está un ejemplo de lo que eslint.config.jsEl archivo parece:

```javascript
export default [
  {
    files: ["**/*.js"],
    rules: {
      semi: "error",
      "no-unused-vars": "error",
    },
  },
];
```

An eslint.config.jsel archivo exporta una serie de objetos de configuración. Sigue leyendo para entender más sobre este ejemplo.

## Configs basados en Glob por todas partes

Mientras que el overridesLa clave en eslintrc era la fuente de mucha complejidad, una cosa estaba muy clara: a la gente realmente le gustaba ser capaz de definir la configuración por patrones glob en su archivo de configuración. Debido a que queríamos eliminar la cascada de configuración de eslintrc, tuvimos que usar patrones de glob para permitir el mismo tipo de analgajosos de configuración. Usamos el overridesconfigs como base para la configuración plana.

Cada objeto config puede tener opcional filesy ignoresteclas que especifican patrones de minimatch - basado en globos para que coin figuren en los archivos. Un objeto de configuración sólo se aplica a un archivo si el nombre de archivo coincide con un patrón en files(o si no hay filesclave, en cuyo caso se igualará a todos los archivos). El ignoresclave filtra archivos de la lista de files, por lo que limita los archivos a los que se aplica el objeto de configuración. Por ejemplo, tal vez sus archivos de prueba viven en el mismo directorio que su archivo de origen y desea que un objeto de configuración se aplique sólo a los archivos de origen. Podrías hacerlo así:

```javascript
export default [
  {
    files: ["**/*.js"],
    ignores: ["**/*.test.js"],
    rules: {
      semi: "error",
      "no-unused-vars": "error",
    },
  },
];
```

Aquí, el objeto de configuración se adaptará a todos los archivos JavaScript y luego filtrará cualquier archivo que termine con .test.js.

Y si quieres ignorar los archivos por completo? Puedes hacerlo especificando un objeto de configuración que sólo tiene un ignoresclave, así:

```javascript
export default [
  {
    ignores: ["**/*.test.js"],
  },
  {
    files: ["**/*.js"],
    rules: {
      semi: "error",
      "no-unused-vars": "error",
    },
  },
];
```

Con esta configuración, todos los archivos de JavaScript que terminan con .test.jsserá ignorado. Usted puede pensar en esto como el equivalente de ignorePatternsen eslintrc, aunque con patrones de minimatch.

## Adiós extends, hola cascada plana

Mientras queríamos deshacernos de la config cascada basada en directorio, la configuración plana en realidad todavía tiene una cascada plana definida directamente en su eslint.config.jsArchivo. En el interior de la matriz, ESLint encuentra todos los objetos de configuración que coinciden con el archivo que se lina y los fusiona juntos de la misma manera que lo hizo Eslintrc. La única diferencia real es que la fusión ocurre desde la parte superior de la matriz hasta la parte inferior en lugar de utilizar archivos en una estructura de directorio. Por ejemplo:

```javascript
export default [
  {
    files: ["**/*.js", "**/*.cjs"],
    rules: {
      semi: "error",
      "no-unused-vars": "error",
    },
  },
  {
    files: ["**/*.js"],
    rules: {
      "no-undef": "error",
      semi: "warn",
    },
  },
];
```

Esta configuración tiene dos objetos de configuración con superposición filespatrones. El primer objeto de configuración se aplica a todos .jsy .cjsarchivos mientras que el segundo se aplica sólo a .jsArchivos. Al bordear un archivo que termina con .js, ESLint combina ambos objetos de configuración para crear la configuración final del archivo. Porque el segundo conjunto de config semia una severidad de "warn", que tiene precedencia sobre la "error"que se estableció en la primera configuración. La última configuración coincidente siempre gana cuando hay un conflicto.

Lo que esto significa para los configuras compartidos es que puede insertarlos directamente en la matriz en lugar de usar extends, como:

```javascript
import customConfig from "eslint-config-custom";

export default [
  customConfig,
  {
    files: ["**/*.js", "**/*.cjs"],
    rules: {
      semi: "error",
      "no-unused-vars": "error",
    },
  },
  {
    files: ["**/*.js"],
    rules: {
      "no-undef": "error",
      semi: "warn",
    },
  },
];
```

Aquí, customConfigse inserta primero en el array para que se convierta en la base de configuración para este archivo. Cada uno de los siguientes objetos de configuración se construye sobre esa base para crear la configuración final para un archivo JavaScript dado.

## Opciones de idioma reimaginadas

ESLint siempre ha tenido una extraña mezcla de opciones que afectaron cómo se interpretó JavaScript. Estaba el nivel superior. globalsclave que modificó las variables globales disponibles, y ecmaVersiony sourceTypecomo parserOptions, por no mencionar envpara añadir más global. Tal vez lo más confuso es que tenías que poner ambas ecmaVersiony añadir un ambiente como es6para habilitar tanto la sintaxis querías como asegurarse de que las variables globales correctas estarían disponibles.

En la configuración plana, trasladamos todas las claves relacionadas con la evaluación JavaScript en una nueva clave de alto nivel llamada languageOptions.

## Ajuste ecmaVersionen config plano

El cambio más grande es que nos mudamos. ecmaVersionFueras de parserOptionsy directamente en languageOptions. Esto refleja mejor este nuevo comportamiento de la clave, que es permitir tanto la sintaxis como las variables globales basadas en la versión especificada de ECMAScript. Por ejemplo:

```javascript
export default [
  {
    files: ["**/*.js"],
    languageOptions: {
      ecmaVersion: 6,
    },
  },
];
```

Esta configuración ha degradado ecmaVersiona 6. Hacerlo garantiza que toda la sintaxis ES6 y todos los globales de ES6 estén disponibles. (Cuales de parsers personalizados utilizados todavía recibirán este valor de ecmaVersion.)

## Ajuste sourceTypeen config plano

A continuación, nos mudamos. sourceTypeen languageOptions. Similar a ecmaVersion, esta clave afecta no sólo a cómo se analiza un expediente, sino también cómo ESLint evalúa su estructura de alcance. Mantuvimos lo tradicional "module"para el MEDE y "script"para guiones, y también añadidos "commonjs", que permite a ESLint saber que debe tratar el archivo como CommonJS (que también permite globals específicos de CommonJS). Si estás usando ecmaVersion: 3o o ecmaVersion: 5, asegúrese de establecer sourceType: script, así:

```javascript
export default [
  {
    files: ["**/*.js"],
    languageOptions: {
      ecmaVersion: 5,
      sourceType: "script",
    },
  },
];
```

## Ambientes de despedesos, hola globals

Los entornos en eslintrc proporcionaron un conjunto conocido de globales y fueron una fuente constante de confusión para los usuarios. Hay que mantenerlos al día (especialmente en el caso de browser) y esa actualización debe esperar a las versiones de ESLint. Además, habíamos enganchado algunas funcionalidades adicionales a los entornos para que fuera más fácil trabajar con Node.js, y al final, hicimos un desastre.

Para la configuración plana, decidimos quitar el envllave completamente. Porqué? Porque ya no hace falta. Toda la funcionalidad personalizada que enganchamos a los entornos para su uso con Node.js ahora está cubierta por sourceType: "commonjs", por lo que todo lo que quedaba era que los entornos gestionaran variables globales. No tiene sentido que ESLint haga esto en el centro, así que les estamos devolviendo esta responsabilidad.

Hace años, trabajamos con Sindre Sorhus para crear la globalspaquete, que extrajo toda la información del medio ambiente de ESLint para que estuviera disponible para otros paquetes. ESLint entonces se utiliza globalscomo fuente para sus entornos.

Con la configuración plana, puedes usar el globalspaquete directamente, actualizándolo cuando quieras, para obtener toda la misma funcionalidad que los entornos solían proporcionar. Por ejemplo, aquí es cómo agregas globals del navegador en tu configuración:

```javascript
import globals from "globals";

export default [
  {
    files: ["**/*.js"],
    languageOptions: {
      globals: {
        ...globals.browser,
        myCustomGlobal: "readonly",
      },
    },
  },
];
```

El languageOptions.globalsLa clave funciona igual que en eslintrc, sólo ahora, puede utilizar JavaScript para insertar dinámicamente cualquier variable global que desee.

## Los parstomistas y las opciones de analizador son en su mayoría los mismos

El parsery parserOptionsllaves se han trasladado a la languageOptionsclave, pero en su mayoría trabajan igual que en eslintrc con dos diferencias específicas:

    Ahora puede insertar el objeto analizador directamente en la configuración.
    Los parsers ahora pueden ser agrupados con plugins y puede especificar un valor de cadena para parserpara usar un analizador de un plugin. (Descrito más en la siguiente sección.)

Aquí es un ejemplo usando el analizador de Babel ESLint:

```javascript
import babelParser from "@babel/eslint-parser";

export default [
  {
    files: ["**/*.js", "**/*.mjs"],
    languageOptions: {
      parser: babelParser,
    },
  },
];
```

Esta configuración asegura que el analizador de Babel, en lugar del predeterminado, se utilizará para analizar todos los archivos que terminan con .jsy .mjs.

También puede pasar las opciones directamente al analizador personalizado mediante el parserOptionsclave de la misma manera que funciona en eslintrc:

```javascript
import babelParser from "@babel/eslint-parser";

export default [
  {
    files: ["**/*.js", "**/*.mjs"],
    languageOptions: {
      parser: babelParser,
      parserOptions: {
        requireConfigFile: false,
        babelOptions: {
          babelrc: false,
          configFile: false,
          // your babel options
          presets: ["@babel/preset-env"],
        },
      },
    },
  },
];
```

## plugins más potentes y configurables

La fuerza de ESLint es el ecosistema de plugins que los individuos y las empresas mantienen para personalizar su estrategia de línea. Como tal, queríamos estar seguros de que los plugins existentes seguían funcionando sin modificaciones, así como permitiendo que los plugins hicieran cosas que nunca fueron capaces de hacer en el pasado.

En la superficie, el uso de un plugin en la configuración plana se ve muy similar a la utilización de un plugin en eslintrc. La gran diferencia es que las cuerdas usadas eslintrc, mientras que las configuras planas utilizan objetos. En lugar de especificar el nombre de un plugin, usted importa el plugin directamente y colocarlo en el pluginsclave, como en este ejemplo:

```javascript
import jsdoc from "eslint-plugin-jsdoc";

export default [
{
files: ["**/*.js"],
plugins: {
jsdoc
}
rules: {
"jsdoc/require-description": "error",
"jsdoc/check-values": "error"
}
 }
];
```

Esta configuración usa el eslint-plugin-jsdocplugin al importarlo como local jsdocvariable y luego insertarlo en el pluginsllave en la configuración. Después de eso, las reglas dentro del plugin se refieren a la referencia usando el jsdocnamespace.

Nota: Debido a que los plugins se importan ahora como cualquier otro módulo JavaScript, no hay más aplicación estricta de los nombres de paquetes de plugin. Ya no necesitas incluir eslint-plugin-como el prefijo para tus nombres de paquetes... pero nos gustaría que lo hicieras.

## Espacios de nombre plugin personalizados

Debido a que el nombre del plugin en su configuración ahora se desvincula del nombre del paquete de plugin, puede elegir cualquier nombre que desee, como en este ejemplo:

```javascript
import jsdoc from "eslint-plugin-jsdoc";

export default [
{
files: ["**/*.js"],
plugins: {
jsd: jsdoc
}
rules: {
"jsd/require-description": "error",
"jsd/check-values": "error"
}
 }
];
```

Aquí, el plugin se llama jsden la configuración, por lo que las normas también utilizan jsdindicar de qué plugin vienen.

## De --rulesdirpara los plugins de tiempo de ejecución

Con eslintrc, las reglas necesitaban ser cargadas por el CLI directamente para estar disponibles dentro de un archivo de configuración. Esto significa agrupar las reglas personalizadas en un plugin o el uso de la --rulesdirbandera para especificar el directorio desde el cual ESLint debe cargar las reglas personalizadas. Ambos enfoques requirió algún trabajo adicional para configurar y fueron una causa frecuente de frustración para nuestros usuarios.

Con configuración plana, puede cargar reglas personalizadas directamente en el archivo de configuración. Debido a que los plugins son ahora objetos directamente en la configuración, puede crear fácilmente plugins de tiempo de ejecución que existen sólo en su archivo de configuración, tales como:

```javascript
import myrule from "./custom-rules/myrule.js";

export default [
{
files: ["**/*.js"],
plugins: {
custom: {
rules: {
myrule
}
}
}
rules: {
"custom/myrule": "error"
}
 }
];
```

Aquí, una regla de costumbre se importa como myruley luego se crea un plugin de tiempo de ejecución nombrado customproporcionar esa regla a la configuración como custom/myrule.

Como resultado, vamos a remover --rulesdiruna vez que la transición a la configuración plana esté completa.

## Los transformadores funcionan de manera similar a eslintrc

El processorLa clave de nivel superior funciona principalmente la misma que en eslintrc, siendo el caso de uso primario utilizar un procesador que se define en un plugin, por ejemplo:

```javascript
import markdown from "eslint-plugin-markdown";

export default [
  {
    files: ["**/*.md"],
    plugins: {
      markdown,
    },
    processor: "markdown/markdown",
  },
];
```

Este objeto de configuración especifica que hay un procesador llamado "markdown"contenido en el plugin nombrado "markdown"y aplicará el procesador a todos los archivos que terminan con .md.

La única adición en la configuración plana es que processorahora también puede ser un objeto que contenga tanto un preprocess()y a postprocess()método.

## Opciones de linter organizadas

En eslintrc, había un par de llaves que se relacionaban directamente con la forma en que operaba el linter, a saber, noInlineConfigy reportUnusedDisableDirectives. Estos se han mudado a la nueva linterOptionsclave pero trabaja exactamente igual que en eslintrc. Un ejemplo:

```javascript
export default [
  {
    files: ["**/*.js"],
    linterOptions: {
      noInlineConfig: true,
      reportUnusedDisableDirectives: true,
    },
  },
];
```

## Los ajustes compartidos son exactamente los mismos

El nivel superior settingsla llave se comporta exactamente de la misma manera que en eslintrc. Puede definir un objeto con pares de valor de clave que deben estar disponibles para todas las reglas. Un ejemplo:

```javascript
export default [
  {
    settings: {
      sharedData: "Hello",
    },
  },
];
```

## Uso de configs predefinidos

ESLint tiene dos configuras predefinidas:

    eslint:recommended- permite las normas que ESLint recomienda a todos utilizar para evitar posibles errores
    eslint:all- permite todas las normas enviadas con ESLint

Para incluir estos configuras predefinidos, puede insertar los valores de cadena en el array exportado y luego hacer cualquier modificación a otras propiedades en objetos de configuración posteriores:

```javascript
export default [
  "eslint:recommended",
  {
    rules: {
      semi: ["warn", "always"],
    },
  },
];
```

Aquí, el eslint:recommendedLa configuración predefinida se aplica primero y luego otro objeto de configuración añade la configuración deseada para semi.

## utilidad de compatibilidad hacia atrás

Como se mencionó anteriormente, sentíamos que era necesario que hubiera una buena compatibilidad hacia atrás con el eslintrc para facilitar la transición. El @eslint/eslintrcel paquete proporciona un FlatCompatclase que hace que sea fácil continuar usando configuras y ajustes compartidos de estilo eslintrc dentro de un archivo de configuración plana. Un ejemplo:

```javascript
import { FlatCompat } from "@eslint/eslintrc";
import path from "path";
import { fileURLToPath } from "url";

// mimic CommonJS variables -- not needed if using CommonJS
const **filename = fileURLToPath(import.meta.url);
const **dirname = path.dirname(\_\_filename);

const compat = new FlatCompat({
baseDirectory: \_\_dirname
});

export default [

    // mimic ESLintRC-style extends
    ...compat.extends("standard", "example"),

    // mimic environments
    ...compat.env({
        es2020: true,
        node: true
    }),

    // mimic plugins
    ...compat.plugins("airbnb", "react"),

    // translate an entire config
    ...compat.config({
        plugins: ["airbnb", "react"],
        extends: "standard",
        env: {
            es2020: true,
            node: true
        },
        rules: {
            semi: "error"
        }
    })

];
```

Usando el FlatCompatLa clase le permite continuar utilizando todos sus archivos de eslintrc existentes mientras los optimiza para su uso con configuración plana. Imaginamos esto como un paso de transición necesario para permitir que el ecosistema se convierta lentamente en configuración plana.

## Conclusión

El equipo pasó mucho tiempo diseñando config flat para que ambos se sintieran familiares para los usuarios existentes y proporcionaran nuevas funcionalidades que beneficiaran a todos. Mantuvimos cosas como reglas, configuraciones y procesadores lo mismo al tiempo que extendimos cosas como plugins, opciones de idioma y opciones de linter para ser más uniformes. Creemos que la configuración plana ha encontrado un buen equilibrio entre estos dos postes y que disfrutará utilizando ESLint más una vez que el nuevo sistema de configuración esté generalmente disponible. Mientras tanto, la utilidad de compatibilidad le permitirá continuar usando configuras compartidas existentes.

En la siguiente parte de esta serie de blogs, usted aprenderá a empezar a usar la configuración plana hoy.
