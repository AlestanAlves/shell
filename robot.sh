#!/bin/bash  
#Robo script
#Autor: Alestan
#RM: 85046
#
#

echo "Oi, seja educado e me deseje um bom dia, boa tarde ou boa noite."
echo "Digite [1] para bom dia"
echo "Digite [2] para boa tarde"
echo "Digite [3] para boa noite"

func_desejo(){
    echo "Deseja atualizar o sistema? Digite atualizar"
    echo "Deseja mostrar a data de hoje? digite data"
    echo "Deseja instalar algum programa? digite instalar"
    echo "Deseja ver o uso de memoria ram? digite memoria_ram"
    case $desejo in
        atualizar)
            echo "Atualizando a lista de pacotes"
            apt-get update
            ;;
        data)
            echo "Mostrando a data de hoje"
            date
            ;;
        instalar)
            echo "Qual programa deseja instalar?"
            read programa
            apt-get install $programa
            ;;
        memoria_ram)
            echo "Oi, uso de memoria ram atual:"
            free
            ;;
        *)
            echo "Desculpe nao entendo voce"
        ;;
    esac
}

while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	1)
        shuf -n 1 bomdia.txt
        read desejo
        func_desejo $desejo
		break
		;;
    2)
        shuf -n 1 boatarde.txt
        read desejo
        func_desejo $desejo
        break
    ;;
    3)
        shuf -n 1 boanoite.txt
        read desejo
        func_desejo $desejo
        break
    ;;
	*)
		echo "Desculpe nao entendo voce"
		;;
  esac
done
echo "Obrigado por interagir comigo"

