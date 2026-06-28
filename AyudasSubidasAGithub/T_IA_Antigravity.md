# Antigravity

## Plugins de Google Antigravity

A continuación se detalla la transcripción y explicación en español de cada uno de los elementos y plugins que aparecen en la interfaz de **Build with Google**:

### Título y Descripción de la interfaz

> **Construye con Google**
> Los plugins son colecciones empaquetadas de habilidades y MCPs (Model Context Protocol / Protocolos de Contexto de Modelo) para ayudar al Agente en Antigravity a trabajar con los productos para desarrolladores de Google. Siempre puedes cambiar tus opciones en la Configuración.

---

### Lista de Elementos (Plugins)

#### 1. Android

- **Para qué sirve:** Habilita herramientas, documentación y habilidades específicas para el desarrollo de aplicaciones móviles en el sistema operativo Android. Permite al agente ayudarte a escribir código en Kotlin/Java, configurar archivos Gradle o interactuar con las APIs oficiales de Android.

#### 2. Modern Web Guidance

- **Para qué sirve:** Proporciona al agente las mejores prácticas, guías de diseño y estándares actualizados para el desarrollo web moderno (como optimización de rendimiento, accesibilidad, PWAs y compatibilidad entre navegadores utilizando tecnologías web estándar).

#### 3. Google Antigravity SDK

- **Para qué sirve:** Permite al agente interactuar, programar y extender las funcionalidades del propio kit de desarrollo (SDK) de Antigravity. Es útil si estás construyendo herramientas nativas, componentes o automatizaciones profundas dentro del mismo entorno de Antigravity.

#### 4. Science

- **Para qué sirve:** Integra capacidades orientadas a la investigación científica, computación numérica y análisis de datos. Ayuda al agente a comprender y generar código relacionado con bibliotecas científicas de Google (como herramientas de IA, TensorFlow, Jax o computación de alto rendimiento).

#### 5. Firebase

- **Para qué sirve:** Conecta al agente con la plataforma Firebase de Google. Le permite ayudarte a configurar e integrar servicios en la nube como bases de datos en tiempo real (Firestore), autenticación de usuarios, almacenamiento de archivos, funciones en la nube (Cloud Functions) y analíticas en tu aplicación.

#### 6. Chrome DevTools

- **Para qué sirve:** Habilita al agente para interactuar o generar flujos de trabajo relacionados con las herramientas de desarrollo de Google Chrome. Es de gran utilidad para tareas de depuración (debugging), auditorías de rendimiento (Lighthouse), análisis del DOM y perfiles de memoria de aplicaciones web.

#### 7. Dart and Flutter

- **Para qué sirve:** Añade soporte especializado para el lenguaje de programación Dart y el framework Flutter. Permite al agente asistirte eficientemente en la creación de aplicaciones multiplataforma (móvil, web y escritorio) desde una única base de código, optimizando componentes visuales (widgets) y la lógica de estado.

## Downloads

- De la página web oficial (ver Tutoriales link) sección download, tenemos 4 herramientas (_Componentes del Ecosistema Antigravity_)
  - Antigravity 2.0
  - Antigravity CLI
  - Antigravity IDE
  - Antigravity SDK

### Componentes del Ecosistema Antigravity

A continuación se detalla la explicación en español de qué es y para qué sirve cada una de las opciones principales del entorno de Antigravity:

---

#### 1. Antigravity 2.0

- **Qué es:** Es la versión mayor y más reciente del ecosistema completo de Inteligencia Artificial de Google para desarrolladores. Representa la evolución de la plataforma, integrando modelos de lenguaje de última generación (como la serie Gemini 3.5) y capacidades avanzadas de agentes autónomos.
- **Para qué sirve:** Sirve como el motor central y la arquitectura unificada de todo el sistema. Introduce mejoras críticas en la velocidad de procesamiento de código, una mayor ventana de contexto para entender repositorios enteros y la habilidad de coordinar múltiples agentes de IA en paralelo para resolver tareas de desarrollo complejas.
- **Instalación CMD:** Bajar instalador

#### 2. Antigravity CLI (Command Line Interface)

- **Qué es:** Es la interfaz de línea de comandos de Antigravity. Permite interactuar con el sistema de IA mediante comandos de texto escritos directamente en la terminal (consola) de tu sistema operativo (Bash, PowerShell, etc.).
- **Para qué sirve:** Sirve para automatizar tareas y arrancar agentes de IA sin necesidad de abrir una interfaz gráfica. Con ella puedes automatizar auditorías de código en servidores de integración continua (CI/CD), generar documentación de forma masiva en la nube, o ejecutar scripts donde la IA parchee errores en tus repositorios de forma autónoma mediante comandos cortos.
- **Instalación CMD:**
  - <code>curl -fsSL https://antigravity.google/cli/install.cmd -o install.cmd && install.cmd && del install.cmd</code>
  - _Antigravity CLI binary placed successfully at_ <code>C:\Users\xxxxx\AppData\Local\agy\bin\agy.exe</code>
- **Uso**
  - <code>agy --version</code>
  - Estando en el directorio en el que quiero trabajar: <code>agy auth login</code>
    - Seleccionar diseño interfase, aceptar términos y condiciones, aceptar que es de confianza.
  - _Para ver la lista real de comandos de tu versión:_ <code>agy --help</code>
  - <code>agy auth login</code>
  - _Para inicializar el asistente en tu proyecto actual:_ <code>agy init</code>
  - <code>agy chat "Explícame cómo funciona el archivo index.js de este proyecto"</code>
  - <code>agy run "Crea un nuevo endpoint en la API para registrar usuarios y valida que el correo sea real"</code>
  - _Buscar y reparar errores:_ <code>agy audit</code>
  - _Para hacerle una pregunta rápida sobre programación o pedirle un fragmento de código:_ <code>agy ask "Genera una función en JavaScript para validar un formato de fecha"</code>

#### 3. Antigravity IDE (Integrated Development Environment)

- **Qué es:** Es el entorno de desarrollo integrado visual (basado en la arquitectura de VS Code). Es la aplicación de escritorio principal donde los programadores escriben su código de manera cotidiana.
- **Para qué sirve:** Sirve para unificar el editor de código tradicional con el asistente de IA. A través de este entorno visual, puedes ver al agente trabajar en tiempo real en tus archivos, chatear con él en un panel lateral, aceptar o rechazar sugerencias de autocompletado inteligente y gestionar tus proyectos con una interfaz gráfica cómoda y moderna.
- **Instalación CMD:** Bajar instalador

#### 4. Antigravity SDK (Software Development Kit)

- **Qué es:** Es el kit de herramientas y librerías de desarrollo de software que Google pone a disposición de los programadores para comunicarse directamente con las entrañas de Antigravity.
- **Para qué sirve:** Sirve para que tú mismo crees herramientas personalizadas. Si quieres desarrollar un plugin propio, conectar la IA de Antigravity a un sistema interno de tu empresa, o programar "habilidades" específicas (MCPs) que tus agentes autónomos puedan usar en el futuro, utilizas este SDK para escribir el código que hace posible esa integración.

## Tutoriales

- [MoureDev by Brais Moure: Taller de Google Antigravity desde cero](https://www.youtube.com/watch?v=Ota_t3Q-QeY)
  - Índice del curso:
  - 00:00:00 | Introducción
  - 00:06:45 | Primeros pasos
  - 00:11:28 | Instalación y configuración
  - 00:22:41 | Agente y flujo de trabajo
  - 00:45:43 | Agent manager
  - 01:00:27 | Reglas, workflows, skills y MCP
  - 01:15:52 | Conclusiones y recomendaciones
- [Antigravity official page](https://antigravity.google)
