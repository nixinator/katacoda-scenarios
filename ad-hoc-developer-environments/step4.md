Ad hoc shell environments

## Task

Once you have the attribute name for packages, you can start a shell:


`nix-shell -p gitMinimal vim nano joe`{{execute}}

we now in a new shell

`git --version`{{execute}}

`which git`{{execute}}


Note that even if you had git installed before, once in the shell only the exact version installed by Nix is used.

Press CTRL-D to exit the shell and those packages won’t be available anymore.

