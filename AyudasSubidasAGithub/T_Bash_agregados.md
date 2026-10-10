- **Cosas a ser agregadas en el .bashrc**
  - **Para los Alias**
    - Ver *D:\NuevosAPartir20241019\dev_20241019\Ap_Git_20230110*
  - **Para que salga la versión de nodejs**
    - Agregar al final del *.bashrc* el siguiente código
    ```bash
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
          local cyan="\[\033[36m\]"
          local green="\[\033[32m\]"
          local reset="\[\033[0m\]"
          
          local path_part="${cyan}\w${reset}"
          local node_part="$(get_node_version)"
          local git_part=""
          
          if command -v __git_ps1 &> /dev/null; then
              git_part="${green}$(__git_ps1 "(%s)")${reset}"
          fi
          
          # Define el prompt en dos líneas de forma explícita
          PS1="${path_part} ${node_part}${git_part}\n$ "
      }

      # Configura PROMPT_COMMAND para actualizar el prompt en cada salto de línea sin errores de sintaxis
      PROMPT_COMMAND=procedimiento_prompt

    # PROPIOS BYRON obtener la versión actual de Node con fnm FIN
    ```
