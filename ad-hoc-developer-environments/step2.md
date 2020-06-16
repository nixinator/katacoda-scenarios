What is a shell environment.

https://nix.dev/tutorials/ad-hoc-developer-environments.html


## Task

A shell environment gives you access to the exact versions of packages specified by Nix.

A hello world example:

`hello`{{execute}}

`nix-shell -p hello`{{execute}}

we are now in a complely new shell

`exit`{{execute}}


`hello`{{execute}}

Here we used the -p (packages) flag to specify that we needed the hello dependency. Nix found this, downloaded it, and made it available in a shell environment.

