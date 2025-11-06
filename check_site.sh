#!/bin/bash


SITE_URL="https://www.amazon.com.br/"

#-w "%{http_code}" : Escreve apenas o código de status (200, 404, 
STATUS_CODE=$(curl -s -o /dev/null -w "%{http_code}" $SITE_URL)

if [ $STATUS_CODE -eq 200 ]; then
	echo "Sucesso: O site $SITE_URL está on-line (Status: $STATUS_CODE)"
else
	echo "Falha: O site $SITE_URL está fora do ar (Status: $$STATUS_CODE)"
	
	#Diga ao Shell (Nuvem) que este script falhou.
	exit 1 
fi 
