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
 
will get you the same dependices, as it points to the same place in the store.

lets move on , and take a closer look at the GCROOT

