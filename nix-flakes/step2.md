Using Flakes

## Task


The following command fetches the dwarffs Git repository, builds its default package and runs it.

`nix shell github:edolstra/dwarffs -c dwarffs --version`{{execute}}

The command above isn’t very reproducible: it fetches the most recent version of dwarffs, which could change over time. But it’s easy to ask Nix to build a specific revision:

`nix shell github:edolstra/dwarffs/d11b181af08bfda367ea5cf7fad103652dc0409f`{{execute}}

## Flake Inputs


`nix flake list-inputs github:edolstra/dwarffs`{{execute}}


## Flake Outputs

Another goal of flakes is to provide a standard structure for discoverability within Nix-based projects. Flakes can provide arbitrary Nix values, such as packages, NixOS modules or library functions. These are called its outputs. We can see the outputs of a flake as follows:

`nix flake show github:edolstra/dwarffs`{{execute}}
