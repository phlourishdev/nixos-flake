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
    # shouldn't be needed, hopefully
    # inherit (lib) mkIf;
    # inherit (lib.${namespace}) mkEnableOption;
    cfg = config.${namespace}.virtualisation.docker;
in {
    options.${namespace}.virtualisation.docker = {
        enable = mkEnableOption "Enable Docker";
    };

    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            docker
        ];
        virtualisation.docker = enabled;
    };
}
