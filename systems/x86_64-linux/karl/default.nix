{
    lib,
    namespace,
    pkgs,
    ...
}:
with lib.${namespace};
let
in {
    # imports = [ ./hardware.nix ]; TODO
    config = {
        ${namespace} = {
            default-settings = enabled;
            suites.workstation = enabled;
            # suites.gaming = enabled; TODO
        };
        networking.hostName = "karl";
        system.stateVersion = "24.05"; # DO NOT CHANGE
    };
}