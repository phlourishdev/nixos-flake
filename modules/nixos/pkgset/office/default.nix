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
    cfg = config.${namespace}.pkgset.office ;
in {
    options.${namespace}.pkgset.office = {
        enable = mkEnableOption "Install the office package set?";
    };

    config = mkIf cfg.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [
            chromium
            firefox
            keepassxc
            librewolf
            obsidian
            onlyoffice-bin
            thunderbird
            tor-browser
        ];
    };
}