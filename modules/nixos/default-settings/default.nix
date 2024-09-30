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
    cfg = config.${namespace}.default-settings;
in {
    options.${namespace}.default-settings = {
        enable = mkBoolOpt true "Enable default settings?";
    };

    config = mkIf cfg.enable {
        boot = {
            kernel.sysctl = {
                "net.core.default_qdisc" = "fq";
                "net.ipv4.tcp_congestion_control" = "bbr";
                "vm.swappiness" = 10;
            };
            kernelModules = [ "tcp_bbr" ];
            kernelParams = [ "quiet" ];
            loader = {
                efi.canTouchEfiVariables = true;
                timeout = mkDefault 2;
            };
        };
        console = {
            font = "JetBrains Mono NL, Medium";
            packages = with pkgs; [ jetbrains-mono ];
            useXkbConfig = true; # configure the virtual console keymap from the xserver keyboard settings
        };
        environment.systemPackages =  with pkgs; [
            btop
            curl
            wget
        ];
        nix.settings.experimental-features = [ "nix-command" "flakes" ];
        hardware.enableRedistributableFirmware = true;
        i18n.defaultLocale = "en_CA.UTF-8";
        time.timeZone = "Europe/Berlin";
    };
}