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
            firmware = enabled;
            power-management.laptop = enabled;
        };
        networking.hostName = "friedrich";
        system.stateVersion = "24.05"; # DO NOT CHANGE
    };
}