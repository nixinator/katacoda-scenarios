Searching package attribute names

## Task

What can you put in a shell environment?”

To start, anything that’s in the official package list can become part of the shell environment.

You can search the package list using:


`nix-env -qaP --description git`{{execute}}

The first column is the attribute name and the second is the package name and its version. The third column is human readable description.

Once you are comfortable doing this, you can add other things too. For example, packages of your own or custom shell aliases.

Note
The query you use for searching packages is a regex, so be aware when it comes to special characters.
