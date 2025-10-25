- **STREAMER.BOT**

  - [Escuela de Streaming | TOTA_AG: APRENDÉ a usar STREAMER.BOT | Tutorial 2025](https://www.youtube.com/watch?v=WQXfLh4Gj3s)

- **FFMPEG**
  - Es un programa que sirve para trabajar con sonido / video desde consola.
  - [Diario Linux: Demostracion de FFMPEG | Caso Practico Para Principiantes](https://www.youtube.com/watch?v=FRxPNhy13aQ)
  - **Instalación** 
    - Buscar en google **ffmpeg**
    - Bajar el instalador zip y descomprimirlo 
    - Copiar el descomprimido en el C
    - Agregar variable de entorno a **Path** <code>C:\ffmpeg\bin</code>
  - **Herramientas**
    - ffmplay para reproducir vídeo / audio
      - <code>ffmplay text.wav</code>
    - ffmprove para mostrar parámetros técnicos del vídeo / audio
      - <code>ffmpprove text.wav</code>
  - **Uso**
    - Cambiar el formato a archivo de sonido
      - <code>ffmpeg -i test.ogg test.wav</code>
    - Quitar un canal de ruido a archivo de sonido
      - **Deprecado**
        - <code>ffmpeg -i test_02.wav -map_channel 0.0.0 test_03.wav</code>
      - **Funcional 20250921**
        - **Para parlante izquierdo**
          - <code>ffmpeg -i test_02_e.wav -af "pan=mono|c0=c0" out.wav</code>
          - <code>ffmpeg -i test_02_e.wav -af "channelsplit=channel_layout=stereo:channels=FL" left_channel.wav out.wav</code>
        - **Para parlante derecho**
          - <code>ffmpeg -i test_02_e.wav -af "pan=mono|c0=c1" out.wav</code>
          - <code>ffmpeg -i test_02_e.wav -af "channelsplit=channel_layout=stereo:channels=FR" left_channel.wav out.wav</code>
    - Convertir aun audio mono a stereo
          - <code>ffmpeg -i out.wav -oc 2 outf.wav</code>
        
      
    - [Cortar y editar videos de forma automática con FFmpeg](https://apunteimpensado.com/cortar-editar-videos-forma-automatica-ffmpeg/) 
      - Crear un archivo "timecode.txt" con los puntos de corte de cada vídeo
        - miduClase_003_01_20251015.mp4, 00:00:00.0, 00:35:02.0, corte01.mp4
        - miduClase_003_02_20251015.mp4, 00:21:35.0, 00:57:18.0, corte03.mp4
      - Ejecutar usando gawk ffmpeg
        - <code>gawk -F, '{cmd="ffmpeg -ss " $2 " -to " $3 " -i " $1 " -c copy " $4 ""; system(cmd)}' timecode.txt</code>
        - Reemplazará: ffmpeg -ss INICIO -to FINAL -i ENTRADA -c copy SALIDA
      - Generar el listado de archivos a ser concatenados en archivo montaje.txt
        - <code>ls -1 c*.mp4 | sed 's/^/file /' > montaje.txt</code>
          - queda:
            - file corte01.mp4
            - file corte03.mp4
      - Ejecutar comando para concatenación
        - <code>ffmpeg -f concat -safe 0 -i montaje.txt -c copy terminado.mp4</code>
      - [Concatenating media files](https://trac.ffmpeg.org/wiki/Concatenate) 


