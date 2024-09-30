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
            power-management.laptop = enabled;
        };
        networking.hostName = "rosa";
        system.stateVersion = "24.05"; # DO NOT CHANGE
    };
}