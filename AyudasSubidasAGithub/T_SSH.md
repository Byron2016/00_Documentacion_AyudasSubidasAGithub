- ssh

  - Generación

    - [joanmedia: Generar Clave SSH GIT WINDOWS | Como Configurar SSH Key en github | Que ES SSH](https://www.youtube.com/watch?v=g0ZV-neSM7E)

    - Tener instalado GIT en el computador
    - Verificar si se tiene alguna clave generada y el path
      - ls -al
      - Ver si existe el directorio ".ssh"
      - ls -a ~/.ssh
      - Si no se tiene generar la carpeta .ssh
        - <code>mkdir .ssh</code>
      - Generar clave privada y púbica
        - <code>ssh-keygen -t ed25519 -C "xxxx@yyyy.com"</code>
          - <code>"xxxx@yyyy.com"</code> Es el correo ligado a **GitHub**
          - Enter file in which to sabe the key(/c/users/xxx/.ssh/id_ed25519)
          - Enter passphrase (empty for no passphrase)
          - Enter same passphrase again
          - Se generan dos archivos id_ed25519 y id_ed25519.pub
        - Agregar clave al agente ssh (11.15) por medio de este paso nos facilita ingresar el passphrase que hicimos anteriormente.
          - <code>eval `ssh-agent -s`</code>
            - retorna un <code>Agent pid xxxx</code>
          - Agregar clave privada al ssh-agent
          - <code>ssh-add ~/.ssh/id_ed25519</code>
            - Solicita el passphrase que se puso antes
            - En caso de salir el siguiente mensaje de error **Could not open a connection to your authentication agent.**
              - Usar: <code>eval "$(ssh-agent -s)"</code>
          - Copiar clave pública a memoria
            - <code>clip < ~/.ssh/id_ed25519.pub</code>
            - Si no funciona abrir el .pub manualmente.
    - Agregar clave pública a Github
      - settings/SSH and GPG keys/SSH keys -->
        - Presionar el botón new SSH key
        - Poner nombre referente al dispositivo que se arega.
        - En key copiar la llave pública que se copió antes.
    - Para hacer PUSH deben haber sido configurados estos parámetros
      - <code>git config --global user.name "Xxxxx"</code>
      - <code>git config --global user.email "yyyy@yahoo.com"</code>

  - [joanmedia: Generar Clave SSH GIT WINDOWS | Como Configurar SSH Key en github | Que ES SSH](https://www.youtube.com/watch?v=g0ZV-neSM7E)

    - Qué es ssh

      - Conocidoo como Secure Socket Shell
      - Es un protocolo de red que permite una conexión remota segura de acceder a un servidor a través de un mecanismo de autenticación.
      - Usa llaves públicas, datos encriptados.

      - Técnicas de encriptación

        - Cifrado simétrico (1.53)

          - También llamado clave compartida (shared key)
          - Solo hay una clave (por lo general), una es facilmente calculada con la otra.
          - Lo que le hace que sea seguro es que la clave no se trasmite entre cliente y host, sino que usan algoritmos tanto cliente como servidor para calcular el algoritmo.

        - Cifrado Asimétrico

          - Usa github
          - Usa dos claves separadas para el cifrado y descifrado, conocidas como llave pública y privada.
          - La clave pública se distribuye a los interesados
          - A diferencia del cifrado cimétrico es sumamente complejo descifrar una clave privada por medio de la llave pública.
          - No se utiliza para cifrar toda la sesión ssh, es un poco distinta al cifrado simétrico. Solo se utiliza durante el algoritmo de cifrado de claves
          - Antes de iniciar una conexión segura, ambas partes generan claves públicas y privadas temporales y comparten sus respectivas claves privadas para producir la clave secreta compartida.
          - Una vez establecida una comunicación asimétrica segura, el servidor usa la clave pública de los clientes para generar y desafiar y trasmitir al cliente para su autenticación, si el cliente puede descifrar correctamente el mensaje significa que contiene la clave privada suficiente para la conexión. Y empieza la sesión ssh.

        - Hashing
          - Es una forma distinta de criptografía, esta no está destinada a ser descifrada.
          - El hashing genera un valor único de una longitud fija

  - [Carlos Azaustre: Cómo Configurar Claves SSH para Git y GitHub 2024](https://www.youtube.com/watch?v=akuG7eRtaXc)

    - Hace referencia a la _Guia escrita por github_ que se especifica más abajo.

  - Indicaciones de GitHub

    - [Guia escrita por github](https://docs.github.com/es/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    - [Adding a new SSH key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
    - [Working with SSH key passphrases](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/working-with-ssh-key-passphrases)

  - Clonando un repositorio de GitHub con SSH

    - Clave errada

      ```bash
        $ git clone git@github.com:Byron2016/052_es.react.dev.git
        Cloning into '052_es.react.dev'...
        Enter passphrase for key '/c/Users/xxxx/.ssh/id_ed25519':
        git@github.com: Permission denied (publickey).
        fatal: Could not read from remote repository.

        Please make sure you have the correct access rights
        and the repository exists.

      ```

      - Seguí los pasos para crear una nueva.
