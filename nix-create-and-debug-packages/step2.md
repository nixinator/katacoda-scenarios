
How to install from a git local repository


## Task

Lets shallow clone direct from the distribution repo and set an environment variable pointing to it.

If we do a full clone, it can be quite large download as  the repo gets many commmits a day and 
also contains many branches.


`mkdir -p ~/tmpdev && cd ~/tmpdev`{{execute}}
`git clone --depth=1 https://github.com/nixos/nixpkgs`{{execute}}
`export NIXPKGS=~/tmpdev/nixpkgs`{{execute}}
`ls $NIXPKGS`{{execute}}
make some changes ...

example: list all available software from the local repository $NIXPKGS

`nix-env -f $NIXPKGS -qaP '*'`{{execute}}
example: install software from local repository

`nix-env -f $NIXPKGS -iA python-urlgrabber`{{execute}}
example: update the system based on your local $NIXPKGS

`nixos-rebuild -I nixpkgs=$NIXPKGS switch`{{execute}}
example: build an expression and put the output in to `pwd`/results

`nix-build $NIXPKGS -A irssi`{{execute}}
example: get an environment which is used to build irssi (also see nix-shell)

`nix-build $NIXPKGS --run-env -A irssi`{{execute}}
example: get a persistent environment which is used to build irssi

`nix-build $NIXPKGS --run-env -A irssi --add-root`{{execute}}



let install something....

`nix-env -i cowsay`{{execute}}

Okay? that looks weird.... eh? what just happened?

`cowsay https://twich.tv/rolandvdrums`{{execute}}

where did that come from?

`type cowsay`{{execute}}

why does it live there?

`ls -lha /home/nixuser/.nix-profile/bin/cowsay`{{execute}}

should i be worried... no!......   :-)


