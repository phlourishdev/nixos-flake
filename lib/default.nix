{lib, ...}: let
    inherit (lib) mkOption strings;
    inherit (lib.attrsets) filterAttrs mapAttrsToList;
    inherit (lib.types) bool;
in rec {
    disabled = { enable = false; };
    enabled = { enable = true; };
    mkOpt = type: default: description: mkOption { inherit type default description; };
    mkBoolOpt = mkOpt bool;
}