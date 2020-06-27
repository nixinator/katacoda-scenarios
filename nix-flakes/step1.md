
## Task

The Nix package manager should be automatically installed

lets complete the installation by updating enviroment variables

`. /home/nixuser/.nix-profile/etc/profile.d/nix.sh`{{execute}}

Lets enable a shell with experimental nix flakes support.

`nix-shell -I nixpkgs=channel:nixos-20.03 -p nixFlakes`{{execute}}

`mkdir -p config/nix`{{execute}}

`echo "experimental-features = nix-command flakes" > .config/nix/nix.conf`{{execute}}

nix flake support should now be enabled.

`nix flake --help`{{execute}}
