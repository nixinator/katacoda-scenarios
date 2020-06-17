Searching for packages

## Task

let search for a package something....

`nix search cowsay`{{execute}}

we have to a little 'hack' to get "nix search" to work
https://github.com/NixOS/nix/issues/1865

there seems to be more to this bug?
https://github.com/NixOS/nix/issues/3119


`echo $NIX_PATH`{{execute}}

`NIX_PATH=nixpkgs=$NIX_PATH/nixpkgs`{{execute}}

`echo $NIX_PATH`{{execute}}

`nix search cowsay`{{execute}}

`nix-env -i cowsay`{{execute}}

`cowsay "clever the cows says... i just tab-complete haskellPackages. from inside nix repl"`{{execute}}

`nix-env -f '<nixpkgs>' -qaP firefox`{{execute}}

`nix search firefox`{{execute}}

`nix repl '<nixpkgs>'`{{execute}}

`haskellPackages.`{{execute}}

NOW PRESS TAB key, to tab complete.... rather nice....

to quit
`:q`{{execute}}
