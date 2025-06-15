#!/usr/bin/env bash

DAYS="$1"

if [[ -z "$DAYS" ]]; then
  echo "Usage: $0 <days>"
  exit 1
fi

echo "Cleaning NixOS system generations older than $DAYS days..."

# Delete system generations older than D days
sudo nix-env --delete-generations +"$DAYS"d

# Delete user generations older than D days
nix-env --delete-generations +"$DAYS"d

# Run garbage collection to free space
sudo nix-collect-garbage -d
nix-collect-garbage -d

# Optionally rebuild the GRUB menu
echo "Rebuilding the GRUB configuration..."
sudo nixos-rebuild boot --flake .

echo "Cleanup and GRUB update complete."

