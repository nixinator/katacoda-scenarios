Lets write a piece of nix code to create a docker image with redis.

## Task

lets create a docker-redis.nix file with the following nix code

<pre class="file" data-filename="docker-redis.nix" data-target="prepend">{ pkgs ? import <nixpkgs> {}         # nixpkgs package set
 }:
 pkgs.dockerTools.buildLayeredImage { # helper to build docker image
   name = "nix-redis";                # give docker image a name
   tag = "latest";                    # provide a tag
   contents = [ pkgs.redis ];         # packages in docker image
 }
}
</pre>

please remove the lines 17 and 18 from docker-redis.nix (else the nix interpter will throw an error)

now we can start a new shell with nix-shell test.nix 

`nix-build /home/nixuser2/docker-redis.nix`{{execute}}

`docker load -i ./result`{{execute}}

`docker images | grep redis`{{execute}}

