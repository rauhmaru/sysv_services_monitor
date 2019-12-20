#!/bin/bash
# verifica status dos servicos

Servico=$1
service $Servico status &> /dev/null
echo $?
