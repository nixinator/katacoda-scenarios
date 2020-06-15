Nix Garbage Collection - Burke Libbey 

from https://www.youtube.com/watch?v=ylZDUKU2eR0 



## Task

lets install ripgrep....

`nix-env -iA nixpkgs.ripgrep`{{execute}}

we now have ripgrep package installed into our enviroment

`ls -lha $(which rg)`{{execute}}

`which rg`{{execute}}

this is not on a normal path, it's added your nix profile 

`readlink $(which rg)`{{execute}}

as we can see, this is a symlink into the /nix/store

`nix-store --query --requisites $(readlink $(which rg))`{{execute}}

should i be worried... no!......   :-)


