- **Practica LINUX desde ordenador**
	- https://achirou.com/practica-linux-gratis-en-tu-navegador/

- **Commands**
  - **Comandos Linux**
	- **FIND**
		- Buscar desde la raíz
			- <code>find . -name prueba</code> "buscará en directorio actual para abajo"
			- <code>find / -iname mumble</code> 
				- Sin sudo arroja errores, permisos denegado.
					- <code>find / -name mumble 2>/dev/null</code>
						- 0 stdin  = standard input
						- 1 stdout = standard output
						- 2 stderr = standard error 
						
			- iname 
				- Busca mayúsculas y minúsculas.
			
		- Buscar todo lo que empieze x rango letras
			- <code>find / -iname "[f-x]*.txt" 2>/dev/null</code>
			- <code>find / -iname "[0-9]*.txt" 2>/dev/null</code>
			
		- Buscar archivos usuario en concreto.
			- <code>sudo cat /etc/passwd 1 grep "sh"</code>
			- <code>sudo adduser maritrini</code>
			- <code>find /home -user shelldredd</code>
			
			- <code>find /home -user shelldredd -iname iron*</code>

			- <code>sudo find /home /etc / /var -user maritrini -iname iron*</code>
			
			- <code>find /home /etc / /var -user maritrini -iname iron* 2>/dev/null</code>
			
		- Buscar arquivo que contenta "xxxx" en todos los directorios
			- <code>find . -type f -name "*.txt" | xargs grep --color=always "controll"</code>

		- Buscar archivo que nombre contenga "xxxx" en todos los directorios excepto node_modules
			- <code>find . -type d -name node_modules -prune -o -type f -name "*controll*" -print </code>

		- Buscar archivo que contenga "xxxx" en todos los directorios excepto node_modules
			- <code>find . -type d -name node_modules -prune -o -type f -print | xargs grep --color=always "controll"</code>
    - **ps**
      - listar todos los procesos que se están ejecutando actualmente en el sistema
        - -e: Significa every (todos). Selecciona todos los procesos del sistema, no solo los del usuario actual.
        - -f: Significa full-format. Genera un listado detallado con columnas adicionales (como quién es el dueño del proceso y a qué hora empezó).
    - **type**
      - El comando type -a sleep sirve para identificar exactamente qué es y dónde se encuentra el comando sleep en tu sistema
        - -a: (de all) Le ordena que te muestre todas las ubicaciones y tipos que coincidan con ese nombre, no solo la primera que encuentre.
    - **trash-cli**
      - Instalación 
        - Alternativa 1
          - <code>npm install --global trash-cli</code>
        - Alternativa 2 con python
          - <code>python --version</code>
          - <code>pip --version</code>
          - <code>pip install trash-cli</code>
        - **Un detalle importante sobre Windows**
          - A diferencia de Linux, en **Windows trash-cli** a veces requiere una configuración adicional para encontrar la ruta exacta de la Papelera de Reciclaje del sistema. Si al ejecutarlo recibes un error de "Volume no encontrado", es porque la herramienta intenta usar el estándar de **Linux (.local/share/Trash)**. En Windows, la mayoría de los usuarios prefieren usar trash-put simplemente para mover archivos a una carpeta temporal o usar herramientas nativas de PowerShell desde Git Bash.
      
      - **Agregar a Alias**
        ```bash
          # Usar trash-cli
          alias tp='trash-put'
          alias tl='trash-list'
          alias te='trash-empty'
        ```
        - Recarga la configuración: 
          - <code>source ~/.bashrc</code> (C:\Users\Byron)
        - Comandos principales que puedes usar ahora:
          - <code>trash-put archivo.txt</code> : Envía el archivo a la papelera de reciclaje de Windows.
          - <code>trash-list</code> : Lista los archivos que están en la papelera.
          - <code>trash-restore</code> : Te permite elegir un archivo para restaurar.
          - <code>trash-empty</code> : Vacía la papelera por completo.

	
	
  - **Bash**

			
	- **Alias** 
		- Si es simple  
			- alias nombreAlias='comando a ejecutar'
		- Más complejo 
			- https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
			
			- Por medio de una función
				- alias wrap_args='f(){ echo before "$@" after;  unset -f f; }; f'
					- Ejemplo: wrap_args x y z
					- Resultado: before x y z after
					- Explicación 
						- Crea una función temporal f
						- A la cual se le pasa los argumentos
						- Notar que f es llamada al final.
						- unset -f 
							- Remueve la definición de función 
							
			- Por medio de su subShell 
				- alias wrap_args='sh -c '\''echo before "$@" after'\'' _'
					- Ejemplo: wrap_args x y z
					- Resultado: before x y z after
					- Explicación 
						- El alias construye la línea de comandos
							- sh -c 'echo before "$@" after' _
						- "_" es requerido, pero podría ser cualquier cosa. Lo que hace es asignar el $0 a sh, de esa forma el primer parámetro dado por la persona no es usado en el sh.
							- Demostración:
								- sh -c 'echo Consumed: "$0" Printing: "$@"' alcohol drunken babble
									- Consumed: alcohol Printing: drunken babble
						- La comilla simple dentro de comilla simple son requeridas. Ejemplo que no funciona con comillas dobles 
							- $ sh -c "echo Consumed: $0 Printing: $@" alcohol drunken babble
								-Consumed: -bash Printing:

						- Notar que f es llamada al final.
						- unset -f 
							- Remueve la definición de función 
							
	- **Spinner (sprite - animation - animacion)**
		- https://stackoverflow.com/questions/7131670/make-a-bash-alias-that-takes-a-parameter
			- Buscar
				- alias cp="~/SCR/spinner cp"
			- https://github.com/vaniacer/spinner
			
	- **Node Menu (node-menu)**
		- https://stackoverflow.com/questions/32458427/multiple-menus-with-node-js#answer-32460265
							
	- **Tree en git-bash**
		- 
			- tree.com //a //f   
				- Note: tree + tab "para que git-bash encuentre el tree.com"
				
	- **Comandos**
		- |&
			- it is shorthand for 2>&1 |
			- command1 |& command2 equal command1 2>&1 | command2
			- If |& is used, command_1’s standard error, in addition to it's standard output, is connected to command_2’s standard input through the pipe;
			- Ejemplo
				- echo "aaa" |& cat
		- Chaining Commands		
			- &&
				- Si el primer comando falla el segundo no se ejecuta
					- mkdir new_directory && cd new_directory
					
			- ||
				- The ‘||’ command in Bash is a logical OR operator.
				- It will execute the next command if the previous command fails. This is the opposite of ‘&&
					- false || echo 'The previous command failed'
					
			- ;
				- The ‘;’ command in Bash allows you to execute multiple commands in sequence, 
				-  regardless of whether the previous command was successful or not.
					- false ; echo 'This command will run regardless'
					
		- >
			- > a secas equivale a 1>. El número delante del > es el descriptor que se está redirigiendo.
				- El descriptor 1 es stdout (salida estándar)
				- El descriptor 2 es stderr (salida de error)
			- Ejemplos 
				- comando > fichero.txt
					- redirige la salida estándar a ese fichero, pero deja la salida de error aún visible por pantalla.
				- comando 2> errores.txt
					- redirigiria la salida de error a disco, pero dejaría visible en pantalla la salida estándar. También es posible:
						- comando > salida.txt 2> errores.txt
						
			- &>
				- junta ambos descriptores y los redirige a un mismo fichero:
					- comando &> salida_y_errores.txt
					
		- **Formas de abrir un archivo**
			- "<" (lectura), 
			- ">" escritura, 
			- ">>" append.
			
		- () vs { list;}
			- {} : function body executes in current shell; side-effects remain after function completes
				- Placing a list of commands between curly braces causes the list to be executed in the current shell context. No subshell is created. The semicolon (or newline) following list is required.
				
			- ( list ) :  function body executes in a subshell; side-effects disappear when subshell exits
				- Placing a list of commands between parentheses causes a subshell environment to be created, and each of the commands in list to be executed in that subshell. Since the list is executed in a subshell, variable assignments do not remain in effect after the subshell completes.
			
	- **Aritmetic** 
		- La aritmética en bash usa 
			- $((...)) 
		
		- Formas de incrementar variables 
			- var=$((var+1))
			- ((var=var+1))
			- ((var+=1))
			- ((var++))
			- let "var=var+1"
			- let "var+=1" 
			- let "var++"
			
			- Medir tiempos 
				#! /bin/bash
				# To run: bash tesa.sh  
				
				# Declare i as an integer for tests 12 and 13.
				echo > t12 'declare -i i; i=i+1'
				echo > t13 'declare -i i; i+=1'
				# Set i for test 14.
				echo > t14 'i=0; i=$(expr $i + 1)'
				
				# x=10
				x=100000
				T=$(date +%s)
				while ((x--)); do
					echo >> t0 'i=$((i+1))'
					echo >> t1 'i=$((i++))'
					echo >> t2 '((i=i+1))'
					echo >> t3 '((i+=1))'
					echo >> t4 '((i++))'
					echo >> t5 '((++i))'
					echo >> t6 'let "i=i+1"'
					echo >> t7 'let "i+=1"'
					echo >> t8 'let "i++"'
					echo >> t9 'let i=i+1'
					echo >> t10 'let i+=1'
					echo >> t11 'let i++'
					echo >> t12 'i=i+1'
					echo >> t13 'i+=1'
					echo >> t14 'i=$(expr $i + 1)'
					echo $x
				done
				T=$(($(date +%s)-$T))
				printf "\n\nTime taken: $(date -u -d @${T} +'%T')\n"
				
				while ((x--)); do
					echo "hola!"
				done
				
				echo $x
				
				for script in t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14; do
					line1="$(head -1 "$script")"
					printf "%-24s" "$line1"
					{ time bash "$script"; } |& grep user
					# Since stderr is being piped to grep above, this will confirm
					# there are no errors from running the command:
					eval "$line1"
					#rm "$script"
				done
				
	- **Console with colors**
		- https://blog.logrocket.com/using-console-colors-node-js/
		