
Nix-shell lets you open a shell in a new environment.

In Nix; an environment is a collection of derevations (aka packages) that are put into your PATH. This is really useful in many circumstances:

Collaboration; you can just send the .nix file to a collaborator and they will have the same things installed


Cleanliness; stuff inside a nix-shell isn't installed in your main environment; so you don't have to worry about uninstalling stuff or causing conflicts with other packages you love


Developing things; it is easy to build your own packages and test them inside a shell


## Task

let install something....

`nix-env -i cowsay`{{execute}}

Okay? that looks weird.... eh? what just happened?

`cowsay https://twich.tv/rolandvdrums`{{execute}}

where did that come from?

`type cowsay`{{execute}}

why does it live there?

`ls -lha /home/nixuser/.nix-profile/bin/cowsay`{{execute}}

should i be worried... no!......   :-)


