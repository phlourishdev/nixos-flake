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
    cfg = config.${namespace}.power-management.powertop;
in {
    options.${namespace}.power-management.powertop = {
        enable = mkEnableOption "Enable power mangement (powertop)?";
    };

    config = mkIf cfg.enable {
        powerManagement.powertop = enabled;
    };
}