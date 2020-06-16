Towards reproducibility

## Task

Even running in these basic Nix shells, if you handed over these commands to another developer, they could get different results.

These shell environments are really convenient, but they are not perfectly reproducible in this form


What do we mean by reproducible? A fully reproducible example would give exactly the same results no matter when or on what machine you run the command. The environment provided would be identical each time.

Nix also offers fully reproducible environments, which it calls pure environments.

The following is a fully reproducible example and something that different colleagues with different machines, for example, could share.

`nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/82b5f87fcc710a99c47c5ffe441589807a8202af.tar.gz`{{execute}}

`git --version`{{execute}}


`exit`{{execute}}

There are two things going on here:

1. --pure flag makes sure that the bash environment from your system is not inherited. That means only the git that Nix installed is available inside the shell. This is useful for one-liners and scripts that run for example within a CI environment. While developing, however, we’d like to have our editor around and a bunch of other things. Therefore we might skip the flag for development environments but use it in build ones.

2. The -I flag pins the nixpkgs revision to an exact git revision, leaving no doubt which exact version of Nix packages will be used.

To understand the --pure flag , lets

`nix-env -i cowsay`{{execute}}

`cowsay "available in this shell"`{{execute}}

`nix-shell -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/82b5f87fcc710a99c47c5ffe441589807a8202af.tar.gz`{{execute}}

`cowsay "still available in the nix-shell"`{{execute}}

`exit`{{execute}}

`nix-shell --pure -p git -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/82b5f87fcc710a99c47c5ffe441589807a8202af.tar.gz`{{execute}}

`cowsay "has not been inherited by nix-shell"`{{execute}}

cowsay is not available, as the shell is pure

