Lets write a piece of nix code to create a docker image with redis.

## Task

lets create a docker-redis.nix file with the following nix code

<pre class="file" data-filename="docker-redis.nix" data-target="replace">{ pkgs ? import &ltnixpkgs&gt {}         # nixpkgs package set
 }:
 pkgs.dockerTools.buildLayeredImage { # helper to build docker image
   name = "nix-redis";                # give docker image a name
   tag = "latest";                    # provide a tag
   contents = [ pkgs.redis ];         # packages in docker image
 }
</pre>

lets nix-build this code (expression)

`nix-build /home/nixuser2/docker-redis.nix`{{execute}}

sudo `docker load -i ./result`{{execute}}

sudo `docker images | grep redis`{{execute}}

