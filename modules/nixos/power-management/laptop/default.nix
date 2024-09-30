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
    cfg = config.${namespace}.power-management.laptop;
in {
    options.${namespace}.power-management.laptop = {
        enable = mkEnableOption "Enable power mangement (laptop)?";
    };

    config = mkIf cfg.enable {
        powerManagement = enabled;
        services = {
            thermald = enabled;
            auto-cpufreq = {
                enable = true;
                settings = {
                    battery = {
                        governor = "powersave";
                        turbo = "never";
                    };
                    charger = {
                        governor = "performance";
                        turbo = "auto";
                    };
                };
            };
        };
    };
}