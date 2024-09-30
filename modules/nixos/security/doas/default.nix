{
    config,
    lib,
    namespace,
    ...
}:
with lib;
with lib.${namespace};
let
    cfg = config.${namespace}.security.doas;
in {
    options.${namespace}.security.doas = {
        enable = mkEnableOption "Enable security measures?";
    };

    config = mkIf cfg.enable {
        security = {
            sudo = disabled;
            doas = {
                enable = true;
                extraRules = [{
                    user = [ config.${namespace}.user.name ];
                    keepEnv = true;
                }];
            };
        };
    };
}