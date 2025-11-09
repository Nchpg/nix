{ config, target, inputs, ... }:

# let
#   # On définit un overlay complet qui simule la présence de ankiAddons.
#   # Cela est nécessaire pour que l'évaluation du module stylix pour anki réussisse.
#   missing-stuff-overlay = final: prev: {
#     ankiAddons = prev.ankiAddons or {
#       # L'attribut 'recolor' que le module anki recherche.
#       recolor = {
#         # La fonction 'withConfig' qu'il essaie d'appeler.
#         # On la remplace par une fonction qui ne fait rien et retourne un ensemble vide.
#         withConfig = _: {};
#       };
#     };
#   };
# in
{
  imports = [
    (./. + "/${target.profile}")
  ];

  config = {
    home-manager.users = builtins.listToAttrs
      (map (user: {
        name = user.name;
        value = {
          imports = [ 
            # stylix
            inputs.stylix.homeModules.stylix
            # build user
            (./. + "/${target.profile}/home/${user.name}") 
            # user modules
            ../modules/user 
          ];
          config = { 
            userSettings.user = user.name; 
          };
        };
      })
      (config.systemSettings.users ++ [{name = "root";}]));
    };
}