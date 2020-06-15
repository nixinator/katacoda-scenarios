More on building

## Task

if we use nix build directly, the package will be built but not installed (symlinked) to the users enviroment

`nix-build '<nixpkgs>' -A tree`{{execute}}

`ls -lha $HOME/.nix-profile/bin/tree`{{execute}}

its not been symlinked into our enviroment.

lets take a look at tree dependices.

`nix-store -qR $(nix-build '<nixpkgs>' -A tree)`{{execute}}

we can now see tree's dependices

nix-build creates a link to the resultant build called result


`ls -lha result`{{execute}}
`nix-store -qR $(readlink result)`{{execute}}
 
will get you the same dependices, as it points to the same place.

GCROOTS

`cd /nix/var/nix/gcroots`{{execute}}

`cd profiles/per-user/nixuser`{{execute}}

`readlink profile-2-link`{{execute}}

`nix-store -qR $(readlink profile-2-link)`{{execute}}

this now shows all the depencices into the nix store of of your current user enviroment (profile)


`nix-store -qR $(readlink profile-2-link) | grep ripgrep`{{execute}}

we can clearly see the ripgrep is part of the enviroment (this wont be garbaged collected).d

`nix-store -qR $(readlink profile-2-link) | grep tree`{{execute}}

however tree , which built with nix-build is not


lets go back home and take out the garbage


`cd $HOME`{{execute}}

lets collect garbage from the nix store

`nix-collect-garbage`{{execute}}

nolonger used files get removed from the nix store,  

why wasn't tree was collected?? it's not in our GC root?

when run a nix-build, a handy result directory is created, which links into the nix store.
If we don't remove this then ,the garbage collector won't clean it up.

`nix-build '<nixpkgs>' -A tree`{{execute}}

`ls -lha result`{{execute}}

`nix-store -qR $(readlink result)`{{execute}}

lets remove the handy result link that nix-build creates

`rm result`{{execute}}

and collect the garbage again...

`nix-collect-garbage 2>&1 >/dev/null | grep tree`{{execute}}

as expected tree (and it's dependices are garbage collected)

opposed to

`nix-env -iA nixpkgs.tree`{{execute}}

`nix-collect-garbage 2>&1 >/dev/null | grep tree`{{execute}}

tree is not garbage collected as there is link created in the GCROOT 
however the derivation files (.drv) are collected.
