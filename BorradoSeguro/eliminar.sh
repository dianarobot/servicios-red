#!/bin/bash
###########
#Programa: eliminar.sh
#Autor: diana
#Fecha: 22/agosto/2018
#Descripción: Recibe la ruta del archivo y la recupera
encontrado=false
logp=/home/diana/Documentos/BorradoSeguro/.logpapelera
papelera=/home/diana/Documentos/BorradoSeguro/Papelera
if test "$1" = "eliminar"
then
	if test -f "$2"
	then
		cp -r $2 $papelera
		echo "$2" >> "$logp"
		rm $2
		echo "Se ha eliminado el archivo"
	else
		echo "No existe el archivo"
	fi
else
	if test "$1" = "recuperar"
	then
		numerol=$(grep -n $2 $logp | grep -Eo '^[^:]+')
		echo $numerol
		if test ! -z "$numerol"
		then
			linea=$(head -$numerol $logp | tail -n 1)
			#echo $linea
			rutaOrigen=${linea%\/"$2"*}
			#echo $rutaOrigen 
			cp -r "$papelera/$2" $rutaOrigen
			num=$numerol"d"
			#echo $num
			sed -i $num $logp
			rm "$papelera/$2"
			echo "Archivo recuperado"
		else
			echo "No existe el archivo que desea recuperar"
		fi
	else
		echo "No se reconoce la orden"
	fi
fi
