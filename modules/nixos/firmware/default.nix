{
    config,
    lib,
    namespace,
    pkgs,
    ...
}:
with lib;
with lib.${namespace};
let
    cfg = config.${namespace}.firmware;
in {
    options.${namespace}.firmware = {
        enable = mkEnableOption "Enable firmware support?";
    };

    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            firmware-manager
            gnome-firmware
        ];
        services.fwupd = enabled;
    };
}