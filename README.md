## hostname list
- karl: main desktop machine
- friedrich: lenovo t480
- rosa: main compute/storage server
- clara: networking server

## todo
### Necessary for all machines
- SECURITY
  - Secureboot
  - Linux hardening (check w/ lynis)
  - Full disk encryption
- HARDWARE
  - Generate hardware configs w/ Live USB for every system w/ `nixos-generate-config --root /mnt --dir ./`
  - Probably use `/dev/disk/by-id` for disks
  - Modify `hardware.nix`

### Necessary for desktops
- LibreWolf
  - native-messaging for keepass
- SUITES
  - Game
    - bottles
    - osu-lazer
    - prismlauncher
    - steam
- DOTFILES
  - .bashrc, starship.rs
  - plymouth
  - Gnome theming
  - Some gnome configs for shortcuts, etc.?

### Necessary for servers
- SUITES
  - Container
- Write containers
- Different networking

### NOTE: <a style="color:red">*INCOMPLETE*</a>
