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
    cfg = config.${namespace}.pkgset.dev ;
in {
    options.${namespace}.pkgset.dev = {
        enable = mkEnableOption "Install the dev package set?";
    };

    config = mkIf cfg.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages =
        (with pkgs; [
            arduino-ide
            drawio
            gcc
            go
            python3
            rustup
            zed
        ])
        ++ (with pkgs.jetbrains; [
            clion
            idea-ultimate
            goland
            rust-rover
            pycharm-professional
        ]);
    };
}