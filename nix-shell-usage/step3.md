Making Derivation



## Task

A Dervivation is at the heart of what the nix uses to build software and configurations.

in the code we call a function called stdenv.mkDerivation 

we pass the name we want to call it the Derivation and it's buildInputs

in the case, we want the package cowsay to be provided in our nix-shell, so the Derivation explains
EVERYTHING that needs to be built to provide cowsay. This includes ...

we can use the command 

`nix-instantiate --eval /home/nixuser2/test.nix`{{execute}}



https://nixos.org/nixpkgs/manual/#sec-using-stdenv
