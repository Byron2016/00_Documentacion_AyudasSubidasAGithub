---
title: "ESLint's new config system, Part 3: Developer preview"
author: "Nicholas C. Zakas"
date: "08/8/2022"
url: "https://eslint.org/blog/2022/08/new-config-system-part-3/"
---

# Nuevo sistema de configuración de ESLint, Parte 3: Vista previa del desarrollador

> Aunque el nuevo sistema de configuración aún no se incorpora al CLI, está disponible a través de la API para que los desarrolladores la prueba.

En mi anterior post, expliqué los conceptos fundamentales de la utilización del nuevo sistema de configuración de plano. El nuevo sistema de configuración aún no está vinculado al CLI mientras hacemos más pruebas internas, pero queríamos dar a la comunidad de ESLint la oportunidad de experimentar con la configuración plana mientras trabajamos en incorporarlo al CLI. Así que ESLint v8.21.0 incorpora varias maneras de probar configuración plana mientras trabajamos en él. Por favor, tenga en cuenta que todo lo que se menciona en este post es experimental y nos encantaría su retroalimentación a medida que lo prueba.

## Usando configación plana con el Linterclase

Si estás usando Linterde la eslintpaquete, puede habilitar la configuración plana mediante la configuración configType: "flat"como opción en el constructor. Un ejemplo:

```javascript
const linter = new Linter({ configType: "flat" });

const messages = linter.verify(
  "new Map()",
  {
    languageOptions: {
      ecmaVersion: 5,
      sourceType: "script",
    },
    rules: {
      "no-undef": "error",
    },
  },
  "filename.js"
);
```

Cuando pases configType: "flat"como opción, Linterespera que cualquier objeto de configuración que se pase a verify()será en formato de configuración plana. En este ejemplo, el segundo argumento a verify()es un objeto de configuración plana (puede pasar un solo objeto o una matriz de objetos). Cualquier llamada a verify()asumirá que el texto que se está linando es un archivo JavaScript cuyo nombre de archivo termina con .js, pero siempre es una buena idea para pasar en un nombre de archivo explícito como el tercer argumento.

Si bien este caso base funciona igual independientemente del sistema de configuración que utilices, hay algunas diferencias importantes:

    defineRule(), defineRules(), y defineParser()ahora lanza errores. Los plugins de tiempo de ejecución (discutidos en mi post anterior) hacen que estos métodos sean obsoletos.
    getRules()también lanza un error. Este método devolvería diferentes datos dependiendo de cuándo se llamara, por lo que no se puede utilizar con configuración plana.

## Usando configación plana con el ESLintclase

Al implementar configuración plana descubrimos que sería demasiado difícil crear una opción para cambiar entre sistemas de configuración como lo hicimos para Linter. En cambio, creamos un FlatESLintclase que encapsula toda la funcionalidad existente en ESLintpero utiliza config plano en lugar de eslintrc. El FlatESLintclase está pensada sólo como una vista previa de la funcionalidad; una vez que cambiamos a la configuración plana permanentemente, la corriente ESLintla clase se eliminará y FlatESLintserá renombrado ESLint.

Por ahora, puedes acceder a FlatESLinta través de la use-at-your-own-riskpunto de entrada, así:

```javascript
// ESM
import pkg from "eslint/use-at-your-own-risk";
const { FlatESLint } = pkg;

// CommonJS
const { FlatESLint } = require("eslint/use-at-your-own-risk");
```

Después de eso, puedes usar FlatESLintde la misma manera que ESLint, como:

```javascript
const eslint = new FlatESLint({
  cwd: originalDir,
  overrideConfigFile: "other.config.js",
});
const results = await eslint.lintText("foo");
```

Al igual que con Linter, hay algunas diferencias entre FlatESLinty ESLintvale la pena señalar:

    Caché aún no se implementa en FlatESLint, así que cache: truelanza un error.
    El useEslintrcse ha eliminado la opción. Si quieres evitar la carga automática de eslint.config.jssin especificar un archivo de configuración alternativa, establecido overrideConfigFile: true.
    El envsse ha eliminado la opción.
    El resolvePluginsRelativeTose ha eliminado la opción.
    El rulePathsse ha eliminado la opción. Las normas aduaneras deben añadirse directamente por configuración.

## Reglas de prueba con la configuración plana y la RuleTesterclase

Similar a la ESLintclase, no había una manera fácil de proporcionar una opción para cambiar entre eslintrc y configuración plana, así que creamos un separado FlatRuleTesterclase. También similar a ESLint, el FlatRuleTesterclase es temporal y finalmente será renombrada RuleTesteruna vez que hemos cambiado completamente a la configuración plana. Puedes acceder FlatRuleTestercomo esto:

```javascript
// ESM
import pkg from "eslint/use-at-your-own-risk";
const { FlatRuleTester } = pkg;

// CommonJS
const { FlatRuleTester } = require("eslint/use-at-your-own-risk");
```

Cualquier lugar donde se pueda especificar una configuración de eslintrc en RuleTestertiene que ser una configuración plana en FlatRuleTester. Estos son algunos ejemplos:

```javascript
const ruleTester = new FlatRuleTester({
  languageOptions: {
    ecmaVersion: 5,
    sourceType: "script",
  },
});

ruleTester.setDefaultConfig({
  languageOptions: {
    ecmaVersion: 5,
    sourceType: "script",
  },
});
```

En pruebas individuales, puedes usar languageOptionsdirectamente en cada prueba:

```javascript
ruleTester.run("my-rule", rule, {
  valid: [
    {
      code: "var test = 'foo'",
      languageOptions: {
        sourceType: "script",
      },
    },
    {
      code: "var test2 = 'bar'",
      languageOptions: {
        globals: { test: true },
      },
    },
  ],
  invalid: [
    {
      code: "bar",
      languageOptions: {
        sourceType: "script",
      },
      errors: 1,
    },
  ],
});
```

Algunas cosas a tener en cuenta al usar FlatRuleTester:

    El incumplimiento ecmaVersiones ahora "latest", así que si no estás especificando ecmaVersionen sus pruebas, puede haber una incompatibilidad porque eslintrc por defecto ecmaVersionera 5.
    El incumplimiento sourceTypees ahora "module", así que si no estás especificando sourceTypeen sus pruebas, puede haber una incompatibilidad porque eslintrc por defecto sourceTypeera "script". Esto se manifiesta principalmente cuando se trata de variables en el ámbito global.

## Conclusión

Pensamos que el nuevo sistema de configuración será una gran experiencia para los usuarios de ESLint, pero para que eso suceda, tenemos que asegurarnos de que el ecosistema de ESLint esté listo para estos cambios. Es por qué hemos preparado esta vista previa del desarrollador para permitir que todos nuestros autores de configuración de plugin, personalizados, analizador y compartir puedan obtener una mirada temprana sobre cómo sus paquetes funcionarán en el nuevo sistema de configuración. Esta es su oportunidad de darnos sus comentarios y ayudar a trabajar a través de cualquier incompatibilidad o problema con la configuración plana.

Por favor, pruebe configue plano con sus paquetes y háganos saber cómo pasa por iniciar una discusión o detenerse por el canal Discord de los desarrolladores si tiene preguntas o abrir un problema si descubre un problema.

Agradecemos su ayuda y retroalimentación.
