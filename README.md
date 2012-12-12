# YAML COMMAND

[Website](http://rubyworks.github.com/yaml_command) /
[Report Issue](http://github.com/rubyworks/yaml_command/issues) /
[Development](http://github.com/rubyworks/yaml_command) /
[IRC Channel](irc://chat.us.freenode.net/rubyworks)


## Description

YAML Command is a command line tool for working with YAML files.

While currently a work in progress, the goal is evolve the design
for a standardized `yaml` command line tool. While this early
implementation is written in Ruby, ultimately the final version
would be written in C and be widely available.


## Commands

Commands are invoked simply enough:

    $ yaml <command> [options...] [arguments...]

### get

The `get` command simply extracts a portion of a YAML file and outputs
it to stdout.

### set

The `set` commnd is the opposite of `get` in that it lets you change
a portion of a YAML file. By defult the changed YAML document will go
to stdout, using the `-s/--save` option rewrites the file with the change.

### sort

The `sort` command can be used to sort portions of a YAML document.

### slurp

The `slurp` command takes a directory and converts it's contents into a YAML file.

### splat

The `splat` command take a YAML file and converts it into a file directory structure.
It is essentially the opposite of slurp.

### edit

Edit will open a YAML file for editing in the default editor (as defined by 
$EDITOR), and allow you to edit it.

If instead you edit a directory, then the directory will be automatically 
slurped into a temporary file. After editing the temporary file will be
splatted back out to update the directory and it's files.

### view

Outputs a colorized rendering of the YAML file.


## Requirements

YAML Command uses the [ANSI](http://rubyworks.github.com/ansi) library for handling console colorization.


## Copyrights

Copyright (c) 2011 Rubyworks. All rights reserved.

YAML Comamnd may be distributed in accordance with the **BSD-2-Clause** license.

See the LICENSE.txt file for details.
