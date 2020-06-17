
Nix-shell lets you open a shell in a new environment.

In Nix; an environment is a collection of derevations (aka packages) that are put into your PATH. This is really useful in many circumstances:

Collaboration; you can just send the .nix file to a collaborator and they will have the same things installed


Cleanliness; stuff inside a nix-shell isn't installed in your main environment; so you don't have to worry about uninstalling stuff or causing conflicts with other packages you love


Developing things; it is easy to build your own packages and test them inside a shell


## Task

lets create a test.nix file with the following nix code

<pre class="file" data-filename="test.nix" data-target="prepend"># This imports the nix package collection,
# so we can access the `pkgs` and `stdenv` variables
with import <nixpkgs> {};

# Make a new "derivation" that represents our shell
stdenv.mkDerivation {
  name = "my-environment";

  # The packages in the `buildInputs` list will be added to the PATH in our shell
  buildInputs = [
    # cowsay is an arbitary package
    # see https://nixos.org/nixos/packages.html to search for more
    pkgs.cowsay
  ];
}
</pre>
