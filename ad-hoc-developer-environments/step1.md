Install the Nix deamon in multiuser mode

## Task

create a nornal user who can sudo

`useradd -m nixuser -G sudo;su - nixuser `{{execute}}

Install the nix package manager into your enviroment, in multiuser 
The creation of the nixdaemon and service.

`time sh <(curl -L https://nixos.org/nix/install) --daemon`{{execute}}

Installation finished!

we need to logout of nixuser, and log back in

`exit`{{execute}}

`su - nixuser`{{execute}}


`nix-env --version`{{execute}}

we can check that the nix daemon is running and the nix daemon socket is available

The socket allows userspace nix tools to commicate with nix daemon

`systemctl status nix-daemon.service nix-daemon.socket`{{execute}}

`sudo netstat -a -p --unix | grep daemon-sock`{{execute}}
