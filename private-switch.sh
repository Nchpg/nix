#!/usr/bin/env bash

# Vérifie les arguments
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [hide|show]"
    exit 1
fi

ACTION="$1"

# Choisir la commande Git selon l'action
if [ "$ACTION" = "hide" ]; then
    CMD="git update-index --assume-unchanged"
elif [ "$ACTION" = "show" ]; then
    CMD="git update-index --no-assume-unchanged"
else
    echo "Argument invalide : $ACTION. Utilisez 'assume' ou 'no-assume'."
    exit 1
fi

# Trouve tous les fichiers private.nix dans les sous-dossiers
FILES=$(find . -type f -path "*/private.nix")

# Applique la commande sur tous les fichiers trouvés
for f in $FILES; do
    echo "$CMD $f"
    $CMD "$f"
done