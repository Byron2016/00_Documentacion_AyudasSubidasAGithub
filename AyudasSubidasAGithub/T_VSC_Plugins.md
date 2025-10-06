- **Command line extension management**

  - **Git Blame SIN EXTENSIONES**
    - Ir a Configuración de Usuario
      - <code>crtl + ,</code>
    - Buscar blame
    - <code>Git/Blame/Editor Decoration:Enabled (Controla si se va a mostrar información de autoría en el editor)</code>
  - [vsc Extension Marketplace](https://code.visualstudio.com/docs/editor/extension-marketplace#:~:text=Depending%20on%20your%20platform%2C%20the,%25USERPROFILE%25%5C.vscode%5Cextensions)

    - code --extensions-dir <dir>
      Set the root path for extensions.
    - code --list-extensions
      List the installed extensions.
    - code --show-versions
      Show versions of installed extensions, when using --list-extension.
    - code --install-extension (<extension-id> | <extension-vsix-path>)
      Installs an extension.
      - code --install-extension astro-build.astro-vscode
    - code --uninstall-extension (<extension-id> | <extension-vsix-path>)
      Uninstalls an extension.
    - code --enable-proposed-api (<extension-id>)
      Enables proposed API features for extensions. Can receive one or more extension IDs to enable individually.

- **Plugins utilizados en Visual Studio Code**

  - Settings:
    - Se encuentran en: VER: T_VSC_001
    - Crtl + , (https://code.visualstudio.com/docs/getstarted/settings)
  
  -  [L1 24.25 Midulive: CONFIGURO desde CERO el sistema UBUNTU para DESARROLLO WEB + RUST](https://www.youtube.com/watch?v=x7jsxdRxEiw)
     
    - **Instalación y configuraciones iniciales**

      - **Instalar Cascadia Code** (L1 17:10)
        - https://github.com/microsoft/cascadia-code/releases
        - Bajar el zip
        - Click derecho sobre la fuente y seleccionar "Instalar para todos los usuarios"
          - path: C:\Windows\Fonts
          - [Conoce los Diferentes Formatos de Fuentes (OTF, TTF y WOFF)](https://design.tutsplus.com/es/articles/different-font-file-types-explained-ott-ttf-woff--cms-39047)
            - otf: 
              - OpenType
            - ttf: 
              - TrueType
            - woff2: 
              - formato abierto para la web
              - Es una nueva versión de woff
              - No se pueden instalar en el sistema 
            - Qué elegir
              - **Elige una fuente TTF/OTF**: Si quieres una compatibilidad total entre navegadores y sistemas operativos. Los formatos de fuente TTF de la vieja escuela y las modernas fuentes TTF y OTF pueden ser útiles para ampliar la compatibilidad en los navegadores de Internet más antiguos, especialmente en los dispositivos móviles.
              - **Elige el formato WOFF**: Si utilizas un navegador moderno, el formato WOFF engloba tanto el formato TTF como el formato OTF en un único archivo comprimido. ¡Es más ligero a la hora de cargar!
              - **Elige los archivos WOFF 2.0**: La versión más reciente desarrollada por Google. Los archivos WOFF 2.0 son los mejores por su reducido tamaño y por su mayor rendimiento de carga en navegadores modernos.
              - **Elige el formato SVG**: Para trabajos gráficos que requieran efectos especiales como animación, profundidad de color y múltiples transparencias. En ocasiones, este formato también puede utilizarse para en sitios web, pero algunos navegadores han eliminado por completo el soporte del formato, como Chrome.
        - En VSC Settings buscar Font Family y poner (Lo explico más abajo en *settings.json*)
          - 'Cascadia Code',
        
      - **Abrir settings.json** (L1 32:05)
        - Crtl + Shif + P
        - Open Settings.json (buscar settings.json y escoger user settings.json)
          - Existen 
            - Preferences: Open User Settings (JSON)
              - Path: (C:\Users\Byron\AppData\Roaming\Code\User\settings.json)
            - Preferences: Open Default Settings (JSON)
              - Path: read-only version of the defaultSettings.json
            - Preferences: Open Workspace Settings (JSON)
              - Path: .vscode
        - Abrir un editor cree un archivo nuevo sin título.
          - "workbench.startupEditor":"newUntilLedFile"
        - brackets líneas colores (L1 36:00)
          - "editor.guides.barcketPairs: true
        - brackets líneas colores (L1 36:30)
          - "editor.barcketPairsColorizations.enable: true
        - Al crear un archivo detecte el lenguaje y ponga el tipo (L1 35:00), 
          - "workbench.editor.languageDetection" : true

        ```json

          {
            "workbench.colorTheme": "One Dark Pro Darker",
            "workbench.startupEditor":"newUntitledFile", //al abrir editor crea archivo nuevo
            "workbench.editor.languageDetection" : true, //Detectar lenguaje
            "workbench.iconTheme": "material-icon-theme", //hay que instalar material icon theme
            "files.autoSave": "afterDelay",
            "editor.fontFamily": "\"Cascadia Code\",Consolas, \"Courier new\", monospace, Arial",
            "editor.fontLigatures": true,
            "editor.guides.bracketPairs":true , //Brackets
            "editor.bracketPairColorization.enabled": true, //Brackets
            "gitlens.hovers.currentLine.over": "line",
            "gitlens.currentLine.enabled": false,
            "window.titleBarStyle": "custom",
            "oneDarkPro.bold": true,   //tema
            "oneDarkPro.italic": true, //tema
            "oneDarkPro.vivid": true,  //tema
            "workbench.sideBar.location":"left", //poner a que lado se ve el sidebar
            "telemetry.telemetryLevel": "off", //no telemetría
            "editor.codeActionsOnSave": {
              "source.fixAll.eslint": "always" //para eslint al guardar arregle (ojo midu puso true)
            },
          }
			  ```

        - **Configuración de Prettier** NO hacerlo en el editor, hacerlo en un fichero aparte. 43:30 

    - **Plugins**
      - *✔ sigfinica que en otros se vuelve a poner el mismo plugins.*
      - ✔**Astro** [Midulive 13.20: Aprende Astro 3 desde cero: Curso para principiantes + aplicacion con Astro](https://www.youtube.com/watch?v=RB5tR_nqUEw)
        - Astro astro.build
        - Language suppor for Astro
      - ✔**Error Lens** L1
        - De Alexander
        - Improve highlighting of errors, warnings and other language diagnostics.
      - ✔**ESLint** L1
        - Microsoft
        - Integrates ESLint JavaScript into VS Code.
      - ✔**GitHub Copilot** L1
        - GitHub
        - Your AI pair programmer
      - ✔**GitLens — Git supercharged** L1
        - GitKraken
        - Supercharge Git within VS Code — Visualize code authorship at a glance via Git blame annotations and Co
        - *Ojo al instalar te permite escoger que instalar se presiona en la rueda dentada y se escoge openSettings*.
      - **Iconos** L1 43.39
        - file-icons (simpático)
        - vscode-icons
        - **Material Icons Theme** <---
          - Philipp Kief
          - Material Design Icons for Visual Studio Code     
      - **Import Cost** L1
        - Wix
        - Display import/require package size in the editor
      - ✔**Live Server**
        - Ritwick Dey
        - Launch a development local Server with live reload feature for static & dynamic pages
      - ✔**Live Share**
        - Microsoft
        - Real-time collaborative development from the comfort of your favorite tools
      - **Tema**
        - **One Dark Pro**
          - binaryify
          - Atom‘s iconic One Dark theme for Visual Studio Code
      - ✔**Tailwind CSS Intellisense** L1
        - Tailwind Labs
        - Intelligent Tailwind CSS tooling for VS Code
        - Para tema de autocomplete de tailwind ahorra mucho tiempo.
      - **rust-analyzer** (L1 28:01)
        - matkland
        - An alternative rust language server to the RLS
        - Detectar errores en código de rust, degugeado ext.
      - ✔**Thunder Client** L1
        - Rganga Vadheneni
        - Lightweight Rest API Client for VS Code
        - Es como tener un Insomnia o Postman.
      - **Runjs** (L1 1:07:02) (ojo es pagado)
        - https://runjs.app/
        - The JavaScript playground for your desktop
      - ✔**Version Lens** L1 25.00
        - pflannery
        - Shows the latest version for each package using code lens
        - En las dependencias del package.json me indica si tengo algo x actualizar.
      - **Para IA**
        - [Fazt Code: Cómo Tener tu Chat IA Gratis para programar con Cline (Paso a Paso)](https://www.youtube.com/watch?v=Gw441rJolzg)
          - **Cline** (Es el agente inteligente)
            - Cline cline.bot
            - Autonomous coding agent right in your IDE, capable of creating/editing files, running commands, using the browser, and more with your permission every step of the way.
          - **Google AI Studio**
            - [Google AI Studio](https://aistudio.google.com/prompts/new_chat)
              - Es para usar Gemini através del API
              - Ir a **Get API key**
              - Presionar **Create API key**
                - Presionar **Crear clave de API en un proyecto nuevo**
              - Seleccionar el ícono de **Cline** que se crea y presionar **Use your own API key**
                - API provider 
                  - Google Gemini
                - Pegar la API Key antes copiada
                - **Let´s go**
                - En la parte superior escoger **Open in Editor** para que se abra en la parte derecha


  - [Recomendados por Midudev](https://www.youtube.com/watch?v=RB5tR_nqUEw&t=2223s)
      - Astro Language support for astro
      - **Console ninja**
        - Wallaby.js
        - JavaScript console.log output and runtime errors right next to your code.
      - **Pretty TypeScript Errors**
        - yoavbls
        - Make TypeScript errors prettier and more human-readable in VSCode
      - **Live Preview** [Recomendados por Midudev: Para el curso de JS](https://www.jscamp.dev/introduccion/extension-terminal)
        - Microsoft
        - Hosts a local server in your workspace for you to preview your webpages on.
  
  - **Recomendado por Gentleman Programming**
    - Para crear componentes
      - ES7 + React/Redux/React-Native snippets
  
  - **Otros**
    - **:emojisense:**
      - Matt Bierner
      - Adds suggestions and autocomplete for emoji
    - **Auto Rename Tag**
      - Jun Han
      - Auto rename paired HTML/XML tag
    - **Autoprefixer**
      - mrmlnc
      - Parse CSS and add vendor prefixes automatically.
    - **Better Comments**
      - Aaron Bond
      - Improve your code commenting by annotating with alert, informational, TODOs, and more!
    - **Code Spell Checker**
      - Street Side Software
      - Spelling checker for source code
    - **CodeSnap**
      - adpyke
      - Take beautiful screenshots of your code
    - **Color Picker for VS Code**
      - anseki
      - Helper with GUI to generate color codes such as CSS color notations
    - **CSS Peek**
      - Pranay Prakash
      - Allow peeking to css ID and class strings as definitions from html files to respective CSS. Allo
    - **DotENV**
      - mikestead
      - Support for dotenv file syntax
    - **EditorConfig for VS Code**
      - EditorConfig editorconfig.org
      - EditorConfig Support for Visual Studio Code
    - **Emoji Snippets**
      - Devzstudio
      - Insert emoji to your Vscode files
    - ✔**Error Lens**
      - Alexander
      - Improve highlighting of errors, warnings and other language diagnostics
    - **ES7+ React/Redux/React-Native snippets**
      - dsznajder
      - Extensions for React, React-Native and Redux in JS/TS with ES7+ syntax. Customizable. Built-in i
    - ✔**ESLint**
      - Microsoft
      - Integrates ESLint JavaScript into VS Code.
    - ✔**GitHub Copilot**
      - GitHub
      - Your AI pair programmer
    - **GitHub Copilot Chat**
      - GitHub
      - AI chat features powered by Copilot
    - ✔**GitLens — Git supercharged**
      - GitKraken
      - Supercharge Git within VS Code — Visualize code authorship at a glance via Git blame annotations and CodeLens, seamlessly navigate and explore Git repositories, gain valuable insights via rich visualizations and powerful comparison commands, and so much more
    - **Iconos**
      - ✔**Material Icon Theme**
        - Philipp Kief
        - Material Design Icons for Visual Studio Code 
    - **Image preview**
      - Kiss Tamás
      - Shows image preview in the gutter and on hover
    - **indent-rainbow**
      - oderwat
      - Makes indentation easier to read
    - ✔**Live Server**
      - Ritwick Dey
      - Launch a development local Server with live reload feature for static & dynamic pages
    - ✔**Live Share**
      - Microsoft
      - Real-time collaborative development from the comfort of your 
    - **Markdown All in One**
      - Yu Zhang
      - All you need to write Markdown (keyboard shortcuts, table of contents, auto preview and more)
    - **Markdown Emoji**
      - Matt Bierner
      - Adds emoji syntax support to VS Code's built-in markdown preview and markdown cells in no
    - **npm Intellisense**
      - Christian Kohler
      - Visual Studio Code plugin that autocompletes npm modules in import statements
    - **Nunjucks Template**
      - eseom
      - Formatting, Syntax Highlighting, Hover, and Snippets for Nunjucks
    - **Path Intellisense**
      - Christian Kohler
      - Visual Studio Code plugin that autocompletes filenames
    - **Plantuml**
      - jebbs
      - Rich PlantUML support for Visual Studio Code.
      - Configuración:
        - Presionar Crtl+,
        - Ir en "User" 
        	- a Plantuml: Render
        		- Seleccionar: PlantUMLServer
        	- a Plantuml: Server 
        		- Colocar: http://www.plantuml.com/plantuml/
		
        - **Instalar Java** 
        	- Ir a "https://www.java.com/es/download/ie_manual.jsp"
        	- Carpeta destino: "c:\Program Files(x86)\Java\jre1.8.0_441"
        	- <code>java -version</code>
        	- [Configurar Java en Windows. Variables de entorno JAVA_HOME y PATH](https://www.aprenderaprogramar.com/index.php?option=com_content&view=article&id=389:configurar-java-en-windows-variables-de-entorno-javahome-y-path-cu00610b&catid=68&Itemid=188)
		        - JAVA_HOME 
		        	- Editar "Variables de entorno"
		        	- Variables del sistema 
		        		- Nombre de la variable: JAVA_HOME
		        		- Valor de la variable: C:\Program Files (x86)\Java\jre1.8.0_441
		        - PATH 
		        	- Editar 
		        	- Añadir al final "%JAVA_HOME%\bin"
		        	- <code>echo $PATH</code>
      	- **Probar**
          ```plantuml
            @startuml
              skinparam backgroundColor #EEEBDC
              skinparam handwritten true
              actor Customer
              Customer -> "login()" : username & password
              "login()" -> Customer : session token
              activate "login()"
              Customer -> "placeOrder()" : session token, order info
              "placeOrder()" -> Customer : ok
              Customer -> "logout()"
              "logout()" -> Customer : ok
              deactivate "login()"
            @enduml
          ```

          ```plantuml
            @startuml
              Bob -> Alice : hello
            @enduml
          ```
    - **Playwright Test for VSCode**
      - Microsoft
      - Run Playwright Test tests in Visual Studio Code.
    - **Prettier - Code formatter**
      - Prettier
      - Code formatter using prettier
    - **RapidAPI Client**
      - RapidAPI
      - RapidAPI Client is a full-featured HTTP client that lets you test and describes the APIs you build
    - **RapidAPI Services**
      - RapidAPI
      - The RapidAPI Services extension - a unified foundation for all our supplementary extensions. It o
    - **React Create Component**
      - Javier Gutierrez
      - Generate your components quickly, with multiple easily customizable templates. 🚀
    - **Rest Client**
      - Huachao Mao
      - REST Client for Visual Studio Code
      - *requiere el api.http*
    - **styled-jsx**
      - niceSprite
      - styled-jsx syntax highlight and code intellisense
    - ✔**Tailwind CSS IntelliSense**
      - Tailwind Labs
      - Intelligent Tailwind CSS tooling for VS Code
    - **Text Pastry**
      - jkjustjoshing
      - Extend the power of multiple selections in VS Code. Modify selections, insert numeric sequences, incremental numbers, generate uuids, date ranges, insert continuously from a word list and more.
    - ✔**Thunder Client**
      - Thunder Client
      - Lightweight Rest API Client for VS Code
    - **Todo Tree**
      - Gruntfuggly
      - Show TODO, FIXME, etc. comment tags in a tree view
    - ✔**Version Lens**
      - pflannery
      - Shows the latest version for each package using code lens
      - 
    - **Spanish - Code Spell Checker** [Recomendada en](https://github.com/reactjs/es.react.dev/blob/main/TRANSLATION.md#identificadores-de-los-t%C3%ADtulos)
      - Street Side Software
      - Spanish Add-On for Code Spell Checker
      - Uso
        - Agregar en **Settings**
          - <code>"cSpell.language": "en,es"</code>
  
  - **AUN no puestas**
    - **Auto Barrel**
      - Mike Hanson
      - Provides commands to create or update a TypeScript or JavaScript
    - **Console Ninja**
      - Wallaby.js
      - JavaScript console.log output and runtime errors right next to your code.
    
  - **NO ponerle**
    - **Biome**
      - biomejs
      - Biome LSP VS Code Extensionfavorite tools.

- **Para instalar**:
  - CodeSnap code --install-extension adpyke.codesnap
  - Better Comments code --install-extension aaron-bond.better-comments
  - Color Picker code --install-extension anseki.vscode-color
  - Astro code --install-extension astro-build.astro-vscode
  - :emojisense: code --install-extension bierner.emojisense
  - Markdown Emoji code --install-extension bierner.markdown-emoji
  - NO ponerle Biome code --install-extension biomejs.biome (NO ponerle)
  - styled-jsx code --install-extension blanu.vscode-styled-jsx
  - Tailwind CSS IntelliSense code --install-extension bradlc.vscode-tailwindcss
  - npm Intellisense code --install-extension christian-kohler.npm-intellisense
  - Path Intellisense code --install-extension christian-kohler.path-intellisense
  - PostCSS Language Support code --install-extension csstools.postcss
  - ESLint code --install-extension dbaeumer.vscode-eslint
  - Emoji Snippets code --install-extension devzstudio.emoji-snippets
  - ES7+ React/Redux/React-Native snippets code --install-extension dsznajder.es7-react-js-snippets
  - GitLens — Git supercharged code --install-extension eamodio.gitlens
  - Prettier - Code formatter code --install-extension esbenp.prettier-vscode
  - Auto Rename Tag code --install-extension formulahendry.auto-rename-tag
  - GitHub Copilot code --install-extension github.copilot
  - GitHub Copilot Chat code --install-extension github.copilot-chat
  - Todo Tree code --install-extension gruntfuggly.todo-tree
  - React Create Component code --install-extension javiergutierrez.create-component-react
  - Text Pastry code --install-extension jkjustjoshing.vscode-text-pastry
  - Image preview code --install-extension kisstkondoros.vscode-gutter-preview
  -     										code --install-extension mikehanson.auto-barrel
  - DotENV code --install-extension mikestead.dotenv
  - Autoprefixer code --install-extension mrmlnc.vscode-autoprefixer
  - Playwright Test for VSCode code --install-extension ms-playwright.playwright
  - Live Share code --install-extension ms-vsliveshare.vsliveshare
  - indent-rainbow code --install-extension oderwat.indent-rainbow
  - Version Lens code --install-extension pflannery.vscode-versionlens
  - Material Icon Theme code --install-extension pkief.material-icon-theme
  - CSS Peek code --install-extension pranaygp.vscode-css-peek
  - Thunder Client code --install-extension rangav.vscode-thunder-client
  - RapidAPI Client code --install-extension rapidapi.vscode-rapidapi-client
  - RapidAPI Services code --install-extension rapidapi.vscode-services
  - Live Server code --install-extension ritwickdey.liveserver
  - Code Spell Checker code --install-extension streetsidesoftware.code-spell-checker
  - Error Lens code --install-extension usernamehw.errorlens
  - Console Ninja code --install-extension wallabyjs.console-ninja
  - Markdown All in One code --install-extension yzhang.markdown-all-in-one
