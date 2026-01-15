# .editorconfig

- El **.editorconfig (Universal / Multi-editor)** es un archivo único que sigue un estándar abierto. Su objetivo es mantener un estilo de código consistente sin importar qué editor use cada programador.


  - **Alcance:** Universal. Casi todos los editores (VS Code, JetBrains, Vim, Atom, Visual Studio) lo soportan, ya sea de forma nativa o mediante un plugin.

  - **Qué configura:** Reglas básicas de formato de texto:

    - **indent_style:** ¿Usamos espacios o tabulaciones?

    - **indent_size:** ¿2 o 4 espacios?

    - **end_of_line:** ¿Formato Linux (LF) o Windows (CRLF)?

    - **trim_trailing_whitespace:** Eliminar espacios vacíos al final de las líneas.

    - **insert_final_newline:** Asegurar que el archivo termine con una línea en blanco.

  - **Prioridad:** En VS Code, si tienes instalado el **plugin de EditorConfig**, este archivo manda sobre .vscode/settings.json en lo que respecta al formato básico de texto.

    - 1. El Orden de Prioridad
      - Cuando abres un archivo, VS Code busca configuraciones en este orden (de mayor a menor importancia):
      - .editorconfig (Manda sobre todo lo demás si la extensión está activa).
      - Configuración del Workspace (.vscode/settings.json).
      - Configuración del Usuario (Tu settings.json global que editamos antes).
      - Configuración por defecto de VS Code.

    - 2. ¿Por qué el .editorconfig es el "Rey"?
      - La filosofía de EditorConfig es permitir que un proyecto mantenga un estilo consistente independientemente de quién lo abra o qué editor use. Por eso, los desarrolladores de VS Code diseñaron la extensión para que "pise" (override) tus ajustes personales mientras estés dentro de ese proyecto.
      - Si en tu .vscode/settings.json tienes: "files.eol": "\r\n" (CRLF)
      - Pero en tu .editorconfig tienes: end_of_line = lf
      - Resultado: VS Code usará LF.

```json
  root = true

  [*]
  indent_style = space
  indent_size = 2
  end_of_line = lf
  charset = utf-8
  trim_trailing_whitespace = true
  insert_final_newline = true
  quote_type = single

  [*.md]
  trim_trailing_whitespace = false
```

- **Nota:** 
  - LF: Line Feed / CRLF: Carriage Return Line Feed
  - No me tomaba el **LF** pasos
    - Ver lo que tiene el core.autocrlf
      - <code>cat ~/.gitconfig</code>
      - <code>git config --global core.autocrlf false</code>
    - Si ya se tiene archivos con **CRCF** Git no los cambiará automáticamente solo por crear el archivo. Debes forzar una "normalización" siguiendo estos pasos en tu terminal. Con esto, VS Code debería dejar de mostrarte el aviso de CRLF y empezar a obedecer ciegamente a tu .editorconfig.
      
      - Guarda todo lo que tengas pendiente (<code>git add .</code> y <code>git commit</code>). 
      - Borra el índice de Git (tranquilo, no borra tus archivos físicos):
        - <code>git rm --cached -r .</code>
      - Vuelve a agregar todo:
        - <code>git add .</code>
      - Haz el commit de normalización:
        - <code>git commit -m "Fix: Normalizar finales de línea a LF"</code>
        - Este commit no se realiza razón: 
          - El proceso que seguiste fue el adecuado, pero Git es "inteligente": al hacer el git add ., él comparó los archivos que iba a subir con los que ya tenías en el último commit. Como el contenido del texto es idéntico (aunque cambie el final de línea), Git decidió que no había cambios reales que guardar, por lo que no generó un nuevo commit.
          - Sin embargo, hay una señal de éxito muy importante en tu terminal:
          - warning: in the working copy of 'borrar001/or.html', CRLF will be replaced by LF the next time Git touches it
            - Ese mensaje confirma que tu archivo .gitattributes ya está funcionando. Git ha detectado que el archivo tiene CRLF y te avisa que lo va a normalizar a LF.
    - Revisa el settings.json de VS Code
      - Es muy probable que tengas una regla global que esté forzando CRLF.
      - Presiona **Ctrl + Shift + P**.
      - Escribe "Open User Settings (JSON)" y entra.
      - Busca la propiedad "files.eol".
      - Si dice "files.eol": "\r\n", cámbiala a: "files.eol": "\n"
    - warning: in the working copy of 'borrar001/or.xml', LF will be replaced by CRLF the next time Git touches it
      - ¡Cuidado! Ese mensaje de advertencia (LF will be replaced by CRLF) indica que Git está haciendo exactamente lo contrario de lo que queremos. 
      - Ese aviso significa que Git va a convertir tus archivos a formato Windows (CRLF) al guardarlos, lo cual anula tu configuración de .editorconfig. Esto sucede porque la configuración global de tu Git tiene prioridad sobre lo que intentamos hacer.
      - Buscar dónde está el true
        - <code>git config --list --show-origin | grep crlf</code>
          file:C:/Program Files/Git/etc/gitconfig core.autocrlf=true
          file:C:/Users/Byron/.gitconfig  core.autocrlf=false
        - Cambiar el de sistema
          - <code>git config --global core.autocrlf false</code>
          - <code>git config --system core.autocrlf false</code>

# .gitAttributes

```bash
  # Forzar que Git detecte automáticamente los archivos de texto y los normalice
  * text=auto eol=lf

  # Declarar explícitamente que los archivos de código usen siempre LF al ser guardados en el repo
  *.js text eol=lf
  *.ts text eol=lf
  *.json text eol=lf
  *.md text eol=lf
  *.yml text eol=lf
  *.html text eol=lf
  *.css text eol=lf

  # Asegurar que los archivos binarios (imágenes, etc.) no sean modificados
  *.png binary
  *.jpg binary
  *.gif binary
```

# settings.json 
  - Presiona **Ctrl + Shift + P**.
  - Escribe "Open User Settings (JSON)" y entra.
  - Busca la propiedad "files.eol".
  - Si dice "files.eol": "\r\n", cámbiala a: "files.eol": "\n", si no está agregarla en la llave principal grupo files.

# .vscode 
  
  - **.vscode (Específico de Visual Studio Code)** Es una carpeta que contiene archivos JSON (principalmente **settings.json**). Sirve para configurar el comportamiento exclusivo de VS Code para ese proyecto.

  - **Alcance:** Solo afecta a VS Code. Si un compañero usa IntelliJ, WebStorm o Sublime, estos archivos no harán nada por él.

  - **Qué configura:** Extensiones recomendadas para el proyecto (extensions.json).

    - Configuraciones de depuración y ejecución (launch.json).

    - Tareas de automatización (tasks.json).

    - Preferencias de la interfaz (ej. ocultar la barra lateral, temas específicos, reglas de linting exclusivas de VS Code).
  
  - **Prioridad:** Sobrescribe tus ajustes globales de VS Code, pero solo mientras estés dentro de esa carpeta de proyecto.

## VSC

    - Editor config
    	- https://editorconfig.org/
    	- // Tauri: https://github.com/tauri-apps/tauri/blob/dev/.editorconfig

    	- Crear un archivo de nombre ".editorconfig"
    	- Bajar el pluggin "T_VSC_Plugins" --> "EditorConfig for VS Code"

    	- Mirar **T_EditorConfig.md**

## Notepad++

    - Editor config
      - https://github.com/editorconfig/editorconfig-notepad-plus-plus

      - Soporta
          - indent_style
          - indent_size
          - tab_width
          - end_of_line
          - trim_trailing_whitespace
          - insert_final_newline
          - charset
          - root (only used by EditorConfig core)

## Mensaje sobre LF y CRLF

  Es muy común encontrarse con este "dolor de cabeza" al usar **GitHub**, y tiene que ver con cómo los diferentes sistemas operativos interpretan el final de una línea de texto.

  Aquí te explico la diferencia y por qué GitHub siempre te advierte sobre ello:

  **Los dos protagonistas: LF y CRLF**
  
  Históricamente, los sistemas operativos no se pusieron de acuerdo en cómo marcar que una línea termina y empieza la siguiente:

    - **LF (Line Feed, \n):** Utilizado por **Linux y macOS**. Solo usa el carácter de "Salto de línea" (Decimal 10, ^J en tu tabla).

    - **CRLF (Carriage Return + Line Feed, \r\n):** Utilizado por **Windows**. Usa dos caracteres: "Retorno de Carro" (Decimal 13, ^M) seguido del "Salto de línea".

    **Nota:** El nombre viene de las antiguas máquinas de escribir: el **CR** movía el carro al inicio de la hoja y el **LF** bajaba el rodillo una línea.

  ----

  **¿Por qué GitHub te da avisos al subir archivos?**

  GitHub utiliza Git, que nació en el mundo de Linux (donde se usa LF). Cuando trabajas en equipo y alguien usa Windows y otro usa Mac, ocurre lo siguiente:

  1.- **Conflictos invisibles:** Git puede pensar que cambiaste todo el archivo solo porque los finales de línea son diferentes, aunque el código sea el mismo.

  2.- **La solución automática:** Git tiene una función llamada autocrlf.

    - **En Windows:** Git convierte los LF en CRLF cuando descargas el código para que tu editor lo vea bien.

    * **Al subir (commit):** Git convierte tus CRLF de vuelta a LF para que en el servidor todo esté estandarizado.

  **El mensaje: "LF will be replaced by CRLF"**

    Si ves este mensaje, Git simplemente te está avisando que está normalizando los archivos para que no haya problemas de compatibilidad entre tus compañeros de proyecto.

  ----

  **¿Cómo configurarlo para evitar problemas?**

    Si quieres que deje de darte avisos o quieres fijar un estándar, puedes ejecutar este comando en tu terminal:

      - **Si estás en Windows:** <code>git config --global core.autocrlf true</code>

      - **Si estás en Mac/Linux:** <code>git config --global core.autocrlf input</code>

    ¿Te ha pasado que al abrir un archivo de Linux en el Bloc de Notas de Windows viejo se veía todo en una sola línea larga? Eso era exactamente por la falta del CR.

    ¿Te gustaría saber cómo configurar un archivo <code>.gitattributes</code> para forzar que todos en tu proyecto usen el mismo formato?

    Para asegurar que todos los colaboradores de un proyecto usen el mismo formato (ya sea **LF o CRLF**) y evitar que Git "se vuelva loco" con los cambios de línea, lo mejor es usar un archivo llamado <code>.gitattributes</code>.

    Este archivo se guarda en la carpeta raíz de tu repositorio y funciona como un "manual de instrucciones" para Git sobre cómo tratar cada tipo de archivo.

    **Cómo crear un archivo <code>.gitattributes</code>**

      1.- Crea un archivo de texto plano en la raíz de tu proyecto y nómbralo exactamente .gitattributes.

      2.- Añade las siguientes reglas (estas son las más recomendadas para la mayoría de proyectos):

      ```Plaintext
        # Forzar que todos los archivos de texto se normalicen a LF al subir al repo
        * text=auto

        # Asegurar que archivos específicos siempre usen LF (ideal para scripts de Linux)
        *.sh text eol=lf

        # Asegurar que archivos siempre usen CRLF (si tienes archivos específicos de Windows)
        *.bat text eol=crlf

        # Marcar archivos binarios (imágenes, PDFs) para que Git no intente tocarlos
        *.png binary
        *.jpg binary
      ```
  **¿Por qué es mejor esto que los comandos de terminal?**

    - **Es compartido:** A diferencia del comando git config (que solo afecta a tu computadora), el archivo <code>.gitattributes</code> se sube al repositorio.

    - **Consistencia automática:** Cuando un compañero de equipo clone el proyecto, Git configurará los finales de línea automáticamente basándose en este archivo, sin que ellos tengan que hacer nada.

    - **Evita "ruido" en los Commits:** Evita que aparezcan cambios en 100 líneas cuando en realidad solo editaste una, pero tu editor cambió el formato de las demás.

  **Un último detalle sobre el aviso de Git**

    Si después de configurar esto sigues viendo avisos, puede que necesites "refrescar" el índice de Git para que aplique las nuevas reglas a los archivos que ya estaban ahí. Se hace con estos comandos (**¡asegúrate de haber guardado tus cambios primero!**):

    <code>git add . -u</code>

    <code>git commit -m "Normalizando finales de línea"</code>

  **¿Te gustaría que te ayude a redactar un archivo .gitattributes específico para el lenguaje de programación que estás usando (como Python, JS o C++)?**


    ¡Excelente! Para que tu proyecto esté bien organizado desde el principio, aquí tienes una configuración estándar de .gitattributes que funciona para casi cualquier lenguaje de programación moderno (Node.js, Python, Java, C++, etc.).

    Plantilla recomendada para .gitattributes
    Copia este contenido en un archivo llamado .gitattributes en la carpeta principal de tu proyecto:

    ```Plaintext
      # 1. Configuración por defecto: detectar archivos de texto y normalizarlos a LF
      * text=auto

      # 2. Asegurar que archivos de código siempre usen LF al subir al repo
      # (Esto protege el código si alguien lo edita en Windows)
      *.js    text eol=lf
      *.py    text eol=lf
      *.cpp   text eol=lf
      *.h     text eol=lf
      *.java  text eol=lf
      *.html  text eol=lf
      *.css   text eol=lf
      *.json  text eol=lf

      # 3. Scripts que DEBEN ser LF para correr en servidores Linux/Docker
      *.sh    text eol=lf

      # 4. Archivos específicos de Windows que deben mantener CRLF
      *.bat   text eol=crlf
      *.ps1   text eol=crlf

      # 5. Marcar archivos binarios para que Git no intente "corregirlos"
      *.png   binary
      *.jpg   binary
      *.jpeg  binary
      *.gif   binary
      *.pdf   binary
      *.zip   binary

    ```

  **¿Cómo aplicar los cambios si ya tienes archivos subidos?**

    Si ya tenías archivos con finales de línea "mezclados" en GitHub, simplemente crear el archivo no los arreglará mágicamente en el historial. Debes hacer una "renormalización":

    1.- **Guarda todo:** Asegúrate de que no tienes cambios sin commitear.

    2.- **Borra el índice de Git:** <code>git rm --cached -r .</code> (esto no borra tus archivos, solo los quita del seguimiento temporal de Git).

    3.- **Vuelve a agregar todo:** git add . (aquí Git leerá tu nuevo <code>.gitattributes</code> y corregirá los finales de línea).

    4.- **Commit:** <code>git commit -m "Fix: Normalizando finales de línea con .gitattributes"</code>

  **Un pequeño truco extra**

    Si usas **VS Code**, puedes ver qué final de línea tiene el archivo que estás editando en la esquina inferior derecha de la ventana (verás que dice LF o CRLF). Si haces clic ahí, puedes cambiarlo manualmente para ese archivo específico.

    ¿Qué lenguaje de programación o entorno estás usando actualmente? Puedo darte reglas más específicas si es algo como Unity, .NET o aplicaciones móviles.
