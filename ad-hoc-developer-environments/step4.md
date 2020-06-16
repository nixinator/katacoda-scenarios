Ad hoc shell environments

## Task

Once you have the attribute name for packages, you can start a shell:


`nix-shell -p gitMinimal vim nano joe`{{execute}}

we are now in a new shell

`git --version`{{execute}}

`which git`{{execute}}


Note that even if you had git installed before, once in the shell only the exact version installed by Nix is used.

`exit`{{execute}}

we now return to a orginal undistrurb shell

