{
    config,
    lib,
    namespace,
    ...
}:
with lib;
with lib.${namespace};
let
    cfg = config.${namespace}.servers.syncthing;
in {
    options.${namespace}.servers.syncthing = {
        enable = mkEnableOption "Enable syncthing";
    };

    config = mkIf cfg.enable {
        networking.firewall = {
           allowedTCPPorts = [
                8384
                22000
           ];
           allowedUDPPorts = [
                21027
                22000
           ];
        };
        services = {
            syncthing = {
                inherit (config.${namespace}.user.group);
                dataDir = "/home/${config.${namespace}.user.name}";
                enable = true;
                guiAddress = "0.0.0.0:8384";
                user = config.${namespace}.user.name;
            };
        };
    };
}
