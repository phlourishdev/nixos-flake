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
    cfg = config.${namespace}.boot.grub;
in {
    options.${namespace}.boot.grub = {
        enable = mkEnableOption "Enable grub";
    };

    config = mkIf cfg.enable {
        boot = {
            loader.grub = {
                efiSupport = true;
                device = "nodev";
            };
        };
    };
}