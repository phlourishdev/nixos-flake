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
    cfg = config.${namespace}.pkgset.comms;
in {
    options.${namespace}.pkgset.comms = {
        enable = mkEnableOption "Install the comms package set?";
    };

    config = mkIf cfg.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [
            discord
            signal-desktop
            transmission
            # vesktop
            whatsapp-for-linux
        ];
    };
}