---
title: "ESLint's new config system, Part 1: Background"
author: "Nicholas C. Zakas"
date: "03/8/2022"
url: "https://eslint.org/blog/2022/08/new-config-system-part-1/"
---

# El nuevo sistema de configuración de ESLint, Parte 1:

> El sistema de configuración de ESLint comenzó bastante simple en 2013. Desde entonces se ha vuelto más complejo y es hora de un cambio.

Cuando ESLint fue lanzado por primera vez en 2013, el sistema de configuración era bastante simple. Podrías definir las reglas que querías habilitar o desactivar en un archivo <code>.eslintrc</code>. Cuando un archivo fue linteado (<span style="color:red">linted</span>), ESLint primero buscaría en el mismo directorio que ese archivo por un archivo <code>.eslintrc</code> y luego continuar por la jerarquía de directorios hasta llegar a la raíz, fusionando configuraciones de todos los carchivos archivo <code>.eslintrc</code> encontrados en el camino. Este sistema, al que llamamos la cascada de configuración, le permitió a usted sobre escribir fácilmente las reglas para directorios particulares, algo que JSHint no era capaz de hacer. También podía añadir más configuración en la llave <code>eslintConfig</code> dentro de <code>package.json</code>.

Con los años, sin embargo, el sistema de configuración se convirtió en un desastre difícil de manejar. Por eso en 2019 propuse crear un nuevo sistema de configuración para facilitar la configuración de ESLint en un mundo donde los proyectos JavaScript son cada vez más complejos. Una porción significativa del nuevo sistema de configuración se ha fusionado en la rama principal, por lo que es hora de empezar a aprender sobre cómo configurar ESLint en el futuro. Pero para hacer eso, es útil echar un vistazo hacia atrás y ver cómo llegamos al estado actual de las cosas..

## Cambios incrementales que conducen a la máxima complejidad

Mirando hacia atrás en cómo el sistema de configuración actual (llamado sistema de eslintrc) evolucionó, cada paso tenía sentido lógico para donde estábamos en ese momento. ESLint siempre ha operado en un enfoque incremental del desarrollo en el que buscamos maneras de mejorar lo que ya tenemos en lugar de tirar las cosas a la vez para empezar de nuevo. El sistema de eslintrc no era diferente.

## La llave <code>extends</code>

El primer cambio significativo a eslintrc fue con la introducción de la llave <code>extends</code>. La llave <code>extends</code>, prestada claramente de JSHint, permitió a los usuarios importar otra configuración y luego aumentarla, por ejemplo:

```json
{
  "extends": ["./other-config.json"],
  "rules": {
    "semi": "warn"
  }
}
```

Así que asumiendo <code>./other-config.json</code> tenía algunos datos de configuración, usted podría importar eso y luego agregar sus propios <code>rules</code> ajustes (settings) en la parte superior de la misma. Esto resultó ser un gran paso adelante para ESLint por varias razones.

Primero, <code>extends</code> en realidad precedió a la idea de configs compartidos que podrían distribuirse a través de npm. Fue durante la implementación de <code>extends</code> que nos dimos cuenta de que los configs compartidos eran posibles. Los ficheros especificados en <code>extends</code> fueron cargados a través de las funciones Node.js <code>require</code> (), para que cualquier cosa que Node.js pueda cargar a través de esa función también podría funcionar como una configuración para extenderse.

Segundo, <code>extends</code> nos permitió implementar <code>eslint:recommended</code>, el conjunto de reglas que sentíamos que eran importantes para habilitar a todos. Originalmente ESLint tenía varias reglas habilitadas por defecto, pero eso se convirtió en una carga para los usuarios. Así que cambiamos a tener todas las reglas desactivadas por defecto, lo que también fue confuso para los nuevos usuarios que no vieron ninguna regla. Añadiendo <code>eslint:recommended</code> nos permitió hacer explícito que usted estaba incluyendo un montón de reglas que recomendamos, pero usted podría también eliminarlas si no las quería.

En retrospectiva, si hubiéramos pensado las cosas a través de un poco más, habríamos eliminado la cascada de configuración en este punto. La introducción de <code>extends</code> permitieron muchos de los mismos casos de uso que la cascada, y mantener ambos resultó ser un desastre que pasaríamos años tratando de arreglar.

## Configs personales

La siguiente capa de complejidad se añadió cuando la gente pidió que añadimos la capacidad de tener un archivo de configuración personal en <code>~/.eslintrc</code>. Así que añadimos un chequeo adicional: si no encontramos un archivo de configuración en la ancestro de la ubicación del archivo, entonces buscaríamos automáticamente un archivo de configuración personal.

## Múltiples formatos de archivo de configuración

Como parte de una refactorización, descubrimos que sería trivial permitir diferentes formatos de archivo de configuración. En lugar de obligar a todos a usar un archivo <code>.eslintr</code>, podríamos formalizar el formato JSON como <code>.eslintrc.json</code> y añadir también soporte para YAML (<code>.eslintrc.yml</code> o <code>.eslintrc.yaml</code>) y JavaScript (<code>.eslintrc.js</code>). Por compatibilidad hacia atrás seguimos apoyando <code>.eslintrc</code> porque era una cantidad trivial de código para mantener.

Esto también resultó, en retrospectiva, no ser una gran idea. Agregar un formato de archivo de configuración JavaScript creó una incompatibilidad entre él y los formatos no-JS: cualquier objeto JavaScript podría pasarse en la configuración y estar disponible en las reglas. Debido a que no validamos correctamente la configuración para que coinciera exactamente los formatos no-JS, terminamos con algunas reglas que requieren que los objetos de expresión regulares sean pasados para ser configurados correctamente. Si bien esto podría funcionar en el formato de archivo de configuración de JS, las reglas no podían configurarse correctamente en archivos de configuración no-JS. Desafortunadamente, debido a que las reglas del plugin dependían de esta funcionalidad, no pudimos volver atrás y arreglarlo sin romper las cosas.

## Configs y dependencias compartidas

Tal vez el mayor problema que enfrentamos tempranomente fue cuando npm decidió <code>dejar de instalar peer dependencies den v3</code>. Antes de este punto, habíamos recomendado que los configs compartidos incluyeran cualquier plugin de los que dependían como peer dependencies en lugar de dependencias regulares. Esta fue una rareza de la forma en que <code>extends</code> se implementó: usando <code>require()</code>.

Porque las configs compartidas eran sólo de datos y no de referencia a dependencias de Node.js directamente, <code>require()</code> no cargaría automáticamente las dependencias directas en la ruta para que ESLint los resuelva. Las peer dependencies, por otro lado, funcionaron a la perfección con solo usar <code>require()</code> porque se instalaron en un lugar donde funcionaba el paquete normal.

Cuando npm v3 dejó de instalar peer dependencies por defecto, todos los configuraciones compartidos que dependían de este comportamiento dejaron de funcionar correctamente. Hay una <code>cuestión de larga data</code> solicitando que se permita a las configuraciones compartidas utilizar dependencias directamente, pero la arquitectura de eslintrc no lo permitió. Habríamos tenido que recrear toda la funcionalidad de <code>require()</code> dentro de ESLint para trabajar en la forma en que se diseñaron las configuras compartidas. Recomendamos que los configuraciones compartidos creen un script post-instalación para instalar sus peer dependencies en su lugar. No ideal por ningún lado de la imaginación.

Añadimos la opción de comando en línea <code>--resolve-plugins-relative-to</code> para tratar de ayudar con este problema, pero no fue suficiente. Las solicitudes de ayuda más populares en nuestro <code>canal de Discord #help</code> tienen que ver con la resolución incorrecta de los plugins de los archivos de configuración.

nppm eventualmente cambió de nuevo a la instalación de peer dependencies por defecto en v7, pero para ese momento se había hecho el daño en el ecosistema de ESLint.

## La llave <code>root</code>

Con el paso del tiempo, la cascada de la configuración siguió causando problemas a los usuarios. La mayoría de las veces, la gente no se daría cuenta de que tenía un archivo de configuración en un directorio ancestro del proyecto en el que estaban trabajando. Esto crearía confusión porque estarían obteniendo ajustes de ESLint que aparentemente no habían configurado.

Para ayudar con este problema presentamos la propiedad <code>root</code> para archivos de configuración. Cuando <code>root: true</code> se especifique en una configuración, la búsqueda de otros archivos de configuración no procede a los directorios ancestros. Esto detuvo un poco de la confusión y terminamos incluyendo automáticamente <code>root: true</code> en las configuras que ESLint generó a través de los viejos comandos <code>--init</code> para ayudar a los usuarios a empezar con la menor cantidad de confusión.

## La llave <code>overrides</code>

ESLint continuó recibiendo solicitudes de formas más potentes para configurar sus proyectos. Más concretamente, hubo solicitudes para proporcionar configs basados en <code>glob</code> desde los archivos de configuración existentes. Esto llevó a la creación de claves <code>overrides</code> que le permitiría modificar las configuraciones para un subconjunto específico de archivos que ESLint estaba linteado (<span style="color:red">linted</span>). Un ejemplo:

The overrides key
ESLint continued to receive requests for more powerful ways to configure their projects. More specifically, there were requests to provide glob-based configs from within existing config files. This led to the creation of an overrides key that would let you further modify configurations for a specific subset of files that ESLint was linting. Here’s an example:

```json
{
  "rules": {
    "quotes": ["error", "double"]
  },

  "overrides": [
    {
      "files": ["bin/*.js", "lib/*.js"],
      "excludedFiles": "*.test.js",
      "rules": {
        "quotes": ["error", "single"]
      }
    }
  ]
}
```

En este caso, los archivos de JavaScript en <code>bin</code> y <code>lib</code> prefiera comillas simples en lugar de las comillas dobles preferidas en todas partes.

La clave <code>overrides</code> con configuración basada en glob resultó ser una manera mucho mejor de lograr lo que la cascada de configuración estaba tratando de hacer. Una vez más, en retrospectiva, este habría sido el momento perfecto para tratar de quitar la cascada... pero no lo hicimos. Y la complejidad no se detuvo ahí.

# Añadiendo <code>extends</code> a <code>overrides</code>

El último paso del desarrollo de eslintrc fue añadir la llave <code>extends</code> a las configuraciones <code>overrides</code>, permitiendo a los usuarios inyectar datos de configuración adicionales en un objeto de configuración basado en glob, como este:

```json
{
  "rules": {
    "quotes": ["error", "double"]
  },

  "overrides": [
    {
      "files": ["bin/*.js", "lib/*.js"],
      "excludedFiles": "*.test.js",
      "extends": ["eslint:recommended"],
      "rules": {
        "quotes": ["error", "single"]
      }
    }
  ]
}
```

Esta adición también introdujo una gran cantidad de complejidad adicional porque teníamos que averiguar cómo fusionar patrones de glob entre dos configuras diferentes. El resultado final fue que <code>extends</code> dentro de config <code>overrides</code> usaría un operador AND para fusionarse <code>files</code> y <code>excludedFiles</code>. Si no estás seguro de lo que eso significa exactamente, no estás solo. Nos confunde.

## Necesidad de simplificación

Alrededor del nuevo año de 2019, me preocupaba más por la complejidad del sistema eslintrc. Cada vez recubrimos más preguntas sobre mensajes de error oscuro relacionados con la carga de archivos de configuración que no encontraran otros archivos de configuración o plugins. Además, el equipo se estaba volviendo colectivamente temeroso de tocar cualquier cosa que tuviera que ver con el sistema de configuración. Nadie entendió realmente todas las diferentes permutaciones en torno al cálculo de la configuración final para un archivo dado. Habíamos caído en la trampa que hacen muchos proyectos de software: seguimos añadiendo nuevas características sin dar un paso atrás para mirar el problema (y la solución) holísticamente. Esto había llevado a una parte casi inmanejable de nuestra base de código.

Fue en este momento que hice un experimento de pensamiento: cómo sería el sistema de configuración si empezara de cero, hoy, sabiendo todo lo que ahora sé sobre ESLint? Lo que siguió fue la <code>propuesta RFC</code> más polémica en la historia de ESLint. En ese momento, el equipo estaba dividido casi uniformemente entre los que querían tirar eslintrc y empezar de cero y aquellos que sentían que el eslintrc podía salvarse con más iteraciones. En última instancia, después de 18 meses de revisiones y debate, decidimos que era hora de embarcarse en un sistema de configuración completamente nuevo construido con la realidad actual en mente.

# El camino a seguir

Ahora 2022 y finalmente tenemos la primera implementación del nuevo sistema de configuración lanzado en [v8.21.0](https://eslint.org/blog/2022/08/eslint-v8.21.0-released/). El nuevo sistema, que apodamos "flat config", está diseñado para sentirse familiar con los usuarios de ESLint existentes, al tiempo que simplifica el proceso de configuración de un archivo de configuración. Flat config no está todavía disponible a través del CLI, a medida que continuamos trabajando en errores y reuniendo comentarios, pero está disponible para los desarrolladores que utilizan la API directamente. Estaré hablando del diseño de la configuración plana en la [parte 2](https://eslint.org/blog/2022/08/new-config-system-part-2/) de esta serie.
