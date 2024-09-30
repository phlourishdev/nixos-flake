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
    cfg = config.${namespace}.de.gnome;
in {
    options.${namespace}.de.gnome = {
        enable = mkEnableOption "Enable the gnome desktop?";
    };

    config = mkIf cfg.enable {
        environment = {
            gnome.excludePackages =
                (with pkgs; [
                    gnome-tour
                    gnome-photos
                ])
                ++ (with pkgs.gnome; [
                    cheese
                    gnome-maps
                    gnome-music
                ]);
            systemPackages =
                (with pkgs; [
                    bibata-cursors
                    gnome-extension-manager
                    gruvbox-gtk-theme
                    gruvbox-plus-icons
                ])
                ++ (with pkgs.gnome; [
                    gnome-boxes
                    gnome-tweaks
                ])
                ++ (with pkgs.gnomeExtensions; [
                    appindicator
                    tiling-assistant
                    user-themes
                ]);
        };
        services = {
            udev.packages = with pkgs.gnome; [ gnome-settings-daemon ];
            xserver = {
                desktopManager.gnome = enabled;
                displayManager.gdm = enabled;
                enable = true;
                xkb.layout = "de";
            };
        };
    };
}
