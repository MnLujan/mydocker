#!/bin/bash

#------------------FUNCTIONS----------------------------------------------------------#
function containers(){
    echo ""
    echo "Se selecciono borrado de contenedores"
    read -p "Ingresar [Y/n] para confirmar la operacion " -n 2 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "----Cancelando operacion-----"
        exit;
    fi

    docker rm $(docker ps -a | awk 'NR>1 { print $1. " " }' | tr -d '\n')
    exit;

}

function images(){
    echo ""
    echo "Borrado de Imagenes <none>"
    echo ""
    read -p "Ingresar [Y/n] para confirmar la operacion " -n 2 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        echo "----Cancelando operacion-----"
        exit;
    fi

    docker rmi $(docker images | grep none | awk '{ print $3 }' | awk ' NR=1 { print $1, $2 }' | tr -d '\n')

}

function volumes(){

    echo "implementar jeje"
    exit;
}

#----------------------------------------------------------------------------------#


if [ "$EUID" -ne 0 ]
then
    echo "###########################################"
    echo "           Please run as root"
    echo "###########################################"
    exit
fi

echo "--------------------------------------"
echo "        LIBERACION DE ESPACIO"
echo "--------------------------------------"

echo "Ingrese la opcion que desea ejecutar: "
echo
echo "__________________________________________________________________"
echo "1. Borrar todos los container (Que no se encuentren en ejecucion)"
echo "2. Borrar todas las imagenes con la etiqueta <none>"
echo "3. Borrar volumenes, que no esten en uso"
echo "__________________________________________________________________"

read -p "Numero de operacion: " -n 1 -r
echo

case ${REPLY} in
    
    1 )
        containers
        ;;
    2 )
        images
        ;;
    3 )
        volumes
        ;;
    * )
        echo "No se ingreso opcion valida"
        ;;
esac

exit;





