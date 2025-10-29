{ lib, ... }:
{
    imports = [ 
        ./vscode/default.nix 
        ./sway/default.nix 
        ./common.nix 
        ./zsh/default.nix 
        ./foot/default.nix 
        ./kitty/default.nix 
        ./bash/default.nix
        ./vim/default.nix];
}