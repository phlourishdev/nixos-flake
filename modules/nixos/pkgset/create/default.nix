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
    cfg = config.${namespace}.pkgset.create ;
in {
    options.${namespace}.pkgset.create = {
        enable = mkEnableOption "Install the create package set?";
    };

    config = mkIf cfg.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [
            audacity
            gimp
            obs-studio
        ];
    };
}