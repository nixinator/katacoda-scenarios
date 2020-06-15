This is your first step.

for hearing input i'd recommend https://www.youtube.com/watch?v=YcL8SvyKtE4
Cymande - Dove


## Task

lets install ripgrep....

`nix-env -iA nixpkgs.ripgrep`{{execute}}

we now have ripgrep package installed into our enviroment

`ls -lha $(which rg)'{{execute}}

`which rg`{{execute}}

this is not on a normal path, it's added your nix profile 

`readlink $(which rg)`{{execute}}

as we can see, this is a symlink into the /nix/store

`nix-store --query --requisites $(readlinki $(which rg))`{{execute}}

should i be worried... no!......   :-)


