{ channels, ... }:

final: prev:

{
    inherit (channels.unstable) chromium;
}