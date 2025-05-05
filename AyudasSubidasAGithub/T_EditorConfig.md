# .editorconfig

Crear un archivo **.editorconfig**

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

- Nota: LF: Line Feed / CRLF: Carriage Return Line Feed

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
