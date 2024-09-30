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
    cfg = config.${namespace}.suites.workstation;
in {
    options.${namespace}.suites.workstation = {
        enable = mkEnableOption "Enable the workstation suite";
    };

    config = mkIf cfg.enable {
        ${namespace} = {
            hardware.sound = enabled;
            hardware.networking = enabled;
            boot.grub = enabled;
            de.gnome = enabled;
            virtualisation.docker = enabled;
            servers.syncthing = enabled;
            security.doas = enabled;
            pkgset = {
                comms = enabled;
                create = enabled;
                dev = enabled;
                media = enabled;
                net = enabled;
                office = enabled;
            };
        };
    };
}