{
    options,
    config,
    lib,
    namespace,
    ...
}:
with lib;
with lib.${namespace};
let
  cfg = config.${namespace}.hardware.networking;
in {
    options.${namespace}.hardware.networking = {
        enable = mkEnableOption "Enable networking";
    };

    config = mkIf cfg.enable {
        networking = {
            networkmanager = enabled;
            firewall = enabled;
        };
        services.dnscrypt-proxy2 = {
            enable = true;
            settings = {
                cache = true;
                cache_size = 4096;
                ipv6_servers = true;
                require_dnssec = true;
                sources.quad9-resolvers = {
                   urls = [ "https://www.quad9.net/quad9-resolvers.md" ];
                   minisign_key = "RWTp2E4t64BrL651lEiDLNon+DqzPG4jhZ97pfdNkcq1VDdocLKvl5FW";
                   cache_file = "quad9-resolvers.md";
                };
                bootstrap_resolvers = [ "1.1.1.1" "1.0.0.1" ];
            };
        };
    };
}