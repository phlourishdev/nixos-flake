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
    cfg = config.${namespace}.pkgset.net ;
in {
    options.${namespace}.pkgset.net = {
        enable = mkEnableOption "Install the net package set?";
    };

    config = mkIf cfg.enable {
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = with pkgs; [
            bettercap
            ciscoPacketTracer8
            ftp
            gobuster
            nmap
            mysql
            responder
            smbclient
            sqlmap
            tcpdump
        ];
    };
}
