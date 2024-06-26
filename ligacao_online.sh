!/bin/bash

# Executa o comando e armazena a saída em uma variável
output=$(asterisk -rx "core show channels verbose")

# Exibe a saída do comando para depuração
echo "Saída do comando:"
echo "$output"
echo "----------------"

# Filtra as linhas que contêm a duração das chamadas e as exibe
echo "$output" | while read -r line; do
    # Exibe cada linha para depuração
    echo "Processando linha: $line"
    # Procura pela duração no formato (HH:MM:SS)
    if [[ $line =~ ([0-9]{2}:[0-9]{2}:[0-9]{2}) ]]; then
        duration=${BASH_REMATCH[1]}
        echo "Duração da chamada: $duration"
    fi
done
