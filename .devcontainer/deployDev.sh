#!/usr/bin/env bash
set -e

echo "---------------------------------------------------"
echo "Executando o script $0"
echo "---------------------------------------------------"

mkdir -p $HOME/.local/bin

echo "Colocando $HOME/.local/bin no PATH"
 . ~/.profile


echo "PATH=$PATH"

echo "Rodar pip install --upgrade pip"
pip install --upgrade pip

echo "Rodar pip install -r requirements.txt"
pip install -r /app/requirements.txt

# Cria .env
ARQUIVO_DOTENV=/app/.env
if [ ! -f "$ARQUIVO_DOTENV" ]; then
    cp /app/.devcontainer/env.example $ARQUIVO_DOTENV
fi

# echo "copiando htpassword"
# cp /app/.devcontainer/_htpass.txt test.htpasswd

# echo "Check database migrations"
# python manage.py makemigrations

# echo "Apply database migrations"
# python manage.py migrate

# echo "Popula database"
# python manage.py loaddata sessoes

echo "Sleep"
sleep infinity

exec "$@"
