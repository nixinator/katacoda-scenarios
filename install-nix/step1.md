This is your first step.

for hearing input i'd recommend https://www.youtube.com/watch?v=YcL8SvyKtE4
Cymande - Dove


## Task

create a nornal user who can sudo

`useradd -m nixuser -G sudo;su - nixuser `{{execute}}

Install the nix package manager into your enviroment

`time curl https://nixos.org/nix/install | sh`{{execute}}

Installation finished!  To ensure that the necessary environment
variables are set, either log in again, or type

`. /home/nixuser/.nix-profile/etc/profile.d/nix.sh`{{execute}}

