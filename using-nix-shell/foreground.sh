useradd -m nixuser -G sudo;su - nixuser 

time sh <(curl -L https://nixos.org/nix/install) --no-daemon
