{
    pkgs,
    config,
    lib,
    namespace,
    ...
}:
with lib;
with lib.${namespace};
let
    cfg = config.${namespace}.user;
in {
    options.${namespace}.user = with types; {
        name = mkOpt str "phlourish" "Username";
        initialPassword = mkOpt str "password" "Initial password used for user creation";
        icon = mkOpt (nullOr package) defaultIcon "Profile picture used for user";
        extraGroups = mkOpt (listOf str) [] "Groups for the user to be assigned";
        extraOptions = mkOpt attrs {} "Extra options passed to <option>users.users.<name></option>";
    };
    config = {
        environment.sessionVariables.FLAKE = "/home/${config.${namespace}.user.name}/.dotfiles";
        users.users.${cfg.name} = {
            isNormalUser = true;
            shell = pkgs.bash;
            uid = 1000;
            inherit (cfg) name initialPassword;
            createHome = true;
            home = "/home/${cfg.name}";
            group = "users";
            extraGroups = [
                "wheel"
                "audio"
                "dialout"
                "sound"
                "video"
                "networkmanager"
                "input"
                "tty"
                "docker"
            ]
            ++ cfg.extraGroups;
        }
        // cfg.extraOptions;
    };
}