Optimise a docker image

## Task

lets create a docker-redis.nix file with the following nix code

lets nix-build this code (expression)

`nix-build /home/nixuser2/docker-redis.nix`{{execute}}

`sudo docker load -i ./result`{{execute}}

`sudo docker images | grep redis`{{execute}}

