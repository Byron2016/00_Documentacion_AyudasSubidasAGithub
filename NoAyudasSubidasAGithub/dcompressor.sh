
#!/bin/bash
rm data*
cp /home/bandit12/data.txt /tmp/byron/
xxd -r data.txt > data
nombre_archivo="data"

continuar=1

while true; do
  tipo_archivo=$(file $nombre_archivo | awk '{print $2}')

  echo "==============================================================="
  echo "pasada : "$continuar " para el tipo de archivo " $tipo_archivo
  echo "nombre archivo " $nombre_archivo
  echo "==============================================================="
  echo ""

  if [ $continuar -ge 9 ]; then
  read -p "Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 0
  fi
  fi

  #tipo_archivo=$(file $nombre_archivo | awk '{print $2}')
  if [ $continuar -ge 15 ]; then
    echo "entro a continuar" $continuar
    exit 1
  fi
  if [ "$(echo $?)" == "0" ]; then
    echo "entro al if exitoso"
    if [ $tipo_archivo == "gzip" ]; then
      echo "entro al tipo archivo gzip"
      tipo_archivo="gz"
      echo "el tipo de archivo es " $tipo_archivo
      nombre_archivo_zip=$nombre_archivo.$tipo_archivo
      echo "el nombre del archivo zip es " $nombre_archivo_zip

      comando_ejecutar=$(echo "mv" $nombre_archivo $nombre_archivo_zip)
      echo "comando a ejecutar: " $comando_ejecutar
      $(echo $comando_ejecutar)

      #comando_ejecutar=$(echo "gzip -c -d "$nombre_archivo_zip "> data_n")
      #comando_ejecutar=$(echo "gzip -l data.gz | grep 'uncompressed_name' -A 2 | tail -n 1 | aw$

      nombre_archivo=$(gzip -l $nombre_archivo_zip | grep 'uncompressed_name' -A 2 | tail -n 1 |$
      gzip -d $nombre_archivo_zip
      #echo "nombre nuevo archivo: " $nombre_archivo
      #echo "comando a ejecutar: " $comando_ejecutar
      #$(echo $comando_ejecutar)
      echo "ejecutado"
      let continuar++
      ls -al
      #exit 1
	  
    elif [ $tipo_archivo == "bzip2" ]; then
      echo "entro al tipo archivo bzip2"
      tipo_archivo="bz2"
      echo "el tipo de archivo es " $tipo_archivo
      nombre_archivo_zip=$nombre_archivo.$tipo_archivo
      echo "el nombre del archivo zip es " $nombre_archivo_zip


      comando_ejecutar=$(echo "mv" $nombre_archivo $nombre_archivo.$tipo_archivo)
      echo "comando a ejecutar: " $comando_ejecutar
      $(echo $comando_ejecutar)

      comando_ejecutar=$(echo "bzip2 -d -c "$nombre_archivo_zip "> data_n")
      #$(echo $comando_ejecutar)
      $(bzip2 -d -c $nombre_archivo_zip > data_n)
      $(rm $nombre_archivo_zip)
      nombre_archivo="data_n"
      echo "ejecutado"
      ls -al
      let continuar++
      #exit 0

    elif [ $tipo_archivo == "POSIX" ]; then
      echo "entro al tipo archivo tar"

      comando_ejecutar=$(echo "tar -tf "$nombre_archivo_zip "> data_n")
      #$(echo $comando_ejecutar)
      #$(bzip2 -d -c $nombre_archivo_zip > data_n)
      nombre_archivo_zip=$nombre_archivo
      echo "nombre del archivo zip: $nombre_archivo_zip"
      nombre_archivo_zip=$(tar -tf $nombre_archivo)
      echo "nombre del archivo zip: $nombre_archivo_zip"
#ls -al
      tar -xf $nombre_archivo
      rm $nombre_archivo
#ls -al
      nombre_archivo=$nombre_archivo_zip
      echo "ejecutado"
      let continuar++
      ls -al
    elif [ $tipo_archivo == "ASCII" ]; then
      echo "Entro a ASCII"
      #echo "nombre del archivo: $nombre_archivo"
      #nombre_archivo_zip=$(tar -tf $nombre_archivo)
      #echo "nombre del archivo zip: $nombre_archivo_zip"
      cat $nombre_archivo
      exit 0
    else
      echo "El tipo de archivo $tipo_archivo no está contemplado"
      exit 0
    fi


    #exit 0
  else
    exit 1
  fi

done

#mv data data.gz
ls -al




