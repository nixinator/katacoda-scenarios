Exploring GCROOTSg

## Task

GCROOTS

lets take a look at the GC roots
This how nix knows what  to garbage collect.


`cd /nix/var/nix/gcroots`{{execute}}

`cd profiles/per-user/nixuser`{{execute}}

`readlink profile-2-link`{{execute}}

`nix-store -qR $(readlink profile-2-link)`{{execute}}

this listsy dependicy of your current user enviroment (profile)


`nix-store -qR $(readlink profile-2-link) | grep ripgrep`{{execute}}

we can clearly see the ripgrep is part of the current enviroment , so this wont be garbaged collected)

`nix-store -qR $(readlink profile-2-link) | grep tree`{{execute}}

tree , which was built earlier  nix-build is not part of the user enviroment profile.


lets go back home and take out the garbage


`cd $HOME`{{execute}}

lets collect garbage from the nix store

`nix-collect-garbage`{{execute}}

Many thing here are BUILD time dependices, nix makes the distiction between build time dependices and run time dependices.  

why wasn't tree was collected?? it's not in our user enviroment profile?

an artifact of the nix-build process, is creates a result symlink which links into the nix store.

`nix-build '<nixpkgs>' -A tree`{{execute}}

`ls -lha result`{{execute}}

`nix-store -qR $(readlink result)`{{execute}}

lets go back to the GCROOT


`cd /nix/var/nix/gcroots`{{execute}}
`cd auto`{{execute}}
`ls -lha`{{execute}}

a symlink to the result directory in $HOME has been created.
This prevents results fform nix-build for being garbage collected.


lets remove the results symlink from our home. 


`cd $HOME`{{execute}}

`rm result`{{execute}}

`ls -lha /nix/var/nix/gcroots/auto`{{execute}}

the symlink is now broken/danging n the gcroot auto directory..,ls indicates this in RED 


lets collect the garbage again...

`nix-collect-garbage 2>&1 >/dev/null | grep tree`{{execute}}

as expected tree and it's unused build/run dependices are garbage collected.

opposed to

`nix-env -iA nixpkgs.tree`{{execute}}

`nix-collect-garbage 2>&1 >/dev/null | grep tree`{{execute}}

tree is not garbage collected as there is link created in the GCROOT 

