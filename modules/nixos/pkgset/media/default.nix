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
    cfg = config.${namespace}.pkgset.media ;
in {
    options.${namespace}.pkgset.media = {
        enable = mkEnableOption "Install the media package set?";
    };

    config = mkIf cfg.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [
            ffmpeg
            mpv
            spotdl
            spotify
            vlc
        ];
    };
}