Optimise a docker image

## Task

lets create a docker-redis.nix file with the following nix code

<pre class="file" data-filename="redis-minimal.nix" data-target="replace">
{ pkgs ? import &ltnixpkgs&gt {}         # nixpkgs package set
 }:
 pkgs.redis.overrideAttrs (old: {
   # no need for systemd support in our docker image
   makeFlags = old.makeFlags ++ ["USE_SYSTEMD=no"];
   # build static binary with musl
   preBuild = ''
     makeFlagsArray=(PREFIX="$out"
                     CC="${pkgs.musl.dev}/bin/musl-gcc -static"
                     CFLAGS="-I${pkgs.musl.dev}/include"
                     LDFLAGS="-L${pkgs.musl.dev}/lib")
   '';
   # Let's remove some binaries which we don't need
   postInstall = "rm -f $out/bin/redis-{benchmark,check-*,cli}";
 })
</pre>

In redis-minimal.nix we override the default redis build with three changes:
1.) Remove the redis systemd support
2.) Build a statically linked binary with musl
3.) Remove all binaries apart from redis-server

lets create a nix expression that build a new docker image with this version of redis-xminimal


<pre class="file" data-filename="docker-redis-minimal.nix" data-target="replace">
 { pkgs ? import &ltnixpkgs&gt {}
 }:
 let
   redisMinimal = import ../nixuser2/redis-minimal.nix { inherit pkgs; };
 in
 pkgs.dockerTools.buildLayeredImage { # helper to build docker image
   name = "nix-redis-minimal";        # give docker image a name
   tag = "latest";                    # provide a tag
   contents = [ redisMinimal ];       # use redisMinimal package
 }
</pre>

`nix-build /home/nixuser2/docker-redis-minimal.nix`{{execute}}

`sudo docker load -i ./result`{{execute}}

`sudo docker images | grep redis`{{execute}}

