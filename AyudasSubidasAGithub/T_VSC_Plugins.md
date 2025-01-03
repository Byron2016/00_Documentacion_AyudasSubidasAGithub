- Command line extension management

  - Git Blame SIN EXTENSIONES
    - Ir a Configuración de Usuario
      - <code>crtl + ,</code>
    - Buscar blame
    - <code>Git/Blame/Editor Decoration:Enabled (Controla si se va a mostrar información de autoría en el editor)</code>
  - https://code.visualstudio.com/docs/editor/extension-marketplace#:~:text=Depending%20on%20your%20platform%2C%20the,%25USERPROFILE%25%5C.vscode%5Cextensions

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

- Plugins utilizados en Visual Studio Code

  - Settings:
    - Se encuentran en: VER: T_VSC_001
    - Crtl + , (https://code.visualstudio.com/docs/getstarted/settings)
  - CONFIGURO desde CERO el sistema UBUNTU para DESARROLLO WEB + RUST

    - 24:15 https://www.youtube.com/watch?v=x7jsxdRxEiw&t=3237s

    - Error Lens
      - De Alexander
      - Improve highlighting of errors, warnings and other language diagnostics.
    - Version Lens
      - pflannery
      - Shows the latest version for each package using code lens
      - En las dependencias del package.json me indica si tengo algo x actualizar.
    - ESLint
      - Microsoft
      - Integrates ESLint JavaScript into VS Code.
    - GitHub Copilot
      - GitHub
      - Your AI pair programmer
    - Thunder Client
      - Rganga Vadheneni
      - Lightweight Rest API Client for VS Code
      - Es como tener un Insomnia o Postman.
    - Tailwind CSS Intellisense
      - Tailwind Labs
      - Intelligent Tailwind CSS tooling for VS Code
      - Para tema de autocomplete de tailwind ahorra mucho tiempo.
    - rust-analyzer (28:01)
      - matkland
      - An alternative rust language server to the RLS
      - Detectar errores en código de rust, degugeado ext.
    - Import Cost
      - Wix
      - Display import/require package size in the editor
    - GitLens — Git supercharged
      - GitKraken
      - Supercharge Git within VS Code — Visualize code authorship at a glance via Git blame annotations and Co
    - Live Share
      - Microsoft
      - Real-time collaborative development from the comfort of your favorite tools
    - Live Server
      - Ritwick Dey
      - Launch a development local Server with live reload feature for static & dynamic pages
    - Astro (Midulive 13.20: https://www.youtube.com/watch?v=RB5tR_nqUEw)
      - Astro astro.build
      - Language suppor for Astro
    - 32:05 Abrir settings.json
      - Crtl + Shif + P
      - Open Settings.json
      -
    - Tema
      - One Dark Pro
        - binaryify
        - Atom‘s iconic One Dark theme for Visual Studio Code
    - 17:10 Instalar Cascadia Code
      - https://github.com/microsoft/cascadia-code/releases
      - Bajar el zip
      - Click derecho sobre la fuente y seleccionar "Instalar para todos los usuarios"
      - En VSC Settings buscar Font Family y poner
        - 'Cascadia Code',
    - 32:40 Otras configuraciones
      - "workbench.startupEditor": "newUntitledFile",
      - Brackets
        - "editor.guides.bracketPairs": true,
        - "editor.bracketPairColorization.enabled": true
      - Detectar lenguaje
        - "workbench.editor.languageDetection": true,
      - Con el tema
        - "oneDarkPro.bold": true,
        - "oneDarkPro.italic": true,
        - "oneDarkPro.vivid": true,
      - "workbench.sideBar.location": "left",
      - "telemetry.telemetryLevel": "off",
      - "editor.codeActionsOnSave": {
        "source.fixAll.eslint": true
        }
    - 43:30 Configuración de Prettier NO hacerlo en el editor, hacerlo en un fichero aparte.

    - 43:50 Iconos
      - Material Icons Theme
        - Philipp Kief
        - Material Design Icons for Visual Studio Code
    - 1:07:02 Runjs
      - https://runjs.app/
      -

  - Recomendados por Midudev
    - https://www.youtube.com/watch?v=RB5tR_nqUEw&t=2223s
      - Astro Language support for astro
      - Console ninja
        - Wallaby.js
        - JavaScript console.log output and runtime errors right next to your code.
      - Pretty TypeScript Errors
        - yoavbls
        - Make TypeScript errors prettier and more human-readable in VSCode
  - Recomendado por Gentleman Programming
    - Para crear componentes
      - ES7 + React/Redux/React-Native snippets
  - Otras
    - Spanish - Code Spell Checker [Recomendada en](https://github.com/reactjs/es.react.dev/blob/main/TRANSLATION.md#identificadores-de-los-t%C3%ADtulos)
      - Street Side Software
      - Spanish Add-On for Code Spell Checker
      - Uso
        - Agregar en **Settings**
          - <code>"cSpell.language": "en,es"</code>
    - EditorConfig for VS Code
      - EditorConfig editorconfig.org
      - EditorConfig Support for Visual Studio Code
    - Auto Barrel:
      - Mike Hanson
      - Provides commands to create or update a TypeScript or JavaScript
    - Autoprefixer
      - mrmlnc
      - Parse CSS and add vendor prefixes automatically.
    - Better Comments
      - Aaron Bond
      - Improve your code commenting by annotating with alert, informational, TODOs, and more!
    - CodeSnap
      - adpyke
      - Take beautiful screenshots of your code
    - Color Picker for VS Code
      - anseki
      - Helper with GUI to generate color codes such as CSS color notations
    - Console Ninja
      - Wallaby.js
      - JavaScript console.log output and runtime errors right next to your code.
    - CSS Peek
      - Pranay Prakash
      - Allow peeking to css ID and class strings as definitions from html files to respective CSS. Allo
    - DotENV
      - mikestead
      - Support for dotenv file syntax
    - Emoji Snippets
      - Devzstudio
      - Insert emoji to your Vscode files
    - Error Lens
      - Alexander
      - Improve highlighting of errors, warnings and other language diagnostics
    - ES7+ React/Redux/React-Native snippets
      - dsznajder
      - Extensions for React, React-Native and Redux in JS/TS with ES7+ syntax. Customizable. Built-in i
    - ESLint
      - Microsoft
      - Integrates ESLint JavaScript into VS Code.
    - GitHub Copilot
      - GitHub
      - Your AI pair programmer
    - GitLens — Git supercharged
      - GitKraken
      - Supercharge Git within VS Code — Visualize code authorship at a glance via Git blame annotations and CodeLens, seamlessly navigate and explore Git repositories, gain valuable insights via rich visualizations and powerful comparison commands, and so much more
    - Image preview
      - Kiss Tamás
      - Shows image preview in the gutter and on hover
    - indent-rainbow
      - oderwat
      - Makes indentation easier to read
    - Live Server
      - Ritwick Dey
      - Launch a development local Server with live reload feature for static & dynamic pages
    - Markdown All in One
      - Yu Zhang
      - All you need to write Markdown (keyboard shortcuts, table of contents, auto preview and mor
    - Markdown Emoji
      - Matt Bierner
      - Adds emoji syntax support to VS Code's built-in markdown preview and markdown cells in no
    - Material Icon Theme
      - Philipp Kief
      - Material Design Icons for Visual Studio Code
    - npm Intellisense
      - Christian Kohler
      - Visual Studio Code plugin that autocompletes npm modules in import statements
    - Nunjucks Template
      - eseom
      - Formatting, Syntax Highlighting, Hover, and Snippets for Nunjucks
    - Path Intellisense
      - Christian Kohler
      - Visual Studio Code plugin that autocompletes filenames
    - Playwright Test for VSCode
      - Microsoft
      - Run Playwright Test tests in Visual Studio Code.
    - Prettier - Code formatter
      - Prettier
      - Code formatter using prettier
    - RapidAPI Client
      - RapidAPI
      - RapidAPI Client is a full-featured HTTP client that lets you test and describes the APIs you build
    - RapidAPI Services
      - RapidAPI
      - The RapidAPI Services extension - a unified foundation for all our supplementary extensions. It o
    - React Create Component
      - Javier Gutierrez
      - Generate your components quickly, with multiple easily customizable templates. 🚀
    - styled-jsx
      - niceSprite
      - styled-jsx syntax highlight and code intellisense
    - Tailwind CSS IntelliSense
      - Tailwind Labs
      - Intelligent Tailwind CSS tooling for VS Code
    - Text Pastry
      - jkjustjoshing
      - Extend the power of multiple selections in VS Code. Modify selections, insert numeric sequences, incremental numbers, generate uuids, date ranges, insert continuously from a word list and more.
    - Todo Tree
      - Gruntfuggly
      - Show TODO, FIXME, etc. comment tags in a tree view
    - Version Lens
      - pflannery
      - Shows the latest version for each package using code lens
    - :emojisense:
      - Matt Bierner
      - Adds suggestions and autocomplete for emoji
    - Auto Rename Tag
      - Jun Han
      - Auto rename paired HTML/XML tag
    - NO ponerle. Biome
      - biomejs
      - Biome LSP VS Code Extension
    - Code Spell Checker
      - Street Side Software
      - Spelling checker for source code
    - Live Share
      - Microsoft
      - Real-time collaborative development from the comfort of your favorite tools.
    - Thunder Client
      - Thunder Client
      - Lightweight Rest API Client for VS Code

- Para instalar:
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
