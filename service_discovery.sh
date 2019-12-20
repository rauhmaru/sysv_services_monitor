#!/bin/bash
# Lista os servicos e verifica se estao em execucao

tmpfile=$( mktemp )

# Todos os servicos
#chkconfig | awk /0:/'{ gsub("[0-6]:",""); print }' > $tmpfile

chkconfig | awk /3:on/'{ print $1 }' > $tmpfile

# Criacao do json
TotalDeLinhas=$( wc -l < $tmpfile )
Final=$(( TotalDeLinhas -1  ))

# Loop para composicao do arquivo json
echo -e "{\n\t\"data\":[\n"
while read ServiceName; do
echo -e "  {"
                echo -e "    \"{#SERVICENAME}\":\"$ServiceName\""
                let Contador++
                        if [[ $Contador -le $Final ]]; then
                                echo -e "  },\n"
                else
                                echo -e "  }\n]\n}"
                fi
done < $tmpfile

rm -f $tmpfile
