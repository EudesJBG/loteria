#!/bin/bash
# Este script tem como objetivo formatar as apostas do site loterias online da caixa
# O script recebe um arquivo como entrada e o resultado e exibido no console
#
# Por exemplo, ao informar um arquivo .txt com a aposta a seguir:
# 17/09/2022
# Mega-Sena
# 02
# 05
# 19
# 41
# 54
# 56
# Surpresinha
# 2521
#  Concurso não apurado
#
# Ao executar o script:
# ./formata-apostas.sh arquivo.txt
# Sera exibido na tela:
# 02  05  19  41  54  56  Surpresinha

if [ -z "$1" ]; then
    echo "ERRO: arquivo de apostas nao informado"
    exit 1
fi

filename=$1
aposta=""

while read line; do
    if [[ ${line} =~ ^[[:digit:]][0-9]$|Surpresinha ]]; then
        aposta="$aposta${line}  "
    else
        if [ -n "${aposta}" ]; then
            echo "${aposta}"
            aposta=""
        fi
    fi
done < $filename
