  - **Así quedaría el archivo .bash_profile**
    - 

    ```bash
# =========================================================
# 1. PATH Y CONFIGURACIONES DEL SISTEMA
# =========================================================
PATH="${PATH}:/c/batch:/c/Program Files/Python310/Scripts/:/c/Program Files/Python310/:/c/Program Files/Amazon Corretto/jdk11.0.16_9/bin"
# opencode
export PATH="/c/Users/Byron/.opencode/bin:$PATH"

# PARA obliga a la consola subyacente de Windows a entrar en modo UTF-8 puro.
chcp.com 65001 > /dev/null 2>&1


# =========================================================
# 2. CONFIGURACIÓN DE FNM (Node.js)
# =========================================================
eval "$(fnm env --use-on-cd)"


# =========================================================
# 3. ALIAS PERSONALIZADOS Y COMENTARIOS ORIGINALES
# =========================================================
alias lr="ls -la" # this changes the default ll on git bash to see hidden files.
alias lrl="ls -la"

# Some good standards, which are not used if the user
# creates his/her own .bashrc/.bash_profile

# --show-control-chars: help showing Korean or accented characters
alias ls='ls -F --color=auto --show-control-chars'
alias ll='ls -l'

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'
alias gapt='git apply --3way'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^([+*]|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs git branch -d 2>/dev/null'
alias gbD='git branch -D'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'

alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout $(git_develop_branch)'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'
alias gcss='git commit -S -s'
alias gcssm='git commit -S -s -m'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfo='git fetch origin'

alias gfg='git ls-files | grep'

alias gg='git gui citool'
alias gga='git gui citool --amend'

alias ggpur='ggu'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias ghh='git help'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'

alias gk='\gitk --all --branches &!'
alias gke='\gitk --all $(git log -g --pretty=%h) &!'

alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"

alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias gma='git merge --abort'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpr='git pull --rebase'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbom='git rebase origin/$(git_main_branch)'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grst='git restore --staged'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'

alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='gsta --include-untracked'
alias gstall='git stash --all'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'
alias gswm='git switch $(git_main_branch)'
alias gswd='git switch $(git_develop_branch)'

alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias glum='git pull upstream $(git_main_branch)'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

alias gam='git am'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gama='git am --abort'
alias gamscp='git am --show-current-patch'

# PARA PNPM INICIO (O J O : DEBEN LLEVAR COMILLA SIMPLE)
alias pn='pnpm'
alias pni='pnpm i'
alias pnsp='pnpm store prune'
alias pnspt='pnpm store path'
alias pnw='which pnpm'
# PARA PNPM FIN

# PROPIOS BYRON INICIO
alias ass='_ass(){ alias | grep --color "alias.$1";  unset -f _ass; }; _ass'
alias as='alias | grep --color $1'
alias hs='history | grep --color $1'
alias cl='clear'
alias cafe='cat /dev/urandom | hexdump | grep \"ca fe\"'
alias mostused='history | awk '\''{print $2} '\'' | sort | uniq -c | sort -nr | head -n 10'
alias glogn='gloga -n10'
alias gsti='git status --ignored'
alias gslogs='git status && git log --oneline --graph --decorate --all --since=1day'
alias gslog='git status && git log --oneline --graph --decorate --all'

# FIND INICIO
alias ffd='ls ~/ | grep --color=always $1'
# Buscar archivo que nombre contenga "xxxx" en todos los directorios excepto node_modules Ej: ffnexn "app.*"
alias ffnexn='_ffnexn(){ find . -type d -name node_modules -prune -o -type f -name $1 -print; unset -f _ffnexn; }; _ffnexn'

# Buscar archivo que nombre contenga "xxxx" en todos los directorios excepto directorio "yyyy" Ej: ffnexx "app.*" "node_modules"
alias ffnexx='_ffnexx(){ find . -type d -name $2 -prune -o -type f -name $1 -print; unset -f _ffnexx; }; _ffnexx'

# Buscar archivo que contenga "xxxx" en todos los directorios excepto node_modules Ej: ffcexn "construc"
alias ffcexn='_ffcexn(){ find . -type d -name node_modules -prune -o -type f -print | xargs grep -ni --color=always $1; unset -f _ffcexn; }; _ffcexn'

# Buscar arquivo que contenta "xxxx" y termine en "yyyy" en todos los directorios excepto node_modules Ej: ffctc "construc" "*.js"
alias ffctc='_ffctc(){ find . -type d -name node_modules -prune -o -type f -name $2 -print | xargs grep -ni --color=always $1; unset -f _ffctc; }; _ffctc'
# FIND FIN

alias path='echo $PATH'
alias paths='_paths(){ pathtr | grep -n --color=always $1;  unset -f _paths; }; _paths'
alias pathtr='echo $PATH | tr : "\n" '

# VAGRANT BYRON INICIO
alias vgb='vagrant box list'
alias vgbr='vagrant box remove $1'
alias vggs='vagrant global-status'
alias vggsd='vagrant destroy $1'
alias vggsdf='vagrant destroy --force $1'
alias vggsp='vagrant global-status --prune'
alias vgh='vagrant halt'
alias vgp='vagrant provision'
alias vgrp='vagrant reload --provision'
alias vgssh='vagrant ssh'
alias vgsshc='vagrant ssh-config'
alias vgsshd='vagrant ssh --debug'
alias vgst='vagrant status'
alias vgsu='vagrant suspend'
alias vgsur='vagrant resume'
alias vgu='vagrant up'
alias vgud='vagrant up --debug'

# VAGRANT BYRON FIN

# Usar trash-cli
alias tl="trash list"
alias tp="trash put"
alias te="trash empty"
# Agregar el path de pnpm para que funcione trash-cli 
export PATH="$HOME/AppData/Local/pnpm/bin:$PATH"

# Usar lazyGit
alias lazygit='winpty lazygit'

# Usar eza reemplazo de ls
alias lle='eza --long --header --icons --all'
alias lld='lsd -la --header'

# PROPIOS BYRON FIN

# =========================================================
# 4. HISTORIAL Y PROMPT DINÁMICO (FNM / GIT)
# =========================================================

# PROPIOS BYRON Agregar historial no sobreescribir al tener varias gitbash abiertas INICIO
# Anexar al archivo de historial en lugar de sobrescribirlo al cerrar
shopt -s histappend

# Ampliar el tamaño del historial para no perder comandos antiguos
HISTSIZE=10000
HISTFILESIZE=20000
# PROPIOS BYRON Agregar historial no sobreescribir al tener varias gitbash abiertas FIN

# PROPIOS BYRON obtener la versión actual de Node con fnm INICIO
get_node_version() {
    if command -v fnm &> /dev/null; then
        local node_v
        node_v=$(fnm current 2>/dev/null)
        if [ -n "$node_v" ] && [ "$node_v" != "none" ]; then
            echo "Nv: $node_v "
        fi
    fi
}

# Función que genera todo el prompt de forma limpia
procedimiento_prompt() {
    local green="\[\033[32m\]"
    local purple="\[\033[35m\]"
    local yellow="\[\033[33m\]"
    local cyan="\[\033[36m\]"
    local reset="\[\033[0m\]"
    
    #agregar las secuencias de escape \u (usuario), \h (host)
    local user_host="${green}\u@\h${reset}"
    #agregar la variable $MSYSTEM (que contiene UCRT64, MINGW64, etc.)
    local msys_part="${purple}${MSYSTEM}${reset}"
    local path_part="${yellow}\w${reset}"
    local node_part="${cyan}$(get_node_version)${reset}"
    local git_part=""
    
    if command -v __git_ps1 &> /dev/null; then
        git_part="${cyan}$(__git_ps1 "(%s)")${reset}"
    fi
    
    # Define el prompt en dos líneas con el formato clásico de Git Bash + Node
    PS1="${user_host} ${msys_part} ${path_path} ${node_part}${git_part}\n$ "
}

# Combinar history -a/-n y el procedimiento del prompt en PROMPT_COMMAND sin errores
PROMPT_COMMAND="history -a; history -n; procedimiento_prompt"
# PROPIOS BYRON obtener la versión actual de Node con fnm FIN

# ojo ojo ojo INICIO
# export ANTHROPIC_API_KEY="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
# ojo ojo ojo FIN
    ```