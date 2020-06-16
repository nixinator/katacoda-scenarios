Beyond tooling: Python libraries

## Task

nix-shell provides a bunch of other bash variables from packages specified.

Let’s try a quick example using Python and $PYTHONPATH:

`nix-shell -p 'python38.withPackages (packages: [ packages.django ])'`{{execute}}

`python -c 'import django; print(django)'`{{execute}}

We create an ad hoc environment with $PYTHONPATH set and python available, along with the django package as well.

The -p argument can handle more than attribute names. You can use a full Nix expression, but we’ll cover that in later tutorials.


