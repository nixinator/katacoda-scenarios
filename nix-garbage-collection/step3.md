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

`cd profiles/per-user/-nixuser`{{execute}}

`readlink profile-1-link`

`nix-store -qR $(readlink profile-1-link)`{{execute}}
