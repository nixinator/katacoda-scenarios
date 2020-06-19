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

lets nix-build this code (expression)

`nix-build /home/nixuser2/docker-redis.nix`{{execute}}

`sudo docker load -i ./result`{{execute}}

`sudo docker images | grep redis`{{execute}}

