- **Visual Studio code**
	- **Settings**:
		- Globales
			- Se encuentran en: C:\Users\bgva\AppData\Roaming\Code\User\settings.json
				- Windows: %APPDATA%\Code\User\settings.json
				- macOS: $HOME/Library/Application\ Support/Code/User/settings.json
				- Linux: $HOME/.config/Code/User/settings.json
				- Reset all settings
		- Workspace settings.json location
			- The workspace settings file is located under the .vscode folder in your root folder			
				
		- Crtl + , (https://code.visualstudio.com/docs/getstarted/settings)
		
	- [AYUDA](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf) 
	
	- [TRUCO VS #3: Selección de bloques y edición multi-cursor](https://www.campusmvp.es/recursos/post/truco-vs-3-seleccion-de-bloques-y-edicion-multi-cursor.aspx)
		
		- Seleccionar una linea con cursor.
			- ALT+Mayúsculas y mover el cursor
			
		- Seleccionar TODOS los elementos de algún tipo
			- Seleccionar lo que se quiere buscar
			- Crtl + Shift + l 
			
			
		- Multicursor.
			- Alt - Shift
			
	- [How To Compare Contents Of Two Files In Visual Studio Code?](https://www.mytecbits.com/microsoft/dot-net/compare-contents-of-two-files-in-vs-code)
		- 
		
	- **Ordenar JSON al guardar**
		- Crtl + ,
		- JSON: Sort On Save: Enable. 
	
- **Visual Studio Code**
	- Ancho de las líneas 
		- alt + z 
	- [Diez Atajos para VSC](https://www.danielprimo.io/blog/diez-atajos-de-teclado-para-visual-studio-code)
		- 
		
	- Mostrar todos los atajos de teclado
		- [CTRL] + K (Visual Studio Code queda a la espera). 
			- [CTRL] + S
	
    - Mover texto izquierda
	
		- 4 de septiembre de 1869
		
	- Seleccionar línea actual
		- Líena actual
			- Crtl l
		- Palabra actual 
			- Crtl L
			
	- Duplicar lína.
		- Shift + Alt + Up Arrow Key
		- Shift + Alt + Down Arrow Key
		
	- [Ya no funciona - How do I select multiple text in Visual Studio?](https://www.folkstalk.com/2022/09/how-to-select-multiple-lines-in-vsc-with-code-examples.html#:~:text=what%20you%20want.-,How%20do%20I%20select%20multiple%20text%20in%20Visual%20Studio%3F,file(vs%2Dcode).)
		- 

	- Formatear código
		- Alt Shift F
		
	- Auto import y reordering de los imports
		- Creamos una app en React ! buenas prácticas, clean architecture, redux, context y Typescript ! 38.12
			- https://www.youtube.com/watch?v=p9PAmqpCWgA&t=2765s
			- Shift + Alt + o
			
	- Resetear server de TS
		- Crtl + Shift + p 
		- TypeScript Restart TS server 
		
- **Visual Studio Code**
	- Extensiones
		- Color
			- Color Picker (anseki)
		- Tailwind
			- Tailwind CSS IntelliSense (Tailwind Labs)
		- Pintar Corchetes parentesis
			- MiduDev: https://www.youtube.com/shorts/735nbBl4GFI
				- NO ES NECESARIO NINGUNA EXTENSIÓN.
				- Abrir preferencias del usuario
					- Crtl + ,
				- Buscar "Bracket pair"
				- Activar 
					- a "enable" "Editor>Bracket Pair Colorization: Enabled"
					- a "true" "Editor>Guides:Bracket Pair"
					
		- Errores
			- MiduDev: https://www.youtube.com/shorts/51q0PYdYOJc
				- Error Lens (Alexander)
		- Productividad
			- HolaMundo: 7 extensiones para aumentar la productividad y velocidad en VSCode
				- https://www.youtube.com/watch?v=u3A-tKLIH1I
				
					- Html
						- Auto Rename Tag (Jun Han)
							- MiduDev: YA NO ES NECESARIO, TAN SOLO HACER ESTOS PASOS.
								- Crtl + ,
								- Buscar "linked Editing"
						
					- Server
						- LiveServer (Ritwick Dey)
					- Logica programación
						- Code Runner (Jun Han)
					- Identación
						- Indent Rainbow (oderwat)
					- Importaciones
						- Path Intellisense (Christian Kohler)
					- Code spell
						- Code Spell Checker (Street Side software)
						
		- Compartir pantalla
			- Live Share (Microsoft)
			- Live Share Audio (Microsoft)
		- Capturar pantalla		
			- CodeSnap (adpyke)
				- Crtl + Shift + p
				- presionar ícono o Crtl + C
		- Comentarios
			- Better Comments (Aaron Bond)
				- Poner signos al princio:
					- ! Alerts
					- ? Queries
					- TODO: TODOs
					- * Highlights
					- Commented out code can also be styled to make it clear the code shouldn't be there
					- Any other comment styles you'd like can be specified in the settings
					
		- GIT
			- GitLens (GitKraken)
		- CSS
			- CSS Peek (Pranay Prakash)
			
		- Tags
			- Auto Close tags (Jun Han)
			
		- Variables entorno
			- Evitar se vean al hacer tutorial
				- Carlos Azaustre 3.22: https://www.youtube.com/watch?v=IIZJAVMV1Sc
			- Resaltar sintaxis
				- DotEnv (mikestead)
				
		- React
			- Colocar código automáticamente
				- ES7 + React/Redux/React-Native snippets (dsznajder)
					- rfc
					- rfce
					- 
		- Linters
			- EsLint (Microsoft)
			- Prettier 
			
		- Markdown
			- Markdown All in One (Yu Zhang)
			
		- Iconos
			- Material Icon Theme (Phillipp Kief)
			
		- npm
			- npm Intellisense (Christian Kohler)
			
		- MiduDev
			- ¡Necesitas cambiar estas configuraciones de Visual Studio Code!
				- https://www.youtube.com/watch?v=uyEUVgNMvGI
				
				- Ver SIEMPRE el método en el que estoy
					- Abrir preferencias del usuario
						- Crtl + ,
					- Buscar "sticky scroll"
					- Activar 
						- a "enable" "Editor>sticky scroll: Enabled"
						
				- Animación cursor
					- Abrir preferencias del usuario
						- Crtl + ,
					- Buscar "cursor animation"
					- Activar 
						- a "enable" "Editor>Cursor Smoth Caret Animation: Enabled"	
						
				- Animación locación en que me encuentro
					- Abrir preferencias del usuario
						- Crtl + ,
					- Buscar "cursor blinking"
					- Seleccionar 
						- "Editor>Cursor Blinking: expand"
						
			- 3 EXTENSIONES de VSCODE para mejorar tu PRODUCTIVIDAD
				- https://www.youtube.com/watch?v=IDmHMDKKMWQ
				
				- API
					- Thunder Client (Ranga Vadhineni)
					- RapidAPI Client (RapidAPI)
					
				- Inline Folds 
					- te oculta las clases con ... no le veo mucha utilidad para mis necesidades
					
				- Image preview(publisher:"Kiss Tamás")
				
			- Styled jsx: https://www.youtube.com/watch?v=UlYGGCNFcWo&list=PLV8x_i1fqBw1VR86y4C72xMGJ8ifjBwJ6&index=2
				- styled-jsx (niceSprite)

- **Visual Studio Code**
	- Evitar "../../../../theme" 
		- Esto ya con Nextjs ver 13.
		- (1.11.45) https://www.youtube.com/watch?v=EEDRcolSHms&list=PLV8x_i1fqBw1VR86y4C72xMGJ8ifjBwJ6&index=3
			- Crear EN LA RAÍZ archivo
				- jsconfig.json
					- paths para crear alias
						- "paths": {"@/*": ["./src/*"] }
							- De "./src/componets"
							- A "@/componets"
					- baseUrl para poner dir base.
					
					
					```json
					{
					"compilerOptions": {
						"baseUrl":"."
						"paths": {
						"@/*": ["./src/*"]
						}
					}
					}
					```
					
		- (1.19.16) NO usar .jsx
			
- **Visual Studio Code**
	- Snippeds