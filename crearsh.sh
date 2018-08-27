#!/bin/bash
###########
#Programa: eliminar.sh
#Autor: diana
#Fecha: 22/agosto/2018
#Descripción: Recibe la ruta del archivo y la recupera
if test ! -z "$1"
	then
	ruta=$(pwd)
	if test -f "$1"
		then
		echo "Se abrirá el archivo"
		echo $1
		nano $ruta"/"$1
		$ruta"/"$1
	else
		autor=$(whoami)
		cat > $ruta"/"$1 exit
		echo "#!/bin/bash" >> $ruta"/"$1
		echo "##########" >> $ruta"/"$1
		echo "#Programa: $1" >> $ruta"/"$1
		echo "#Autor:"$autor >> $ruta"/"$1
		date +"#Fecha: "%d"/"%B"/"%G >> $ruta"/"$1
		if test ! -z "$2"
			then
			echo "#Descripción: $2" >> $ruta"/"$1
		fi
		chmod 766 $ruta"/"$1
		nano $ruta"/"$1
		$ruta"/"$1
	fi
else
	echo "Debe escribir el nombre del archivo"
fi