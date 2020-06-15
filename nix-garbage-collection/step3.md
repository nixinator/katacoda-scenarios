More on building

## Task

if we use nix build directly, the package will be built but not installed (symlinked) to the users enviroment

`nix-build '<nixpkgs>' -A tree`{{execute}}

`ls -lha $HOME/.nix-profile/bin/tree`{{execute}}

its not been symlinked into our enviroment.

lets take a look at tree dependices dependices.

`nix-build '<nixpkgs>' -A tree`{{execute}}

`nix-store -qR $(nix-build '<nixpkgs>' -A tree)`{{execute}}

we can now see tree dependices


`cd /nix/var/nix/gcroots`{{execute}}

`cd profiles/per-user/nixuser`{{execute}}

`readlink profile-1-link`

`nix-store -qR $(readlink profile-1-link)`{{execute}}

this now shows all the depencices into the nix store of of your current user enviroment (profile)

lets collect garbage from the nix store

`nix-collect-garbage`{{execute}}

lots of things get delete from the nix store, including tree , which wasn't part of enviroment.


lets install it again...
`nix-build '<nixpkgs>' -A tree`{{execute}}

and collect garbage again...

`nix-collect-garbage 2>&1 >/dev/null | grep tree`{{execute}}

as expect tree (and it's dependices are deleted)

opposed to

`nix-env -iA nixpkgs.tree`{{execute}}

`nix-collect-garbage 2>&1 >/dev/null | grep tree`{{execute}}

as tree is now installed into of profile, the nix store knows it's in use in our profile so is not thrown in the garbage.

