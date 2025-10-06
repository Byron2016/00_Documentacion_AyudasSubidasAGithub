- **Warp**
  - **Configuración**
    - **Usar Git Bash como la Shell de warp**
      - You can add Git Bash as a shell option in Warp. Warp supports multiple shells including Git Bash on Windows. Here's how to set it up:
        -  **Method 1**: Through Warp Settings (Recommended)
            - Open Warp
            - Press **Ctrl + ,** (or go to Settings)
            - Navigate to **Features → Sessions**
            - Add git Bash as an option 
        -  **Method 2**: Find Git Bash Path and Add Manually
           -  Localizar la instalación de Git Bash
            - <code>Get-Command git</code>
           -  Encontar los ejecutables de Git Bash
            - <code>Test_Path "C:\Program Files\Git\bin\bash.exe"</code>
          - **Adding Git Bash to Warp**
           -  Open Warp Settings:
              -  Press **Ctrl + ,** or click the settings icon
              -  Go to **Features → Sessions** (or look for Shell settings)
           -  Add Custom Shell:
              -  Look for an option to add a custom shell or shell profiles
              -  Add a new shell with these details:
                 -  Name: Git Bash 
                 -  Path: C:\Program Files\Git\bin\bash.exe
                 -  Arguments: --login -i (optional, for interactive login shell)
           -  Alternative paths to try if the above doesn't work:
              -  C:\Program Files\Git\git-bash.exe
              -  C:\Program Files\Git\usr\bin\bash.exe
        -  **Method 3**: Using Warp's Shell Switcher
           -  Press **Ctrl + Shift + P** (Command Palette)
           -  Type "shell" or "switch shell"
           -  Look for options to add or switch to Git Bash
        -  **Method 4**: Launch Git Bash Directly in Warp
           -  If Warp doesn't have built-in Git Bash support, you can launch it directly:
            - <code>&"C:\Program Files\Git\bin\bash.exe" --version</code>

    - **Agregar alias a warp**
      - **PowerShell**
        -  **Method 1**: Using PowerShell Profile (Recommended)
            - Check if you have a PowerShell profile:
              - <code>Test-Path $PROFILE</code>
            - Create the profile if it doesn't exist:
              - <code>New-Item -ItemType File -Path $PROFILE -Force</code>
            - Open the profile in your preferred editor:
              - <code>notepad $PROFILE</code>
            - Add your aliases to the profile file::
					    ```bash
                # Example aliases
                Set-Alias ll Get-ChildItem
                Set-Alias grep Select-String
                Set-Alias which Get-Command

                # Function-based aliases for more complex commands
                function la { Get-ChildItem -Force }
                function .. { Set-Location .. }
					    ```
            - Reload your profile or restart Warp:
              - <code>. $PROFILE</code>
        -  **Method 2**: Temporary Aliases (Session Only): You can create aliases that only last for the current session:
              - <code>Set-Alias myalias "command-to-run"</code>
        -  **Method 3**: Using Warp's Built-in Features
           -  Warp also has built-in alias management:
            - Use **Ctrl+Shift+P** to open the command palette
            - Type "alias" to see alias-related commands
            - You can create and manage aliases through Warp's interface

        - **Common Useful Aliases for Windows/PowerShell:**
            - Add your aliases to the profile file:
					```bash
            # Navigation
            Set-Alias .. cd..
            function ... { Set-Location ..\.. }

            # List files
            Set-Alias ll Get-ChildItem
            function la { Get-ChildItem -Force }
            function l { Get-ChildItem -Name }

            # Git shortcuts
            Set-Alias g git
            function gs { git status }
            function ga { git add }
            function gc { git commit }

            # Clear screen
            Set-Alias cls Clear-Host
					```
      - **Git hub**
        -  **Method 1**: Using .bashrc or .bash_profile
           - Navigate to your home directory and create/edit the bash configuration file:
					  ```bash
              # Check if .bashrc exists
              ls -la ~/.bashrc

              # If it doesn't exist, create it
              touch ~/.bashrc
					  ```
           - Edit the .bashrc file:
					  ```bash
              # Use your preferred editor (notepad, vim, nano, etc.)
              notepad ~/.bashrc
              # or
              vim ~/.bashrc
              # or
              nano ~/.bashrc
					  ```
           - Add your aliases to the file:
					  ```bash
               # Navigation aliases
               alias ..='cd ..'
               alias ...='cd ../..'
               alias ll='ls -la'
               alias la='ls -la'
               alias l='ls -CF'

               # Git aliases
               alias g='git'
               alias gs='git status'
               alias ga='git add'
               alias gc='git commit'
               alias gp='git push'
               alias gl='git pull'
               alias gd='git diff'
               alias gb='git branch'
               alias gco='git checkout'

               # Other useful aliases
               alias grep='grep --color=auto'
               alias h='history'
               alias c='clear'
					  ```
           - Add your aliases to the file:
					  ```bash
              # Este comando carga los alias.
               source ~/.bashrc
					  ```
        -  **Method 2**: Using .bash_aliases (Alternative)
           - You can also create a separate .bash_aliases file and source it from .bashrc:
           - Create the aliases file:
					  ```bash
              touch ~/.bash_aliases
					  ```
           - Add your aliases to this file
           - Make sure your .bashrc sources the aliases file by adding this line:
					  ```bash
              if [ -f ~/.bash_aliases ]; then
                  . ~/.bash_aliases
              fi
					  ```
        -  **Method 3**: Git Bash Specific Configuration
           - Since you're on Windows with Git Bash, you might also want to check:
           - our Git Bash profile location (usually one of these):
					  ```bash
              ~/.bashrc
              ~/.bash_profile
              ~/.profile
					  ```
           - Check which files exist:
					  ```bash
              ls -la ~/ | grep -E '\.(bashrc|bash_profile|profile)$'
					  ```
           - Common Git Bash Aliases for Development:
					  ```bash
              # Navigation
              alias ..='cd ..'
              alias ...='cd ../..'
              alias ....='cd ../../..'
              alias ~='cd ~'

              # List files
              alias ll='ls -alF'
              alias la='ls -A'
              alias l='ls -CF'
              alias ls='ls --color=auto'

              # Git shortcuts
              alias g='git'
              alias gs='git status'
              alias ga='git add'
              alias gaa='git add --all'
              alias gc='git commit'
              alias gcm='git commit -m'
              alias gp='git push'
              alias gl='git pull'
              alias gd='git diff'
              alias gb='git branch'
              alias gco='git checkout'
              alias gcb='git checkout -b'
              alias glog='git log --oneline --decorate --graph'

              # Directory operations
              alias md='mkdir -p'
              alias rd='rmdir'

              # Utilities
              alias h='history'
              alias c='clear'
              alias grep='grep --color=auto'
              alias fgrep='fgrep --color=auto'
              alias egrep='egrep --color=auto'
					  ```

