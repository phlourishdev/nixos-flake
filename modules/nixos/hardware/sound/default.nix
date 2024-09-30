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
    cfg = config.${namespace}.hardware.sound;
in {
    options.${namespace}.hardware.sound = {
        enable = mkEnableOption "Enable sound";
    };

    config = mkIf cfg.enable {
        environment.systemPackages = with pkgs; [
            pavucontrol
            pipewire
        ];
        hardware.pulseaudio = disabled;
        security.rtkit = enabled;
        services.pipewire = {
            alsa = {
                enable = true;
                support32Bit = true;
            };
            enable = true;
            pulse = enabled;
        };
        sound = disabled;
    };
}
