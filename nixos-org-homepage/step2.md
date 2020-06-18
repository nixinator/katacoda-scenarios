

## Task

lets create a test.nix file with the following nix code

`git clone https://github.com/NixOS/nixos-homepage.git`{{execute}}

`cd nixos-homepage`{{execute}}

``nix-shell``{{execute}}

``make``{{execute}}

`python -m http.server 8000`{{execute}}

https://[[HOST_SUBDOMAIN]]-8000-[[KATACODA_HOST]].environments.katacoda.com

<pre>https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com</pre>
